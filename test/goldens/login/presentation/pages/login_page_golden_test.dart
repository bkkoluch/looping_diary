import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:looping_diary/features/login/presentation/pages/login_page.dart';

import '../../../../test_setup.dart';

void main() {
  setUpAll(baseSetup);

  group('LoginPage Golden Tests', () {
    goldenTest(
      'renders correctly',
      fileName: 'login_page',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'default',
            child: const LoginPage(),
          ),
        ],
      ),
    );
  });
}
