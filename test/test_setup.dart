import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/localizer/localizer.dart';
import 'package:looping_diary/core/network/firebase_rest_client.dart';
import 'package:looping_diary/core/services/analytics/crash_reporting_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  getIt
    ..registerSingleton<CrashReportingService>(MockCrashReportingService())
    ..registerSingleton<FirebaseCrashlytics>(MockFirebaseCrashlytics())
    ..registerSingleton<FirebaseRestClient>(MockFirebaseRestClient())
    ..registerSingleton<SharedPreferences>(MockedSharedPreferences());
}

void baseTearDown() => getIt.reset();

// Base mocked services
class MockCrashReportingService extends Mock implements CrashReportingService {}

class MockFirebaseCrashlytics extends Mock implements FirebaseCrashlytics {}

class MockFirebaseRestClient extends Mock implements FirebaseRestClient {}

class MockedSharedPreferences extends Mock implements SharedPreferences {}

class MockFirebaseInstance extends Mock implements FirebaseAuth {}

void registerFallbackValues() {
  registerFallbackValue(tNote);
  registerFallbackValue(tNoteDate);
  registerFallbackValue(tNoteDTO);
  registerFallbackValue(tNoteDateDTO);
}
