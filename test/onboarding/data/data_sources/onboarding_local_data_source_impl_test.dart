import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:looping_diary/features/onboarding/data/data_sources/onboarding_local_data_source_impl.dart';
import 'package:looping_diary/utils/shared_prefs_keys.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../test_setup.dart';

void main() {
  late SharedPreferences sharedPreferences;
  late OnboardingLocalDataSource onboardingLocalDataSourceImpl;

  setUpAll(() {
    sharedPreferences = MockSharedPreferences();
    onboardingLocalDataSourceImpl = OnboardingLocalDataSourceImpl(sharedPreferences);
  });

  group('markOnboardingAsSeenLocally', () {
    test(
      'should correctly set onboardingSeen variable in SharedPreferences',
      () async {
        // arrange
        when(() => sharedPreferences.setBool(captureAny(), captureAny())).thenAnswer((_) async => true);

        // act
        await onboardingLocalDataSourceImpl.markOnboardingAsSeenLocally();

        // assert
        verify(() => sharedPreferences.setBool(SharedPrefsKeys.onboardingSeen(), true)).called(1);
        verifyNoMoreInteractions(sharedPreferences);
      },
    );
  });

  group('getOnboardingSeen', () {
    test(
      'should return false if SharedPreferences returns null',
      () async {
        // arrange
        when(() => sharedPreferences.getBool(captureAny())).thenAnswer((_) => null);

        // act
        final result = onboardingLocalDataSourceImpl.getOnboardingSeen();

        // assert
        expect(result, false);
        verify(() => sharedPreferences.getBool(SharedPrefsKeys.onboardingSeen())).called(1);
      },
    );

    test(
      'should return true if SharedPreferences returns true',
      () async {
        // arrange
        when(() => sharedPreferences.getBool(captureAny())).thenAnswer((_) => true);

        // act
        final result = onboardingLocalDataSourceImpl.getOnboardingSeen();

        // assert
        expect(result, isTrue);
        verify(() => sharedPreferences.getBool(SharedPrefsKeys.onboardingSeen())).called(1);
      },
    );
  });
}
