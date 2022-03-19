import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/services/analytics/crash_reporting_service.dart';

class ServerException implements Exception {
  ServerException(this.description, {this.error, this.stackTrace}) {
    getIt<CrashReportingService>().logError(
      _formattedDescription,
      exception: ServerException,
      stackTrace: stackTrace,
    );
  }

  final StackTrace? stackTrace;
  final String description;
  final dynamic error;

  String get _formattedDescription {
    if (error == null) {
      return description;
    } else {
      return '$description: $error';
    }
  }
}
