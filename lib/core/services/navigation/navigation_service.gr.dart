// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../../../features/home/presentation/pages/home_page.dart' as _i4;
import '../../../features/login/presentation/auth_gate_page.dart' as _i3;
import '../../../features/login/presentation/pages/forgot_password_page.dart' as _i5;
import '../../../features/notes/domain/models/note.dart' as _i12;
import '../../../features/notes/presentation/pages/note_calendar_page.dart' as _i7;
import '../../../features/notes/presentation/pages/note_details_page.dart' as _i6;
import '../../../features/onboarding/presentation/pages/onboarding_carrousel_page.dart' as _i2;
import '../../../features/settings/presentation/pages/settings_page.dart' as _i8;
import '../../../features/startup/presentation/pages/startup_page.dart' as _i1;
import 'navigation_service.dart' as _i11;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    StartupRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(routeData: routeData, child: const _i1.StartupPage());
    },
    OnboardingCarrouselRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.OnboardingCarrouselPage(),
          customRouteBuilder: _i11.fadeInRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    AuthGateRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.AuthGatePage(),
          customRouteBuilder: _i11.fadeInRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: _i4.HomePage(pageToScrollTo: args.pageToScrollTo, key: args.key),
          customRouteBuilder: _i11.fadeInRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i5.ForgotPasswordPage(),
          customRouteBuilder: _i11.fadeInRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    NoteDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<NoteDetailsRouteArgs>();
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: _i6.NoteDetailsPage(
              note: args.note,
              pageIndex: args.pageIndex,
              shouldNavigateToHomeOnPop: args.shouldNavigateToHomeOnPop,
              autofocus: args.autofocus,
              key: args.key),
          customRouteBuilder: _i11.fadeInRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    NoteCalendarRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i7.NoteCalendarPage(),
          customRouteBuilder: _i11.fadeInRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    SettingsRoute.name: (routeData) {
      return _i9.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i8.SettingsPage(),
          customRouteBuilder: _i11.fadeInRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(StartupRoute.name, path: '/'),
        _i9.RouteConfig(OnboardingCarrouselRoute.name, path: '/onboarding-carrousel-page'),
        _i9.RouteConfig(AuthGateRoute.name, path: '/auth-gate-page'),
        _i9.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i9.RouteConfig(ForgotPasswordRoute.name, path: '/forgot-password-page'),
        _i9.RouteConfig(NoteDetailsRoute.name, path: '/note-details-page'),
        _i9.RouteConfig(NoteCalendarRoute.name, path: '/note-calendar-page'),
        _i9.RouteConfig(SettingsRoute.name, path: '/settings-page')
      ];
}

/// generated route for
/// [_i1.StartupPage]
class StartupRoute extends _i9.PageRouteInfo<void> {
  const StartupRoute() : super(StartupRoute.name, path: '/');

  static const String name = 'StartupRoute';
}

/// generated route for
/// [_i2.OnboardingCarrouselPage]
class OnboardingCarrouselRoute extends _i9.PageRouteInfo<void> {
  const OnboardingCarrouselRoute() : super(OnboardingCarrouselRoute.name, path: '/onboarding-carrousel-page');

  static const String name = 'OnboardingCarrouselRoute';
}

/// generated route for
/// [_i3.AuthGatePage]
class AuthGateRoute extends _i9.PageRouteInfo<void> {
  const AuthGateRoute() : super(AuthGateRoute.name, path: '/auth-gate-page');

  static const String name = 'AuthGateRoute';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i9.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({int? pageToScrollTo, _i10.Key? key})
      : super(HomeRoute.name, path: '/home-page', args: HomeRouteArgs(pageToScrollTo: pageToScrollTo, key: key));

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.pageToScrollTo, this.key});

  final int? pageToScrollTo;

  final _i10.Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{pageToScrollTo: $pageToScrollTo, key: $key}';
  }
}

/// generated route for
/// [_i5.ForgotPasswordPage]
class ForgotPasswordRoute extends _i9.PageRouteInfo<void> {
  const ForgotPasswordRoute() : super(ForgotPasswordRoute.name, path: '/forgot-password-page');

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [_i6.NoteDetailsPage]
class NoteDetailsRoute extends _i9.PageRouteInfo<NoteDetailsRouteArgs> {
  NoteDetailsRoute(
      {required _i12.Note note,
      required int pageIndex,
      bool shouldNavigateToHomeOnPop = false,
      bool autofocus = true,
      _i10.Key? key})
      : super(NoteDetailsRoute.name,
            path: '/note-details-page',
            args: NoteDetailsRouteArgs(
                note: note,
                pageIndex: pageIndex,
                shouldNavigateToHomeOnPop: shouldNavigateToHomeOnPop,
                autofocus: autofocus,
                key: key));

  static const String name = 'NoteDetailsRoute';
}

class NoteDetailsRouteArgs {
  const NoteDetailsRouteArgs(
      {required this.note,
      required this.pageIndex,
      this.shouldNavigateToHomeOnPop = false,
      this.autofocus = true,
      this.key});

  final _i12.Note note;

  final int pageIndex;

  final bool shouldNavigateToHomeOnPop;

  final bool autofocus;

  final _i10.Key? key;

  @override
  String toString() {
    return 'NoteDetailsRouteArgs{note: $note, pageIndex: $pageIndex, shouldNavigateToHomeOnPop: $shouldNavigateToHomeOnPop, autofocus: $autofocus, key: $key}';
  }
}

/// generated route for
/// [_i7.NoteCalendarPage]
class NoteCalendarRoute extends _i9.PageRouteInfo<void> {
  const NoteCalendarRoute() : super(NoteCalendarRoute.name, path: '/note-calendar-page');

  static const String name = 'NoteCalendarRoute';
}

/// generated route for
/// [_i8.SettingsPage]
class SettingsRoute extends _i9.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings-page');

  static const String name = 'SettingsRoute';
}
