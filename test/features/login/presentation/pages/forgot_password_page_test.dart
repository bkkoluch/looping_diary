import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:looping_diary/features/common/presentation/widgets/faded_backgroud.dart';
import 'package:looping_diary/features/login/presentation/pages/forgot_password_page.dart';

import '../../../../test_setup.dart';

void main() {
  setUp(baseSetup);

  testWidgets(
    'should display ForgotPasswordPage correctly',
    (WidgetTester tester) async {
      final Widget widget = prepareTestableWidget(const ForgotPasswordPage());
      await tester.pumpWidget(widget);
      expect(find.byType(FadedBackground), findsOneWidget);
      expect(find.byType(ForgotPasswordView), findsOneWidget);
    },
  );
}
