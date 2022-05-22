// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../../features/home/presentation/pages/home_page.dart' as _i3;
import '../../../features/login/presentation/auth_gate_page.dart' as _i2;
import '../../../features/login/presentation/pages/forgot_password_page.dart' as _i4;
import '../../../features/notes/domain/models/note.dart' as _i9;
import '../../../features/notes/presentation/pages/add_note_page.dart' as _i5;
import '../../../features/onboarding/presentation/pages/onboarding_carrousel.dart' as _i1;
import 'navigation_service.dart' as _i8;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    OnboardingCarrousel.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(routeData: routeData, child: const _i1.OnboardingCarrousel());
    },
    AuthGateRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.AuthGatePage(),
          customRouteBuilder: _i8.fadeInRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    HomeRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.HomePage(),
          customRouteBuilder: _i8.fadeInRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i4.ForgotPasswordPage(),
          customRouteBuilder: _i8.fadeInRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    },
    AddNoteRoute.name: (routeData) {
      final args = routeData.argsAs<AddNoteRouteArgs>(orElse: () => const AddNoteRouteArgs());
      return _i6.CustomPage<dynamic>(
          routeData: routeData,
          child: _i5.AddNotePage(noteToAddOrEdit: args.noteToAddOrEdit, key: args.key),
          customRouteBuilder: _i8.fadeInRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(OnboardingCarrousel.name, path: '/'),
        _i6.RouteConfig(AuthGateRoute.name, path: '/auth-gate-page'),
        _i6.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i6.RouteConfig(ForgotPasswordRoute.name, path: '/forgot-password-page'),
        _i6.RouteConfig(AddNoteRoute.name, path: '/add-note-page')
      ];
}

/// generated route for
/// [_i1.OnboardingCarrousel]
class OnboardingCarrousel extends _i6.PageRouteInfo<void> {
  const OnboardingCarrousel() : super(OnboardingCarrousel.name, path: '/');

  static const String name = 'OnboardingCarrousel';
}

/// generated route for
/// [_i2.AuthGatePage]
class AuthGateRoute extends _i6.PageRouteInfo<void> {
  const AuthGateRoute() : super(AuthGateRoute.name, path: '/auth-gate-page');

  static const String name = 'AuthGateRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.ForgotPasswordPage]
class ForgotPasswordRoute extends _i6.PageRouteInfo<void> {
  const ForgotPasswordRoute() : super(ForgotPasswordRoute.name, path: '/forgot-password-page');

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [_i5.AddNotePage]
class AddNoteRoute extends _i6.PageRouteInfo<AddNoteRouteArgs> {
  AddNoteRoute({_i9.Note? noteToAddOrEdit, _i7.Key? key})
      : super(AddNoteRoute.name,
            path: '/add-note-page', args: AddNoteRouteArgs(noteToAddOrEdit: noteToAddOrEdit, key: key));

  static const String name = 'AddNoteRoute';
}

class AddNoteRouteArgs {
  const AddNoteRouteArgs({this.noteToAddOrEdit, this.key});

  final _i9.Note? noteToAddOrEdit;

  final _i7.Key? key;

  @override
  String toString() {
    return 'AddNoteRouteArgs{noteToAddOrEdit: $noteToAddOrEdit, key: $key}';
  }
}
