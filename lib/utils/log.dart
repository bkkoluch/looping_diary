import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Log {
  Log._();

  static final bool isLoggingOn = kDebugMode; // add || production mode

  static final Logger _logger = Logger(
    filter: _LogFilter(),
    printer: PrettyPrinter(methodCount: 0, printTime: true),
  );

  static void d(String message) => _logger.d(message);

  static void e(String message) => _logger.e(message);

  static void i(String message) => _logger.i(message);

  static void v(String message) => _logger.v(message);

  static void w(String message) => _logger.w(message);
}

class _LogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) => Log.isLoggingOn;
}
