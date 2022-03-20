// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../../features/home/presentation/pages/home_page.dart' as _i2;
import '../../../features/login/presentation/auth_gate.dart' as _i1;
import '../../../features/login/presentation/pages/forgot_password_page.dart' as _i3;
import 'navigation_service.dart' as _i6;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AuthGate.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(routeData: routeData, child: const _i1.AuthGate());
    },
    HomeRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(routeData: routeData, child: const _i2.HomePage());
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i4.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i3.ForgotPasswordPage(),
          customRouteBuilder: _i6.fadeInRouteBuilder,
          opaque: true,
          barrierDismissible: false);
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(AuthGate.name, path: '/'),
        _i4.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i4.RouteConfig(ForgotPasswordRoute.name, path: '/forgot-password-page')
      ];
}

/// generated route for
/// [_i1.AuthGate]
class AuthGate extends _i4.PageRouteInfo<void> {
  const AuthGate() : super(AuthGate.name, path: '/');

  static const String name = 'AuthGate';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home-page');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.ForgotPasswordPage]
class ForgotPasswordRoute extends _i4.PageRouteInfo<void> {
  const ForgotPasswordRoute() : super(ForgotPasswordRoute.name, path: '/forgot-password-page');

  static const String name = 'ForgotPasswordRoute';
}
