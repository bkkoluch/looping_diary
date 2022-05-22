import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/onboarding/data/repositories/onboarding_repository.dart';
import 'package:looping_diary/features/onboarding/domain/use_cases/mark_onboarding_as_seen_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_mocks.dart';

void main() {
  late OnboardingRepository onboardingRepository;
  late MarkOnboardingAsSeenUseCase markOnboardingAsSeenUseCase;

  setUpAll(() {
    onboardingRepository = MockOnboardingRepository();

    markOnboardingAsSeenUseCase = MarkOnboardingAsSeenUseCase(onboardingRepository);
  });

  test(
    'should properly call repository',
    () async {
      // arrange
      when(() => onboardingRepository.markOnboardingAsSeen()).thenAnswer((_) async => null);

      // act
      await markOnboardingAsSeenUseCase.call();

      // assert
      verify(() => onboardingRepository.markOnboardingAsSeen()).called(1);
    },
  );
}
