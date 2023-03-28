// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../login_page/login_page.dart' as _i2;
import '../profile/profile_page.dart' as _i5;
import '../splash_preloader_page/splash_preloader_page.dart' as _i1;
import '../todo_description/todo_description_view.dart' as _i4;
import '../todo_list/todo_viewmodel.dart' as _i3;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SplashPreloaderRouteView.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SplashPreloaderPageView(),
      );
    },
    LoginRouteView.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPageView(),
      );
    },
    TodoView.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.TodoView(),
      );
    },
    TodoDescriptionView.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.TodoDescriptionView(),
      );
    },
    ProfileRouteView.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ProfilePageView(),
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          SplashPreloaderRouteView.name,
          path: '/',
        ),
        _i6.RouteConfig(
          LoginRouteView.name,
          path: '/login-page-view',
        ),
        _i6.RouteConfig(
          TodoView.name,
          path: '/todo-view',
          children: [
            _i6.RouteConfig(
              TodoDescriptionView.name,
              path: 'todo-description-view',
              parent: TodoView.name,
            ),
            _i6.RouteConfig(
              ProfileRouteView.name,
              path: 'profile-page-view',
              parent: TodoView.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashPreloaderPageView]
class SplashPreloaderRouteView extends _i6.PageRouteInfo<void> {
  const SplashPreloaderRouteView()
      : super(
          SplashPreloaderRouteView.name,
          path: '/',
        );

  static const String name = 'SplashPreloaderRouteView';
}

/// generated route for
/// [_i2.LoginPageView]
class LoginRouteView extends _i6.PageRouteInfo<void> {
  const LoginRouteView()
      : super(
          LoginRouteView.name,
          path: '/login-page-view',
        );

  static const String name = 'LoginRouteView';
}

/// generated route for
/// [_i3.TodoView]
class TodoView extends _i6.PageRouteInfo<void> {
  const TodoView({List<_i6.PageRouteInfo>? children})
      : super(
          TodoView.name,
          path: '/todo-view',
          initialChildren: children,
        );

  static const String name = 'TodoView';
}

/// generated route for
/// [_i4.TodoDescriptionView]
class TodoDescriptionView extends _i6.PageRouteInfo<void> {
  const TodoDescriptionView()
      : super(
          TodoDescriptionView.name,
          path: 'todo-description-view',
        );

  static const String name = 'TodoDescriptionView';
}

/// generated route for
/// [_i5.ProfilePageView]
class ProfileRouteView extends _i6.PageRouteInfo<void> {
  const ProfileRouteView()
      : super(
          ProfileRouteView.name,
          path: 'profile-page-view',
        );

  static const String name = 'ProfileRouteView';
}
