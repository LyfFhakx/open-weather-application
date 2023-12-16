import 'package:logging/logging.dart';

final _logger = Logger('AppLog');

abstract final class Log {
  /// Logs an error message [message] with optional [object]
  /// and [stackTrace] to the log.
  static void error(Object? message, [Object? object, StackTrace? stackTrace]) {
    _logger.severe(message, object, stackTrace);
  }

  /// Logs a warning message [message] with optional [object]
  /// and [stackTrace] to the log.
  static void warning(Object? message,
      [Object? error, StackTrace? stackTrace]) {
    _logger.warning(message, error, stackTrace);
  }

  /// Logs an info message [message] with optional [object]
  /// and [stackTrace] to the log.
  static void info(Object? message, [Object? error, StackTrace? stackTrace]) {
    _logger.info(message, error, stackTrace);
  }

  /// Logs a config message [message] with optional [object]
  /// and [stackTrace] to the log.
  static void config(Object? message, [Object? error, StackTrace? stackTrace]) {
    _logger.config(message, error, stackTrace);
  }

  /// Logs a msg message [message] with optional [object]
  /// and [stackTrace] to the log.
  static void msg(Object? message, [Object? error, StackTrace? stackTrace]) {
    _logger.fine(message, error, stackTrace);
  }
}

extension LogRecordColorized on LogRecord {
  String get colorMessage {
    int colorIndex = 0;
    if (level == Level.CONFIG) {
      colorIndex = 35;
    } else if (level == Level.WARNING) {
      colorIndex = 33;
    } else if (level == Level.SEVERE) {
      colorIndex = 31;
    } else if (level == Level.INFO) {
      colorIndex = 32;
    }

    final stError = stackTrace != null ? "\nST:$stackTrace" : "";

    return '\x1B[${colorIndex}m[${level.name}] '
        '${time.day}.${time.month}.${time.year} '
        '${time.hour}:${time.minute}:${time.second}'
        '${error ?? ''} | msg: $message$stError\x1B[0m';
  }
}
