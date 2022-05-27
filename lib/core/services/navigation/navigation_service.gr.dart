// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../../features/home/presentation/pages/home_page.dart' as _i4;
import '../../../features/login/presentation/auth_gate_page.dart' as _i3;
import '../../../features/login/presentation/pages/forgot_password_page.dart' as _i5;
import '../../../features/notes/domain/models/note.dart' as _i10;
import '../../../features/notes/presentation/pages/note_details_page.dart' as _i6;
import '../../../features/onboarding/presentation/pages/onboarding_carrousel_page.dart' as _i2;
import '../../../features/startup/presentation/pages/startup_page.dart' as _i1;
import 'navigation_service.dart' as _i9;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    StartupRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(routeData: routeData, child: const _i1.StartupPage());
    },
    OnboardingCarrouselRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.OnboardingCarrouselPage(),
          customRouteBuilder: _i9.fadeInRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    AuthGateRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.AuthGatePage(),
          customRouteBuilder: _i9.fadeInRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    HomeRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.HomePage(),
          customRouteBuilder: _i9.fadeInRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i5.ForgotPasswordPage(),
          customRouteBuilder: _i9.fadeInRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    NoteDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<NoteDetailsRouteArgs>();
      return _i7.CustomPage<dynamic>(
          routeData: routeData,
          child: _i6.NoteDetailsPage(note: args.note, pageIndex: args.pageIndex, key: args.key),
          customRouteBuilder: _i9.fadeInRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(StartupRoute.name, path: '/'),
        _i7.RouteConfig(OnboardingCarrouselRoute.name, path: '/onboarding-carrousel-page'),
        _i7.RouteConfig(AuthGateRoute.name, path: '/auth-gate-page'),
        _i7.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i7.RouteConfig(ForgotPasswordRoute.name, path: '/forgot-password-page'),
        _i7.RouteConfig(NoteDetailsRoute.name, path: '/note-details-page')
      ];
}

/// generated route for
/// [_i1.StartupPage]
class StartupRoute extends _i7.PageRouteInfo<void> {
  const StartupRoute() : super(StartupRoute.name, path: '/');

  static const String name = 'StartupRoute';
}

/// generated route for
/// [_i2.OnboardingCarrouselPage]
class OnboardingCarrouselRoute extends _i7.PageRouteInfo<void> {
  const OnboardingCarrouselRoute() : super(OnboardingCarrouselRoute.name, path: '/onboarding-carrousel-page');

  static const String name = 'OnboardingCarrouselRoute';
}

/// generated route for
/// [_i3.AuthGatePage]
class AuthGateRoute extends _i7.PageRouteInfo<void> {
  const AuthGateRoute() : super(AuthGateRoute.name, path: '/auth-gate-page');

  static const String name = 'AuthGateRoute';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i5.ForgotPasswordPage]
class ForgotPasswordRoute extends _i7.PageRouteInfo<void> {
  const ForgotPasswordRoute() : super(ForgotPasswordRoute.name, path: '/forgot-password-page');

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [_i6.NoteDetailsPage]
class NoteDetailsRoute extends _i7.PageRouteInfo<NoteDetailsRouteArgs> {
  NoteDetailsRoute({required _i10.Note note, required int pageIndex, _i8.Key? key})
      : super(NoteDetailsRoute.name,
            path: '/note-details-page', args: NoteDetailsRouteArgs(note: note, pageIndex: pageIndex, key: key));

  static const String name = 'NoteDetailsRoute';
}

class NoteDetailsRouteArgs {
  const NoteDetailsRouteArgs({required this.note, required this.pageIndex, this.key});

  final _i10.Note note;

  final int pageIndex;

  final _i8.Key? key;

  @override
  String toString() {
    return 'NoteDetailsRouteArgs{note: $note, pageIndex: $pageIndex, key: $key}';
  }
}
