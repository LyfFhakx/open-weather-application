import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:open_weather_application/src/utils/logs/log.dart';

class AppLogger{
  static void loggingError() {
    Logger.root.level = Level.ALL;
    Logger.root.onRecord.listen((record) {
      if (kDebugMode) {
        if ([TargetPlatform.iOS, TargetPlatform.macOS]
            .contains(defaultTargetPlatform)) {
          log(record.colorMessage, name: record.loggerName);
          return;
        } else {
          print(record.colorMessage);
        }
      }
    });
  }
}