import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lints_localization_assignment9/core/constants/failure_constants.dart';
import 'package:lints_localization_assignment9/core/enums/method_enum.dart';
import 'package:lints_localization_assignment9/core/networking/network_constants.dart';
import 'package:logger/logger.dart';

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
    initInterceptors(); // Initialize interceptors
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
      '======> REQUEST[${requestOptions.method}] => PATH: ${'${NetworkConstants.baseUrl}/${requestOptions.path}'}\n'
      '- REQUEST VALUES: ${requestOptions.queryParameters}\n'
      '- HEADERS: ${requestOptions.headers} \n'
      '- DATA: ${requestOptions.data.toString()}',
    );
    return handler.next(requestOptions);
  }

  dynamic onResponse(Response response, handler) {
    _logger.i(
      '<====== RESPONSE[${response.requestOptions.method}] PATH: ${response.requestOptions.path}\n'
      '- Status Code: [${response.statusCode}]\n'
      '- DATA: ${response.data}',
    );
    return handler.next(response);
  }

  dynamic onError(DioException err, handler) {
    _logger.e(
      '<====== Error[${err.response?.requestOptions.method}] PATH: ${err.response?.requestOptions.path}\n'
      '- Status Code: [${err.response?.statusCode}]\n'
      '- MESSAGE: ${err.response?.statusMessage}',
    );
    return handler.next(err);
  }

  // request method that handles GET & POST
  Future<Either<Failure, Response<dynamic>>> request(
    String endpoint, {
    required Method method,
    dynamic data,
    Map<String, dynamic>? queryParams,
  }) async {
    Response response;

    try {
      switch (method) {
        case Method.get:
          response = await _dio.get(endpoint, queryParameters: queryParams);
          break;
        // case Method.post:
        //   response = await _dio.post(endpoint, data: data);
        //   break;
      }

      // Handle status codes
      if (response.statusCode != null) {
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(response); // Successful response
        } else if (response.statusCode! >= 400 && response.statusCode! < 500) {
          return Left(
              ServiceFailure(message: 'Client error: ${response.statusCode}'));
        } else if (response.statusCode! >= 500 && response.statusCode! < 600) {
          return Left(
              ServiceFailure(message: 'Server error: ${response.statusCode}'));
        } else {
          return Left(ServiceFailure(
              message: 'Unexpected error: ${response.statusCode}'));
        }
      } else {
        return Left(ServiceFailure(message: 'No status code received'));
      }
    } catch (e) {
      return Left(UnexpectedFailure());
    }
  }
}
