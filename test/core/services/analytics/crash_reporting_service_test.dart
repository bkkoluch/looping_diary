import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/services/analytics/crash_reporting_service.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_setup.dart';

void main() {
  late CrashReportingService crashReportingService;
  late FirebaseCrashlytics firebaseCrashlytics;

  const String tMessage = 'Some message';
  const StackTrace tStackTrace = StackTrace.empty;
  final Exception tException = Exception('Random exception');

  setUp(() async {
    await baseSetup();
    firebaseCrashlytics = getIt<FirebaseCrashlytics>();
    when(() => firebaseCrashlytics.setCrashlyticsCollectionEnabled(captureAny())).thenAnswer((_) async => null);
    crashReportingService = CrashReportingService(firebaseCrashlytics);

    when(
      () => firebaseCrashlytics.recordError(
        captureAny(),
        captureAny(),
        reason: any(named: 'reason'),
        information: any(named: 'information'),
        printDetails: any(named: 'printDetails'),
        fatal: any(named: 'fatal'),
      ),
    ).thenAnswer((_) async => null);
  });

  tearDown(baseTearDown);

  test(
    'should make a call to FirebaseCrashlytics when logError is invoked -- null errorDescription and no exception',
    () {
      // Arrange

      // Act
      crashReportingService.logError(null, stackTrace: tStackTrace);

      // Assert
      verify(() => firebaseCrashlytics.setCrashlyticsCollectionEnabled(true)).called(1);
      verify(
        () => firebaseCrashlytics.recordError(
          '<<< No exception provided for crash logs >>>',
          tStackTrace,
          reason: '\n<<< No error description provided for crash logs >>>',
        ),
      ).called(1);
    },
  );

  test(
    'should make a call to FirebaseCrashlytics when logError is invoked -- non null errorDescription and with exception',
    () async {
      // Arrange

      // Act
      crashReportingService.logError(
        tMessage,
        stackTrace: tStackTrace,
        exception: tException,
      );

      // Assert
      verify(() => firebaseCrashlytics.setCrashlyticsCollectionEnabled(true)).called(1);
      verify(
        () => firebaseCrashlytics.recordError(
          tException,
          tStackTrace,
          reason: '\n<<< $tMessage >>>',
        ),
      ).called(1);
    },
  );
}
