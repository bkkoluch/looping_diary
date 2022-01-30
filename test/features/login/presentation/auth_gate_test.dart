import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/login/presentation/auth_gate.dart';
import 'package:looping_diary/features/login/presentation/pages/loading_page.dart';
import 'package:looping_diary/features/login/presentation/pages/login_page.dart';
import 'package:mocktail/mocktail.dart';

import '../../../firebase_test_setup.dart';
import '../../../test_setup.dart';

class MockFirebaseInstance extends Mock implements FirebaseAuth {}

void main() {
  final MockFirebaseInstance mockFirebaseInstance = MockFirebaseInstance();

  setUp(() async {
    setupFirebaseAuthMocks();
    await Firebase.initializeApp();
    when(mockFirebaseInstance.authStateChanges).thenAnswer((_) => Stream.value(null));
  });

  testWidgets(
    'should display LoadingPage at first at then LoginPage as the user is not registered',
    (WidgetTester tester) async {
      final Widget widget = prepareTestableWidget(const AuthGate());
      await tester.pumpWidget(widget);
      expect(find.byType(LoadingPage), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byType(LoginPage), findsOneWidget);
    },
  );
}
