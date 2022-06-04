import 'package:bloc/bloc.dart';
import 'package:looping_diary/core/cubits/cubit.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/features/onboarding/domain/use_cases/get_onboarding_seen_use_case.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.initial());

  void checkScreenToShow() async {
    final bool userSawOnboarding = (await getIt.getAsync<GetOnboardingSeenUseCase>())();

    if (!userSawOnboarding) {
      emit(state.copyWith(appStateStatus: AppStateStatus.showOnboarding));
    } else {
      emit(state.copyWith(appStateStatus: AppStateStatus.showHome));
    }
  }
}
