import 'package:dio/dio.dart';
import '../../data.dart';
import '../../utils/logs/app_logger.dart';
import 'logger_interceptor.dart';

class DioNetwork {
  static late Dio appAPI;

  static void initDio(){
    appAPI = Dio(baseOptions(endpoint));
    appAPI.interceptors.add(loggerInterceptor());
    appAPI.interceptors.add(interceptorsWrapper());

  }

  static LoggerInterceptor loggerInterceptor() {
    return LoggerInterceptor(
      logger,
      request: true,
      requestBody: true,
      error: true,
      responseBody: true,
      responseHeader: false,
      requestHeader: true,
    );
  }

  ///__________App__________///
  /// App interceptor
  static InterceptorsWrapper interceptorsWrapper() {
    return InterceptorsWrapper(
      onRequest: (RequestOptions options, r) async {

        return r.next(options);
      },
      onResponse: (response, handler) async {
        if ("${(response.data["code"] ?? "0")}" != "0") {
          return handler.resolve(response);
        } else {
          return handler.next(response);
        }
      },
      onError: (error, handler) {
        try {
          return handler.next(error);
        } catch (e) {
          return handler.reject(error);
          // onUnexpectedError(handler, error);
        }
      },
    );
  }

  static BaseOptions baseOptions(String url) {

    return BaseOptions(
        baseUrl: url,
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        validateStatus: (s) {
          return s! < 300;
        },
        responseType: ResponseType.json);
  }
}
