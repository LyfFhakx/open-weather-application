import 'package:dio/dio.dart';
import 'dart:convert';

import '../../utils/logs/log.dart';
import 'dio_log_settings.dart';

const encoder = JsonEncoder.withIndent('  ');

class DioLogInterceptor extends Interceptor {
  DioLogInterceptor(this.settings);

  final DioLogSettings settings;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    super.onRequest(options, handler);
    final accepted = settings.requestFilter?.call(options) ?? true;
    if (!accepted || !settings.printRequestLog) {
      return;
    }

    final message = '${options.uri}';
    final httpLog = DioRequestLog(
      message,
      requestOptions: options,
      settings: settings,
    );
    Log.info(httpLog.generateTextMessage());
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    final accepted = settings.responseFilter?.call(response) ?? true;
    if (!accepted || !settings.printResponseLog) {
      return;
    }

    final message = '${response.requestOptions.uri}';
    final httpLog = DioResponseLog(
      message,
      settings: settings,
      response: response,
    );
    Log.info(httpLog.generateTextMessage());
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    if (settings.printErrorLog) {
      final message = '${err.requestOptions.uri}';
      final httpErrorLog = DioErrorLog(
        message,
        dioException: err,
        settings: settings,
      );
      Log.warning(httpErrorLog.generateTextMessage());
    }
  }
}

abstract class DioLogging {
  DioLogging(this.title, {required this.message});
  final String title;

  final String message;
  String generateTextMessage();
}

class DioRequestLog extends DioLogging {
  DioRequestLog(
    String message, {
    required this.requestOptions,
    required this.settings,
  }) : super('request', message: message);

  final RequestOptions requestOptions;
  final DioLogSettings settings;

  @override
  String generateTextMessage() {
    var msg = '[$title] [${requestOptions.method}] $message';

    final data = requestOptions.data;
    final headers = requestOptions.headers;

    if (settings.printRequestData && data != null) {
      final prettyData = encoder.convert(data);
      msg += '\nData: $prettyData';
    }
    if (settings.printRequestHeaders && headers.isNotEmpty) {
      final prettyHeaders = encoder.convert(headers);
      msg += '\nHeaders: $prettyHeaders';
    }

    return msg;
  }
}

class DioResponseLog extends DioLogging {
  DioResponseLog(
    String message, {
    required this.response,
    required this.settings,
  }) : super('response', message: message);

  final Response<dynamic> response;
  final DioLogSettings settings;

  @override
  String generateTextMessage() {
    var msg = '[$title] [${response.requestOptions.method}] $message';

    final responseMessage = response.statusMessage;
    final data = response.data;
    final headers = response.headers.map;

    msg += '\nStatus: ${response.statusCode}';

    if (settings.printResponseMessage && responseMessage != null) {
      msg += '\nMessage: $responseMessage';
    }

    if (settings.printResponseData && data != null) {
      final prettyData = encoder.convert(data);
      msg += '\nData: $prettyData';
    }
    if (settings.printResponseHeaders && headers.isNotEmpty) {
      final prettyHeaders = encoder.convert(headers);
      msg += '\nHeaders: $prettyHeaders';
    }

    return msg;
  }
}

class DioErrorLog extends DioLogging {
  DioErrorLog(
    String message, {
    required this.dioException,
    required this.settings,
  }) : super('error', message: message);

  final DioException dioException;
  final DioLogSettings settings;

  @override
  String generateTextMessage() {
    var msg = '[$title] [${dioException.requestOptions.method}] $message';

    final responseMessage = dioException.message;
    final statusCode = dioException.response?.statusCode;
    final data = dioException.response?.data;
    final headers = dioException.requestOptions.headers;

    if (statusCode != null) {
      msg += '\nStatus: ${dioException.response?.statusCode}';
    }
    msg += '\nMessage: $responseMessage';

    if (data != null) {
      final prettyData = encoder.convert(data);
      msg += '\nData: $prettyData';
    }
    if (headers.isNotEmpty) {
      final prettyHeaders = encoder.convert(headers);
      msg += '\nHeaders: $prettyHeaders';
    }
    return msg;
  }
}
