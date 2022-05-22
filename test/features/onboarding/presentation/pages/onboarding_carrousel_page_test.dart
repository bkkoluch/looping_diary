import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/features/onboarding/presentation/cubits/onboarding_cubit.dart';
import 'package:looping_diary/features/onboarding/presentation/pages/onboarding_carrousel_page.dart';

import '../../../../test_setup.dart';

void main() {
  late OnboardingCubit onboardingCubit;

  setUpAll(() {
    onboardingCubit = OnboardingCubit();

    getIt.registerFactory<OnboardingCubit>(() => onboardingCubit);
  });

  testWidgets(
    'should display OnboardingCarrouselPage correctly',
    (WidgetTester tester) async {
      final Widget widget = prepareTestableWidget(const OnboardingCarrouselPage());
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
      expect(find.byType(OnboardingPagePageIndicator), findsOneWidget);
      expect(find.byType(OnboardingPage), findsOneWidget);
    },
  );
}
