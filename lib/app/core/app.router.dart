// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i6;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i10;
import 'package:tod_list_managmant/app/UI/screen/login_page/login_page.dart'
    as _i2;
import 'package:tod_list_managmant/app/UI/screen/organization_list/organization_list_page.dart'
    as _i5;
import 'package:tod_list_managmant/app/UI/screen/profile/profile_page.dart'
    as _i7;
import 'package:tod_list_managmant/app/UI/screen/registration/registration_page.dart'
    as _i3;
import 'package:tod_list_managmant/app/UI/screen/splash_preloader_page/splash_preloader_page.dart'
    as _i4;
import 'package:tod_list_managmant/app/UI/screen/todo_description/todo_description_page.dart'
    as _i9;
import 'package:tod_list_managmant/app/UI/screen/todo_list/todo_page.dart'
    as _i8;

class Routes {
  static const loginPageView = '/login-page-view';

  static const registrationPageView = '/registration-page-view';

  static const splashPreloaderPageView = '/splash-preloader-page-view';

  static const organizationListScreen = '/organization-list-screen';

  static const all = <String>{
    loginPageView,
    registrationPageView,
    splashPreloaderPageView,
    organizationListScreen,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.loginPageView,
      page: _i2.LoginPageView,
    ),
    _i1.RouteDef(
      Routes.registrationPageView,
      page: _i3.RegistrationPageView,
    ),
    _i1.RouteDef(
      Routes.splashPreloaderPageView,
      page: _i4.SplashPreloaderPageView,
    ),
    _i1.RouteDef(
      Routes.organizationListScreen,
      page: _i5.OrganizationListScreen,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.LoginPageView: (data) {
      final args = data.getArgs<LoginPageViewArguments>(
        orElse: () => const LoginPageViewArguments(),
      );
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.LoginPageView(key: args.key),
        settings: data,
      );
    },
    _i3.RegistrationPageView: (data) {
      final args = data.getArgs<RegistrationPageViewArguments>(
        orElse: () => const RegistrationPageViewArguments(),
      );
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => _i3.RegistrationPageView(key: args.key),
        settings: data,
      );
    },
    _i4.SplashPreloaderPageView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.SplashPreloaderPageView(),
        settings: data,
      );
    },
    _i5.OrganizationListScreen: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.OrganizationListScreen(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class LoginPageViewArguments {
  const LoginPageViewArguments({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant LoginPageViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class RegistrationPageViewArguments {
  const RegistrationPageViewArguments({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return '{"key": "$key"}';
  }

  @override
  bool operator ==(covariant RegistrationPageViewArguments other) {
    if (identical(this, other)) return true;
    return other.key == key;
  }

  @override
  int get hashCode {
    return key.hashCode;
  }
}

class OrganizationListScreenRoutes {
  static const profilePageView = 'profile-page-view';

  static const todoView = 'todo-view';

  static const all = <String>{
    profilePageView,
    todoView,
  };
}

class OrganizationListScreenRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      OrganizationListScreenRoutes.profilePageView,
      page: _i7.ProfilePageView,
    ),
    _i1.RouteDef(
      OrganizationListScreenRoutes.todoView,
      page: _i8.TodoView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i7.ProfilePageView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.ProfilePageView(),
        settings: data,
      );
    },
    _i8.TodoView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.TodoView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class TodoViewRoutes {
  static const todoDescriptionView = 'todo-description-view';

  static const all = <String>{todoDescriptionView};
}

class TodoViewRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      TodoViewRoutes.todoDescriptionView,
      page: _i9.TodoDescriptionView,
    )
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i9.TodoDescriptionView: (data) {
      return _i6.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.TodoDescriptionView(),
        settings: data,
      );
    }
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i10.NavigationService {
  Future<dynamic> navigateToLoginPageView({
    _i6.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.loginPageView,
        arguments: LoginPageViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToRegistrationPageView({
    _i6.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.registrationPageView,
        arguments: RegistrationPageViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSplashPreloaderPageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.splashPreloaderPageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToOrganizationListScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.organizationListScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      navigateToNestedProfilePageViewInOrganizationListScreenRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(OrganizationListScreenRoutes.profilePageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToTodoView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(OrganizationListScreenRoutes.todoView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToNestedTodoDescriptionViewInTodoViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(TodoViewRoutes.todoDescriptionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithLoginPageView({
    _i6.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.loginPageView,
        arguments: LoginPageViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithRegistrationPageView({
    _i6.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.registrationPageView,
        arguments: RegistrationPageViewArguments(key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSplashPreloaderPageView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.splashPreloaderPageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithOrganizationListScreen([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.organizationListScreen,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic>
      replaceWithNestedProfilePageViewInOrganizationListScreenRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(OrganizationListScreenRoutes.profilePageView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithTodoView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(OrganizationListScreenRoutes.todoView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithNestedTodoDescriptionViewInTodoViewRouter([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(TodoViewRoutes.todoDescriptionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
