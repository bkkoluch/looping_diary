import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:looping_diary/features/onboarding/data/repositories/onboarding_repository.dart';
import 'package:looping_diary/features/onboarding/domain/repositories/onboarding_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_mocks.dart';

void main() {
  late OnboardingLocalDataSource onboardingLocalDataSource;
  late OnboardingRepository onboardingRepository;

  setUpAll(() {
    onboardingLocalDataSource = MockOnboardingLocalDataSource();

    onboardingRepository = OnboardingRepositoryImpl(onboardingLocalDataSource);
  });

  group('markOnboardingAsSeen', () {
    test(
      'should properly call remote data sources',
      () async {
        // Arrange
        when(() => onboardingLocalDataSource.markOnboardingAsSeenLocally()).thenAnswer((_) async => null);

        // Act
        await onboardingRepository.markOnboardingAsSeen();

        // Assert
        verify(() => onboardingLocalDataSource.markOnboardingAsSeenLocally()).called(1);
      },
    );
  });
}
