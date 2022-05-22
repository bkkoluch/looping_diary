import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/core/style/illustrations.dart';
import 'package:looping_diary/core/style/lotties.dart';
import 'package:looping_diary/features/onboarding/presentation/pages/onboarding_carrousel_page.dart';
import 'package:looping_diary/res/strings.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../test_setup.dart';

void main() {
  group('OnboardingPageWidgets', () {
    testWidgets(
      'should display OnboardingPage correctly',
      (WidgetTester tester) async {
        final Widget widget = prepareTestableWidget(
          OnboardingPage(
            onPressed: () {},
            asset: Illustrations.addNotes,
            pageIndex: 0,
            pageController: PageController(),
          ),
        );

        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();
        expect(find.byType(Stack), findsOneWidget);
        expect(find.byType(OnboardingPageIllustration), findsOneWidget);
        expect(find.byType(OnboardingPageTextContent), findsOneWidget);
        expect(find.byType(OnboardingPageButton), findsOneWidget);
      },
    );

    testWidgets(
      'should display OnboardingPageIllustration correctly',
      (WidgetTester tester) async {
        final Widget widget = prepareTestableWidget(
          const OnboardingPageIllustration(asset: Lotties.makingNotesFemale, pageIndex: 0),
        );

        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();
        expect(find.byType(Lottie), findsOneWidget);
      },
    );

    testWidgets(
      'should display OnboardingPageTextContent correctly',
      (WidgetTester tester) async {
        final Widget widget = prepareTestableWidget(const OnboardingPageTextContent(pageIndex: 0));

        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();
        expect(find.byType(OnboardingPageTextContentColumn), findsOneWidget);
      },
    );

    testWidgets(
      'should display OnboardingPageTextContentColumn correctly',
      (WidgetTester tester) async {
        final Widget widget = prepareTestableWidget(
          const OnboardingPageTextContentColumn(
            title: secondPageTitle,
            subtitle: secondPageSubtitle,
          ),
        );

        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();
        expect(find.byType(Container), findsOneWidget);
        expect(find.byType(Column), findsOneWidget);
        expect(find.byType(SizedBox), findsOneWidget);
        expect(find.byType(Text), findsNWidgets(2));
        expect(find.text(secondPageTitle), findsOneWidget);
        expect(find.text(secondPageTitle), findsOneWidget);
      },
    );

    testWidgets(
      'should display OnboardingPagePageIndicator correctly',
      (WidgetTester tester) async {
        final Widget widget = prepareTestableWidget(
          OnboardingPagePageIndicator(pageController: PageController()),
        );

        await tester.pumpWidget(widget);
        await tester.pumpAndSettle();
        expect(find.byType(Align), findsOneWidget);
        expect(find.byType(SmoothPageIndicator), findsOneWidget);
      },
    );

    group('OnboardingPageButton', () {
      testWidgets(
        'should display OnboardingPageButton correctly for index 0',
        (WidgetTester tester) async {
          final Widget widget = prepareTestableWidget(OnboardingPageButton(onPressed: () {}, pageIndex: 0));

          await tester.pumpWidget(widget);
          await tester.pumpAndSettle();
          expect(find.byType(ElevatedButton), findsOneWidget);
          expect(find.byType(Text), findsOneWidget);
          expect(find.text(getStartedButtonText), findsOneWidget);
          expect(find.text(startKeepingNotesButtonText), findsNothing);
        },
      );

      testWidgets(
        'should display OnboardingPageButton correctly for index 2',
        (WidgetTester tester) async {
          final Widget widget = prepareTestableWidget(OnboardingPageButton(onPressed: () {}, pageIndex: 2));

          await tester.pumpWidget(widget);
          await tester.pumpAndSettle();
          expect(find.byType(ElevatedButton), findsOneWidget);
          expect(find.byType(Text), findsOneWidget);
          expect(find.text(startKeepingNotesButtonText), findsOneWidget);
          expect(find.text(getStartedButtonText), findsNothing);
        },
      );
    });
  });
}
