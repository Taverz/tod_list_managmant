// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'route.dart';

abstract class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    TodoList.name: (routeData) {
      return AutoRoutePage<String>(
        routeData: routeData,
        child: const TodoView(),
      );
    },
    LoginPage.name: (routeData) {
      return AutoRoutePage<String>(
        routeData: routeData,
        child:  LoginPageView(),
      );
    },
    SplashPreloader.name: (routeData) {
      return AutoRoutePage<String>(
        routeData: routeData,
        child: const SplashPreloaderPageView(),
      );
    },
    TodoDescription.name: (routeData) {
      return AutoRoutePage<String>(
        routeData: routeData,
        child: const TodoDescriptionView(),
      );
    },
  };
}

/// generated route for
/// [TodoView]
class TodoList extends PageRouteInfo<void> {
  const TodoList({List<PageRouteInfo>? children})
      : super(
          TodoList.name,
          initialChildren: children,
        );

  static const String name = 'TodoList';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPageView]
class LoginPage extends PageRouteInfo<void> {
  const LoginPage({List<PageRouteInfo>? children})
      : super(
          LoginPage.name,
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPreloaderPageView]
class SplashPreloader extends PageRouteInfo<void> {
  const SplashPreloader({List<PageRouteInfo>? children})
      : super(
          SplashPreloader.name,
          initialChildren: children,
        );

  static const String name = 'SplashPreloader';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TodoDescriptionView]
class TodoDescription extends PageRouteInfo<void> {
  const TodoDescription({List<PageRouteInfo>? children})
      : super(
          TodoDescription.name,
          initialChildren: children,
        );

  static const String name = 'TodoDescription';

  static const PageInfo<void> page = PageInfo<void>(name);
}
