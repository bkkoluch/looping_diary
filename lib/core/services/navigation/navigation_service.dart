import 'package:auto_route/annotations.dart';
import 'package:looping_diary/features/home/presentation/pages/home_page.dart';
import 'package:looping_diary/features/login/presentation/auth_gate.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: AuthGate, initial: true),
    AutoRoute(page: HomePage),
  ],
)
class $AppRouter {}
