import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../UI/screen/login_page/login_page.dart';
import '../UI/screen/splash_preloader_page/splash_preloader_page.dart';
import '../UI/screen/todo_description/todo_description_view.dart';
// import '../todo_list/todo_view.dart';
import '../UI/screen/todo_list/todo_viewmodel.dart';

part 'route.gr.dart';

// @MaterialAutoRouter(
//   replaceInRouteName: 'Page,Route',
//   routes: <AutoRoute>[
//     AutoRoute(page: SplashPreloaderPageView, initial: true),
//     AutoRoute(page: LoginPageView),
//     AutoRoute(
//       page: TodoView,
//       children: [
//         AutoRoute(page: TodoDescriptionView),
//         AutoRoute(page: ProfilePageView),
//       ],
//     ),
//     // AutoRoute(page: HomePage, initial: true),
//     // AutoRoute(page: DashboardScreen, guards: [AuthGuard]),
//   ],
// )

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: LoginPage.page),
    AutoRoute(
      page: TodoList.page,
      children: [
        AutoRoute(page: TodoDescription.page),
      ],
    ),
    AutoRoute(page: SplashPreloader.page,),
  ];
}
