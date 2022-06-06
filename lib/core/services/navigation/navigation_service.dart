import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/features/common/presentation/pages/no_connection_page.dart';
import 'package:looping_diary/features/home/presentation/pages/home_page.dart';
import 'package:looping_diary/features/login/presentation/auth_gate_page.dart';
import 'package:looping_diary/features/login/presentation/pages/forgot_password_page.dart';
import 'package:looping_diary/features/notes/presentation/pages/note_details_page.dart';
import 'package:looping_diary/features/onboarding/presentation/pages/onboarding_carrousel_page.dart';
import 'package:looping_diary/features/startup/presentation/pages/startup_page.dart';

typedef CustomRouteBuilder = Route<T> Function<T>(BuildContext context, Widget child, CustomPage page);

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: StartupPage, initial: true),
    CustomRoute(page: OnboardingCarrouselPage, customRouteBuilder: fadeInRouteBuilder),
    CustomRoute(page: AuthGatePage, customRouteBuilder: fadeInRouteBuilder),
    CustomRoute(page: HomePage, customRouteBuilder: fadeInRouteBuilder),
    CustomRoute(page: ForgotPasswordPage, customRouteBuilder: fadeInRouteBuilder),
    CustomRoute(page: NoteDetailsPage, customRouteBuilder: fadeInRouteBuilder),
    CustomRoute(page: NoConnectionPage, customRouteBuilder: fadeInRouteBuilder),
  ],
)
class $AppRouter {}

Route<T> fadeInRouteBuilder<T>(_, Widget child, CustomPage<T> page) => PageRouteBuilder(
      settings: page,
      pageBuilder: (_, __, ___) => child,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    );
