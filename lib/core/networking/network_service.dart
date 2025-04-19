import 'package:dio/dio.dart';
import 'package:lints_localization_assignment9/core/networking/network_constants.dart';

class NetworkService {
  late final Dio _dio;

  NetworkService() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: NetworkConstants.baseUrl,
      connectTimeout: NetworkConstants.connectTimeout,
      receiveTimeout: NetworkConstants.receiveTimeout,
      headers: {'Content-Type': NetworkConstants.contentType},
    );

    _dio = Dio(baseOptions);
    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  // get request
  Future<Response<dynamic>> get(
      String endpoint, {
        Map<String, dynamic>? queryParams,
      }) async {
    return await _dio.get(endpoint, queryParameters: queryParams);
  }

  // post request
  Future<Response<dynamic>> post(String endpoint, {dynamic data}) async {
    return await _dio.post(endpoint, data: data);
  }
}
