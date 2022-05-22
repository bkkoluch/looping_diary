import 'package:bloc/bloc.dart';
import 'package:looping_diary/core/cubits/cubit.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.initial());

  void checkScreenToShow() async {
    // if (!await (await getIt.getAsync<GetOnboardingSeenUseCase>())()) {
    emit(state.copyWith(appStateStatus: AppStateStatus.showOnboarding));
    // } else {
    //   emit(state.copyWith(appStateStatus: AppStateStatus.showHome));
    // }
  }
}
