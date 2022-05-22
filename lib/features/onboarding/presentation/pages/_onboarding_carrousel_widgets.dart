part of 'onboarding_carrousel_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    required this.onPressed,
    required this.asset,
    required this.pageIndex,
    required this.pageController,
    Key? key,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String asset;
  final int pageIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(width: context.screenWidth, height: context.screenHeight, color: ColorTokens.brown),
          PositionedDirectional(
            top: CoreDimensions.onboardingImageTopPadding,
            end: pageIndex == 2 ? CoreDimensions.onboardingImageSidePadding : 0,
            start: pageIndex == 2 ? CoreDimensions.onboardingImageSidePadding : 0,
            child: OnboardingPageIllustration(asset: asset, pageIndex: pageIndex),
          ),
          PositionedDirectional(
            top: CoreDimensions.onboardingTextContentContainerHeight + CoreDimensions.paddingXL * 3,
            end: 0,
            start: 0,
            child: OnboardingPageTextContent(pageIndex: pageIndex),
          ),
          PositionedDirectional(
            bottom: CoreDimensions.paddingL,
            start: CoreDimensions.paddingL,
            end: CoreDimensions.paddingL,
            child: OnboardingPageButton(onPressed: onPressed, pageIndex: pageIndex),
          ),
        ],
      );
}

class OnboardingPageIllustration extends StatelessWidget {
  const OnboardingPageIllustration({
    required this.asset,
    required this.pageIndex,
    Key? key,
  }) : super(key: key);

  final String asset;
  final int pageIndex;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: CoreDimensions.onboardingImageWidth,
        height: CoreDimensions.onboardingImageHeight,
        child: Lottie.asset(asset),
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
  Widget build(BuildContext context) => Container(
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
                fontSize: 24,
              ),
            ),
            const SizedBox(height: CoreDimensions.spacingXL),
            Text(
              subtitle.tr(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}

class OnboardingPagePageIndicator extends StatelessWidget {
  const OnboardingPagePageIndicator({required this.pageController, Key? key}) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) => Align(
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
            dotColor: ColorTokens.white,
            activeDotColor: ColorTokens.brandAccent,
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
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(primary: ColorTokens.brandAccent),
        onPressed: onPressed,
        child: Text(
          (pageIndex == 2 ? startKeepingNotesButtonText : getStartedButtonText).tr(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      );
}
