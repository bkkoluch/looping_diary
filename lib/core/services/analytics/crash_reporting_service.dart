import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class CrashReportingService {
  CrashReportingService(this._firebaseCrashlytics) {
    _setCrashlyticsCollectionEnabled();
  }

  final FirebaseCrashlytics _firebaseCrashlytics;

  Future<void> _setCrashlyticsCollectionEnabled() async {
    await _firebaseCrashlytics.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = _firebaseCrashlytics.recordFlutterError;
  }

  // TODO: Hook it up when Dio errors and other places I want to track will be ready
  void logError(String? errorDescription, {dynamic exception, StackTrace? stackTrace}) {
    _firebaseCrashlytics.recordError(
      exception ?? '<<< No exception provided for crash logs >>>',
      stackTrace ?? StackTrace.current,
      reason: "\n<<< ${errorDescription ?? "No error description provided for crash logs"} >>>",
    );
  }

// void logFatalError(dynamic error, {StackTrace? stackTrace, String? reason}) {
//   unawaited(
//     FirebaseCrashlytics.instance.recordError(
//       Exception(error),
//       stackTrace,
//       reason: reason,
//       fatal: true,
//       printDetails: false,
//     ),
//   );
// }
//
// void logNonFatalError(dynamic error, {StackTrace? stackTrace, String? reason}) {
//   unawaited(
//     FirebaseCrashlytics.instance.recordError(
//       Exception(error),
//       stackTrace,
//       reason: reason,
//       printDetails: false,
//     ),
//   );
// }
}
