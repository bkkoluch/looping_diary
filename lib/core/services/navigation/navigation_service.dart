import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/features/home/presentation/pages/home_page.dart';
import 'package:looping_diary/features/login/presentation/auth_gate.dart';
import 'package:looping_diary/features/login/presentation/pages/forgot_password_page.dart';
import 'package:looping_diary/features/notes/presentation/pages/add_note_page.dart';

typedef CustomRouteBuilder = Route<T> Function<T>(BuildContext context, Widget child, CustomPage page);

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: AuthGate, initial: true),
    AutoRoute(page: HomePage),
    CustomRoute(page: ForgotPasswordPage, customRouteBuilder: fadeInRouteBuilder),
    CustomRoute(page: AddNotePage, customRouteBuilder: fadeInRouteBuilder),
  ],
)
class $AppRouter {}

Route<T> fadeInRouteBuilder<T>(_, Widget child, CustomPage<T> page) => PageRouteBuilder(
      settings: page,
      pageBuilder: (_, __, ___) => child,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    );
