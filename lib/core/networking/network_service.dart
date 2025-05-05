import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';
import 'package:lints_localization_assignment9/core/networking/network_constants.dart';
import 'package:lints_localization_assignment9/core/utils/enums/method_enum.dart';
import 'package:logger/logger.dart';

import 'failure_constants.dart';

class NetworkService {
  late final Dio _dio;
  late Logger _logger;

  NetworkService() {
    final header = {'Content-Type': NetworkConstants.contentType};

    final BaseOptions baseOptions = BaseOptions(
      baseUrl: NetworkConstants.baseUrl,
      connectTimeout: NetworkConstants.connectTimeout,
      receiveTimeout: NetworkConstants.receiveTimeout,
      headers: header,
    );

    _dio = Dio(baseOptions);
    _logger = Logger();
    initInterceptors();
  }

  void initInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: onRequest,
      onResponse: onResponse,
      onError: onError,
    ));
  }

  dynamic onRequest(RequestOptions requestOptions, handler) {
    _logger.i(
      'Request: ${requestOptions.method} Path: ${'${NetworkConstants.baseUrl}/${requestOptions.path}'}\n'
      'Data: ${requestOptions.data}',
    );
    return handler.next(requestOptions);
  }

  dynamic onResponse(Response response, handler) {
    _logger.i(
      'Response: ${response.requestOptions.method} Path: ${response.requestOptions.path}\n'
      'Status Code: ${response.statusCode}\n'
      'Data: ${response.data}',
    );
    return handler.next(response);
  }

  dynamic onError(DioException err, handler) {
    _logger.e(
      'Error: ${err.response?.requestOptions.method} Path: ${err.response?.requestOptions.path}\n'
      'Status Code: ${err.response?.statusCode}\n'
      'Message: ${err.response?.statusMessage}',
    );
    return handler.next(err);
  }

  // Future<void> getProducts(String endpoint) async {
  //   try {
  //     final response = await _dio.get(
  //       endpoint,
  //       // '/users?page=2',
  //       // options: Options(headers: {'Authorization': 'xyzToken'}),
  //       // queryParameters: {'category': 'xyzCategory'},
  //       // data: {'email': 'gvishnu@gmail.com'},
  //
  //     );
  //
  //     print(response.data);
  //     return response.data;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<Either<Failure, Response<dynamic>>> request(
    String endpoint, {
    required Method method,
    Map<String, dynamic>? queryParams,
  }) async {
    Response response;

    try {
      switch (method) {
        case Method.get:
          response = await _dio.get(endpoint, queryParameters: queryParams);
          break;
      }

      if (response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(response);
        } else if (response.statusCode! >= 400 && response.statusCode! < 500) {
          return Left(ServiceFailure(
              message: '${TextConstants.clientError} ${response.statusCode}'));
        } else if (response.statusCode! >= 500 && response.statusCode! < 600) {
          return Left(ServiceFailure(
              message: '${TextConstants.serverError} ${response.statusCode}'));
        } else {
          return Left(ServiceFailure(
              message:
                  '${TextConstants.unexpectedError} ${response.statusCode}'));
        }
      } else {
        return Left(ServiceFailure(message: TextConstants.noStatusCode));
      }
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }
}
