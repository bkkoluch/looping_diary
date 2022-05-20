import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/login/presentation/auth_gate.dart';
import 'package:looping_diary/features/login/presentation/pages/login_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../../test_setup.dart';

void main() {
  late MockFirebaseInstance _mockedFirebaseInstance;

  setUp(() {
    _mockedFirebaseInstance = MockFirebaseInstance();

    when(_mockedFirebaseInstance.authStateChanges).thenAnswer((_) => Stream.value(null));
  });

  setUpAll(baseSetup);

  testWidgets(
    'should display LoginPage when user is not registered',
    (WidgetTester tester) async {
      final Widget widget = prepareTestableWidget(const AuthGate());
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      expect(find.byType(LoginPage), findsOneWidget);
    },
  );
}
