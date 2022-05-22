import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

enum AppStateStatus {
  idle,
  showOnboarding,
  showHome,
}

@freezed
class AppState with _$AppState {
  const AppState._();

  const factory AppState({required AppStateStatus appStateStatus}) = _AppState;

  factory AppState.initial() => const AppState(appStateStatus: AppStateStatus.idle);
}
