import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:looping_diary/features/onboarding/data/data_sources/onboarding_local_data_source_impl.dart';
import 'package:looping_diary/utils/shared_prefs_keys.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../test_setup.dart';

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
        // Arrange
        when(() => sharedPreferences.setBool(captureAny(), captureAny())).thenAnswer((_) async => true);

        // Act
        await onboardingLocalDataSourceImpl.markOnboardingAsSeenLocally();

        // Assert
        verify(() => sharedPreferences.setBool(SharedPrefsKeys.onboardingSeen(), true)).called(1);
        verifyNoMoreInteractions(sharedPreferences);
      },
    );
  });

  group('getOnboardingSeen', () {
    test(
      'should return false if SharedPreferences returns null',
      () async {
        // Arrange
        when(() => sharedPreferences.getBool(captureAny())).thenAnswer((_) => null);

        // Act
        final result = onboardingLocalDataSourceImpl.getOnboardingSeen();

        // Assert
        expect(result, false);
        verify(() => sharedPreferences.getBool(SharedPrefsKeys.onboardingSeen())).called(1);
      },
    );

    test(
      'should return true if SharedPreferences returns true',
      () async {
        // Arrange
        when(() => sharedPreferences.getBool(captureAny())).thenAnswer((_) => true);

        // Act
        final result = onboardingLocalDataSourceImpl.getOnboardingSeen();

        // Assert
        expect(result, isTrue);
        verify(() => sharedPreferences.getBool(SharedPrefsKeys.onboardingSeen())).called(1);
      },
    );
  });
}
