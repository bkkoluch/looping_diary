import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:looping_diary/utils/log.dart';

class CrashReportingService {
  CrashReportingService(this._firebaseCrashlytics) {
    _setCrashlyticsCollectionEnabled();
  }

  static CrashReportingService? _instance;

  final FirebaseCrashlytics _firebaseCrashlytics;

  static CrashReportingService getInstance() => _instance ??= CrashReportingService(FirebaseCrashlytics.instance);

  Future<void> _setCrashlyticsCollectionEnabled() async {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  // TODO: Hook it up when Dio errors and other places I want to track will be ready
  void logError(String? errorDescription, {dynamic exception, StackTrace? stackTrace}) {
    _firebaseCrashlytics.recordError(
      exception ?? '<<< No exception provided for crash logs >>>',
      stackTrace ?? StackTrace.current,
      reason: "\n<<< ${errorDescription ?? "No error description provided for crash logs"} >>>",
      printDetails: Log.isLoggingOn,
    );
  }
}
