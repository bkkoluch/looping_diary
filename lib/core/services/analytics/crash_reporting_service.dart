import 'dart:async';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class CrashReportingService {
  CrashReportingService(this._firebaseCrashlytics) {
    _setCrashlyticsCollectionEnabled();
  }

  final FirebaseCrashlytics _firebaseCrashlytics;

  Future<void> _setCrashlyticsCollectionEnabled() async {
    await _firebaseCrashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);
    FlutterError.onError = _firebaseCrashlytics.recordFlutterError;
  }

  void logError(
    String? errorDescription, {
    required StackTrace? stackTrace,
    dynamic exception,
    bool isFatal = false,
  }) {
    _firebaseCrashlytics.recordError(
      exception ?? 'No exception provided',
      stackTrace,
      reason: errorDescription ?? 'No error description provided',
      fatal: isFatal,
    );
  }
}
