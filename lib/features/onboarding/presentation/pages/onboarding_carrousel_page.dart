import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ld_ui/ld_ui.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/services/navigation/navigation_service.gr.dart';
import 'package:looping_diary/core/style/lotties.dart';
import 'package:looping_diary/features/onboarding/presentation/cubits/cubit.dart';
import 'package:looping_diary/res/strings.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

part '_onboarding_carrousel_widgets.dart';

class OnboardingCarrouselPage extends StatefulWidget {
  const OnboardingCarrouselPage({Key? key}) : super(key: key);

  @override
  State<OnboardingCarrouselPage> createState() => _OnboardingCarrouselState();
}

class _OnboardingCarrouselState extends State<OnboardingCarrouselPage> {
  final PageController pageController = PageController();
  final OnboardingCubit cubit = getIt<OnboardingCubit>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: pageController,
              children: [
                OnboardingPage(
                  onPressed: _goToNextPage,
                  asset: Lotties.makingNotesFemale,
                  pageIndex: 0,
                  pageController: pageController,
                ),
                OnboardingPage(
                  onPressed: _goToNextPage,
                  asset: Lotties.question,
                  pageIndex: 1,
                  pageController: pageController,
                ),
                OnboardingPage(
                  onPressed: _pushAuthGateAndMarkOnboardingAsSeen,
                  asset: Lotties.makingNotesMale,
                  pageIndex: 2,
                  pageController: pageController,
                ),
              ],
            ),
            PositionedDirectional(
              start: 0,
              end: 0,
              bottom: CoreDimensions.paddingXL * 2,
              child: OnboardingPagePageIndicator(pageController: pageController),
            ),
          ],
        ),
      );

  void _goToNextPage() => pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

  void _pushAuthGateAndMarkOnboardingAsSeen() {
    cubit.markOnboardingAsSeen();
    context.router.replace(const AuthGateRoute());
  }
}
