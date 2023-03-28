import 'package:auto_route/auto_route.dart';
import 'package:tod_list_managmant/profile/profile_page.dart';

import '../login_page/login_page.dart';
import '../splash_preloader_page/splash_preloader_page.dart';
import '../todo_description/todo_description_view.dart';
import '../todo_list/todo_viewmodel.dart';

import 'package:auto_route/annotations.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashPreloaderPageView, initial: true),
    AutoRoute(page: LoginPageView),
    AutoRoute(
      page: TodoView,
      children: [
        AutoRoute(page: TodoDescriptionView),
        AutoRoute(page: ProfilePageView),
      ],
    ),
  ],
)


class $AppRouter {}

