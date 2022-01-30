import 'package:firebase_auth/firebase_auth.dart';
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
    await setupFirebaseAuthMocks();
    when(mockFirebaseInstance.authStateChanges).thenAnswer((_) => Stream.value(null));
  });

  testWidgets(
    'should display LoadingPage at first and then LoginPage as the user is not registered',
    (WidgetTester tester) async {
      final Widget widget = prepareTestableWidget(const AuthGate());
      await tester.pumpWidget(widget);
      expect(find.byType(LoadingPage), findsOneWidget);
      await tester.pumpAndSettle();
      expect(find.byType(LoadingPage), findsNothing);
      expect(find.byType(LoginPage), findsOneWidget);
    },
    // skipping the test to not run on CI as it fails due to not having secrets Keys file
  );
}
