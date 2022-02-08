import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:looping_diary/features/common/widgets/faded_backgroud.dart';
import 'package:looping_diary/features/login/presentation/pages/login_page.dart';

import '../../../../firebase_test_setup.dart';
import '../../../../test_setup.dart';

void main() {
  setUp(() async {
    await setupFirebaseAuthMocks();
  });

  testWidgets(
    'should display LoginPage correctly',
    (WidgetTester tester) async {
      final Widget widget = prepareTestableWidget(const LoginPage());
      await tester.pumpWidget(widget);
      expect(find.byType(FadedBackground), findsOneWidget);
      expect(find.byType(SignInScreen), findsOneWidget);
    },
  );
}
