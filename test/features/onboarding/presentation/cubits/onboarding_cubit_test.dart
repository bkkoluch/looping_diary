import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/features/onboarding/domain/use_cases/mark_onboarding_as_seen_use_case.dart';
import 'package:looping_diary/features/onboarding/presentation/cubits/onboarding_cubit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_mocks.dart';

void main() {
  late MarkOnboardingAsSeenUseCase markOnboardingAsSeenUseCase;
  late OnboardingCubit onboardingCubit;

  setUpAll(() {
    markOnboardingAsSeenUseCase = MockMarkOnboardingAsSeenUseCase();
    onboardingCubit = OnboardingCubit();

    getIt.registerFactoryAsync<MarkOnboardingAsSeenUseCase>(() async => markOnboardingAsSeenUseCase);
  });

  group('markOnboardingAsSeen', () {
    test(
      'should properly call MarkOnboardingAsSeenUseCase',
      () async {
        // Arrange
        when(() => markOnboardingAsSeenUseCase.call()).thenAnswer((_) async => null);

        // Act
        await onboardingCubit.markOnboardingAsSeen();

        // Assert
        verify(() => markOnboardingAsSeenUseCase.call()).called(1);
        verifyNoMoreInteractions(markOnboardingAsSeenUseCase);
      },
    );
  });
}
