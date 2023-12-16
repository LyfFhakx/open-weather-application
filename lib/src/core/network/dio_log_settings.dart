import 'package:dio/dio.dart';

class DioLogSettings {
  const DioLogSettings({
    this.printResponseData = true,
    this.printResponseHeaders = false,
    this.printResponseMessage = true,
    this.printRequestData = true,
    this.printRequestHeaders = false,
    this.printRequestLog = true,
    this.printResponseLog = true,
    this.printErrorLog = true,
    this.requestFilter,
    this.responseFilter,
  });

  /// Print [response.data] if true
  final bool printResponseData;

  /// Print [response.headers] if true
  final bool printResponseHeaders;

  /// Print [response.statusMessage] if true
  final bool printResponseMessage;

  /// Print [request.data] if true
  final bool printRequestData;

  /// Print [request.headers] if true
  final bool printRequestHeaders;

  final bool printRequestLog;

  final bool printResponseLog;

  final bool printErrorLog;

  /// For request filtering.
  /// You can add your custom logic to log only specific HTTP requests [RequestOptions].
  final bool Function(RequestOptions requestOptions)? requestFilter;

  /// For response filtering.
  /// You can add your custom logic to log only specific HTTP responses [Response].
  final bool Function(Response response)? responseFilter;

  DioLogSettings copyWith({
    bool? printResponseData,
    bool? printResponseHeaders,
    bool? printResponseMessage,
    bool? printRequestData,
    bool? printRequestHeaders,
    bool? printRequestLog,
    bool? printResponseLog,
    bool? printErrorLog,
    bool Function(RequestOptions requestOptions)? requestFilter,
    bool Function(Response response)? responseFilter,
  }) {
    return DioLogSettings(
        printResponseData: printResponseData ?? this.printResponseData,
        printResponseHeaders: printResponseHeaders ?? this.printResponseHeaders,
        printResponseMessage: printResponseMessage ?? this.printResponseMessage,
        printRequestData: printRequestData ?? this.printRequestData,
        printRequestHeaders: printRequestHeaders ?? this.printRequestHeaders,
        requestFilter: requestFilter ?? this.requestFilter,
        responseFilter: responseFilter ?? this.responseFilter,
        printErrorLog: printErrorLog ?? this.printErrorLog,
        printRequestLog: printRequestLog ?? this.printRequestLog,
        printResponseLog: printResponseLog ?? this.printResponseLog);
  }
}
