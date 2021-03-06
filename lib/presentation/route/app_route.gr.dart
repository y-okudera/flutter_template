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
import 'package:flutter_template/presentation/screen/home/home_screen.dart'
    as _i3;
import 'package:flutter_template/presentation/screen/splash/splash_screen.dart'
    as _i1;
import 'package:flutter_template/presentation/screen/tab/app_bottom_navigation_bar.dart'
    as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    AppBottomNavigationBarRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: _i2.AppBottomNavigationBar());
    },
    HomeRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.HomeScreen());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(SplashRoute.name, path: '/'),
        _i4.RouteConfig(AppBottomNavigationBarRoute.name,
            path: '/bottom_tab',
            children: [
              _i4.RouteConfig(HomeRoute.name,
                  path: 'home', parent: AppBottomNavigationBarRoute.name)
            ])
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i2.AppBottomNavigationBar]
class AppBottomNavigationBarRoute extends _i4.PageRouteInfo<void> {
  const AppBottomNavigationBarRoute({List<_i4.PageRouteInfo>? children})
      : super(AppBottomNavigationBarRoute.name,
            path: '/bottom_tab', initialChildren: children);

  static const String name = 'AppBottomNavigationBarRoute';
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: 'home');

  static const String name = 'HomeRoute';
}
