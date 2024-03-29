import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looping_diary/core/cubits/cubit.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/features/login/presentation/auth_gate_page.dart';
import 'package:looping_diary/features/onboarding/presentation/pages/onboarding_carrousel_page.dart';
import 'package:looping_diary/features/startup/presentation/pages/loading_page.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({Key? key}) : super(key: key);

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  final AppCubit cubit = getIt<AppCubit>();

  @override
  void initState() {
    super.initState();
    cubit.checkScreenToShow();
  }

  @override
  Widget build(_) => BlocBuilder<AppCubit, AppState>(
        bloc: cubit,
        builder: (_, AppState state) {
          if (state.appStateStatus == AppStateStatus.idle) {
            return const LoadingPage();
          } else if (state.appStateStatus == AppStateStatus.showOnboarding) {
            return const OnboardingCarrouselPage();
          } else if (state.appStateStatus == AppStateStatus.showHome) {
            return const AuthGatePage();
          }

          // Should never happen
          return const SizedBox.shrink();
        },
      );
}
