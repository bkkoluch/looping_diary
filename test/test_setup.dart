import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/localizer/localizer.dart';
import 'package:looping_diary/core/services/analytics/crash_reporting_service.dart';
import 'package:mocktail/mocktail.dart';

import 'firebase_test_setup.dart';
import 'test_data.dart';

Widget prepareTestableWidget(Widget child) => MaterialApp(
      locale: const Locale('en'),
      supportedLocales: supportedLocales,
      localizationsDelegates: const [],
      home: child,
    );

Future<void> baseSetup() async {
  registerFallbackValues();
  await setupFirebaseMocks();

  getIt.registerSingleton<CrashReportingService>(MockCrashReportingService());
  final FirebaseCrashlytics _mockFirebaseCrashlytics = MockFirebaseCrashlytics();
  getIt.registerSingleton<FirebaseCrashlytics>(_mockFirebaseCrashlytics);
}

void baseTearDown() => getIt.reset();

// Base mocked services
class MockCrashReportingService extends Mock implements CrashReportingService {}

class MockFirebaseCrashlytics extends Mock implements FirebaseCrashlytics {}

void registerFallbackValues() {
  registerFallbackValue(tNoteDto);
  registerFallbackValue(tNoteDateDto);
}
