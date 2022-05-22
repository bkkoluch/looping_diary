import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/onboarding/data/data_sources/onboarding_local_data_source.dart';
import 'package:looping_diary/features/onboarding/data/data_sources/onboarding_remote_data_source.dart';
import 'package:looping_diary/features/onboarding/data/repositories/onboarding_repository.dart';
import 'package:looping_diary/features/onboarding/domain/repositories/onboarding_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_mocks.dart';

void main() {
  late OnboardingRemoteDataSource onboardingRemoteDataSource;
  late OnboardingLocalDataSource onboardingLocalDataSource;
  late OnboardingRepository onboardingRepository;

  setUpAll(() {
    onboardingLocalDataSource = MockOnboardingLocalDataSource();
    onboardingRemoteDataSource = MockOnboardingRemoteDataSource();

    onboardingRepository = OnboardingRepositoryImpl(onboardingRemoteDataSource, onboardingLocalDataSource);
  });

  group('markOnboardingAsSeen', () {
    test(
      'should properly call remote data sources',
      () async {
        // arrange
        when(() => onboardingLocalDataSource.markOnboardingAsSeenLocally()).thenAnswer((_) async => null);
        when(() => onboardingRemoteDataSource.markOnboardingAsSeenRemotely()).thenAnswer((_) async => null);

        // act
        await onboardingRepository.markOnboardingAsSeen();

        // assert
        verify(() => onboardingLocalDataSource.markOnboardingAsSeenLocally()).called(1);
        verify(() => onboardingRemoteDataSource.markOnboardingAsSeenRemotely()).called(1);
      },
    );
  });
}
