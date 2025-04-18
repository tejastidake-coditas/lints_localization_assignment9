import 'package:dio/dio.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';
import 'network_constants.dart';

class Network {

  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: NetworkConstants.baseUrl,
        connectTimeout:
            Duration(seconds: TextConstants.networkResponseConnectTimeout),
        receiveTimeout:
            Duration(seconds: TextConstants.networkResponseReceiveTimeout),
      ),
    );

    dio.interceptors.addAll([
      _getLoggingInterceptor(),
    ]);

    return dio;
  }

  static Interceptor _getLoggingInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        print(
            "REQUEST => ${options.method} ${options.baseUrl}${options.path}");
        handler.next(options);
      },
      onResponse: (response, handler) {
        print(
            "RESPONSE => Status: ${response.statusCode}, Data: ${response.data}");
        handler.next(response);
      },
      onError: (error, handler) {
        print("ERROR => ${error.message}");
        handler.next(error);
      },
    );
  }
}
