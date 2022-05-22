import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/services/navigation/navigation_service.gr.dart';
import 'package:looping_diary/core/style/color_tokens.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/illustrations.dart';
import 'package:looping_diary/features/onboarding/presentation/cubits/onboarding_cubit.dart';
import 'package:looping_diary/res/strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingCarrousel extends StatefulWidget {
  const OnboardingCarrousel({Key? key}) : super(key: key);

  @override
  State<OnboardingCarrousel> createState() => _OnboardingCarrouselState();
}

class _OnboardingCarrouselState extends State<OnboardingCarrousel> {
  final PageController pageController = PageController();
  final OnboardingCubit cubit = getIt<OnboardingCubit>();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            PageView(
              // physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                OnboardingPage(
                  onPressed: _goToNextPage,
                  image: Illustrations.addNotes,
                  pageIndex: 0,
                  pageController: pageController,
                ),
                OnboardingPage(
                  onPressed: _goToNextPage,
                  image: Illustrations.takingNotes,
                  pageIndex: 1,
                  pageController: pageController,
                ),
                OnboardingPage(
                  onPressed: _pushAuthGateAndMarkOnboardingAsSeen,
                  image: Illustrations.personalNotebook,
                  pageIndex: 2,
                  pageController: pageController,
                ),
              ],
            ),
            OnboardingPagePageIndicator(pageController: pageController),
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

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    required this.onPressed,
    required this.image,
    required this.pageIndex,
    required this.pageController,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String image;
  final int pageIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(width: double.infinity, height: double.infinity, color: ColorTokens.brown),
          OnboardingPageIllustration(image: image, pageIndex: pageIndex),
          OnboardingPageTextContent(pageIndex: pageIndex),
          OnboardingPageButton(onPressed: onPressed, pageIndex: pageIndex),
        ],
      );
}

class OnboardingPageIllustration extends StatelessWidget {
  const OnboardingPageIllustration({
    required this.image,
    required this.pageIndex,
    Key? key,
  }) : super(key: key);

  final String image;
  final int pageIndex;

  @override
  Widget build(BuildContext context) => PositionedDirectional(
        top: CoreDimensions.onboardingImageTopPadding,
        end: pageIndex == 2 ? CoreDimensions.onboardingImageSidePadding : 0,
        start: pageIndex == 2 ? CoreDimensions.onboardingImageSidePadding : 0,
        child: SizedBox(
          width: CoreDimensions.onboardingImageWidth,
          height: CoreDimensions.onboardingImageHeight,
          child: SvgPicture.asset(image),
        ),
      );
}

class OnboardingPageTextContent extends StatelessWidget {
  const OnboardingPageTextContent({required this.pageIndex, Key? key}) : super(key: key);

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    if (pageIndex == 0) {
      return const OnboardingPageTextContentColumn(title: firstPageTitle, subtitle: firstPageSubtitle);
    } else if (pageIndex == 1) {
      return const OnboardingPageTextContentColumn(title: secondPageTitle, subtitle: secondPageSubtitle);
    } else if (pageIndex == 2) {
      return const OnboardingPageTextContentColumn(title: thirdPageTitle, subtitle: thirdPageSubtitle);
    }
    return const SizedBox.shrink();
  }
}

class OnboardingPageTextContentColumn extends StatelessWidget {
  const OnboardingPageTextContentColumn({
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) => PositionedDirectional(
        top: CoreDimensions.onboardingTextContentContainerHeight + CoreDimensions.paddingXL * 3,
        end: 0,
        start: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: CoreDimensions.paddingL),
          height: CoreDimensions.onboardingTextContentContainerHeight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.tr(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: ColorTokens.brandAccent,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: CoreDimensions.spacingXL),
              Text(
                subtitle.tr(),
                style: const TextStyle(fontWeight: FontWeight.bold, color: ColorTokens.white),
              ),
            ],
          ),
        ),
      );
}

class OnboardingPagePageIndicator extends StatelessWidget {
  const OnboardingPagePageIndicator({required this.pageController, Key? key}) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) => PositionedDirectional(
        start: 0,
        end: 0,
        bottom: CoreDimensions.paddingXL * 2,
        child: Align(
          child: SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: SlideEffect(
              spacing: (context.screenWidth / 2) + CoreDimensions.paddingL - CoreDimensions.pageIndicatorDotWidth * 3.5,
              radius: CoreDimensions.pageIndicatorRadius,
              dotWidth: CoreDimensions.pageIndicatorDotWidth,
              dotHeight: CoreDimensions.pageIndicatorDotHeight,
              paintStyle: PaintingStyle.stroke,
              strokeWidth: CoreDimensions.pageIndicatorStrokeWidth,
              dotColor: ColorTokens.beige,
              activeDotColor: ColorTokens.brandAccent,
            ),
          ),
        ),
      );
}

class OnboardingPageButton extends StatelessWidget {
  const OnboardingPageButton({
    required this.onPressed,
    required this.pageIndex,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final int pageIndex;

  @override
  Widget build(BuildContext context) => PositionedDirectional(
        bottom: CoreDimensions.paddingL,
        start: CoreDimensions.paddingL,
        end: CoreDimensions.paddingL,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(primary: ColorTokens.brandAccent),
          onPressed: onPressed,
          child: Text(
            (pageIndex == 2 ? startKeepingNotesButtonText : getStartedButtonText).tr(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
}
