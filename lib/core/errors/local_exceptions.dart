import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/services/analytics/crash_reporting_service.dart';

/// LocalException concrete objects
///
/// To be thrown when an error occurs in local operation
/// Ex.: when parsing JSON objects
class LocalException implements Exception {
  LocalException(this.description, {this.stackTrace}) {
    getIt<CrashReportingService>().logError(
      description,
      exception: LocalException,
      stackTrace: stackTrace,
    );
  }

  final String description;
  final StackTrace? stackTrace;
}
