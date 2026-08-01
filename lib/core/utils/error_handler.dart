import 'package:flutter/foundation.dart';
import 'logger.dart';

class ErrorHandler {
  ErrorHandler._();

  static void initialize() {
    FlutterError.onError = (FlutterErrorDetails details) {
      appLogger.e('Flutter Error', error: details.exception, stackTrace: details.stack);
    };

    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      appLogger.e('Platform Dispatcher Error', error: error, stackTrace: stack);
      return true;
    };
  }
}
