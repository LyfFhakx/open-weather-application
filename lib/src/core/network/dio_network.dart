import 'package:dio/dio.dart';
import 'package:open_weather_application/src/core/network/dio_log_interceptor.dart';
import '../../data.dart';

import 'dio_log_settings.dart';

class DioNetwork {
  static late Dio appAPI;

  static void initDio(){
    appAPI = Dio(baseOptions(endpoint));
    appAPI.interceptors.add(DioLogInterceptor(const DioLogSettings()));
    appAPI.interceptors.add(interceptorsWrapper());

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
