import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/login/presentation/pages/loading_page.dart';

import '../../../../firebase_test_setup.dart';
import '../../../../test_setup.dart';

void main() {
  setUp(() async {
    await setupFirebaseAuthMocks();
  });

  testWidgets(
    'should display LoadingPage correctly',
    (WidgetTester tester) async {
      final Widget widget = prepareTestableWidget(const LoadingPage());
      await tester.pumpWidget(widget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(SpinKitPouringHourGlass), findsOneWidget);
    },
  );
}
