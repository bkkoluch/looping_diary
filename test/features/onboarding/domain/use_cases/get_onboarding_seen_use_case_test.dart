import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/onboarding/data/repositories/onboarding_repository.dart';
import 'package:looping_diary/features/onboarding/domain/use_cases/get_onboarding_seen_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_mocks.dart';

void main() {
  late OnboardingRepository onboardingRepository;
  late GetOnboardingSeenUseCase getOnboardingSeenUseCase;

  setUpAll(() {
    onboardingRepository = MockOnboardingRepository();
    getOnboardingSeenUseCase = GetOnboardingSeenUseCase(onboardingRepository);
  });

  test(
    'should properly call repository and return a value',
    () async {
      // Arrange
      when(() => onboardingRepository.getOnboardingSeen()).thenAnswer((_) => true);

      // Act
      final result = getOnboardingSeenUseCase.call();

      // Assert
      verify(() => onboardingRepository.getOnboardingSeen()).called(1);
      expect(result, isTrue);
      verifyNoMoreInteractions(onboardingRepository);
    },
  );
}
