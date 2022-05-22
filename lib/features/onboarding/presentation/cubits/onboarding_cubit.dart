import 'package:bloc/bloc.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/features/onboarding/domain/use_cases/mark_onboarding_as_seen_use_case.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  Future<void> markOnboardingAsSeen() async => await (await getIt.getAsync<MarkOnboardingAsSeenUseCase>())();
}
