import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/core/cubits/cubit.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/features/onboarding/domain/use_cases/get_onboarding_seen_use_case.dart';
import 'package:mocktail/mocktail.dart';

import '../../test_mocks.dart';

void main() {
  final GetOnboardingSeenUseCase getOnboardingSeenUseCase = MockGetOnboardingSeenUseCase();

  setUpAll(() {
    getIt.registerFactoryAsync<GetOnboardingSeenUseCase>(() async => getOnboardingSeenUseCase);
  });

  final AppState initialState = AppState.initial();

  group('AppCubit::checkScreenToShow', () {
    blocTest<AppCubit, AppState>(
      'should emit correct state if user didn\'t see the onboarding',
      build: AppCubit.new,
      setUp: () => when(getOnboardingSeenUseCase).thenAnswer((_) => false),
      act: (cubit) => cubit.checkScreenToShow(),
      expect: () => [initialState.copyWith(appStateStatus: AppStateStatus.showOnboarding)],
    );

    blocTest<AppCubit, AppState>(
      'should emit correct state if user did see the onboarding',
      build: AppCubit.new,
      setUp: () => when(getOnboardingSeenUseCase).thenAnswer((_) => true),
      act: (cubit) => cubit.checkScreenToShow(),
      expect: () => [initialState.copyWith(appStateStatus: AppStateStatus.showHome)],
    );
  });
}
