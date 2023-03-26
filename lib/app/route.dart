import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';

import '../todo_list/todo_viewmodel.dart';


// @MaterialAutoRouter(routers:[
//   MaterialRoute(page:TodoView)
// ])
// class $Router {}


@AutoRouterConfig()
class RootRouter extends $RootRouter {
  @override
  RouteType get defaultRouteType => RouteType.custom(
        reverseDurationInMilliseconds: 800,
        transitionsBuilder: (ctx, animation1, animation2, child) {
          // print('Anim1 ${animation1.value}');
          print('Anim2 ${animation2.value}');
          return child;
        },
      );

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: TodoView.page,
      path: '/',
      // guards: [AuthGuard()],
      children: [
        // RedirectRoute(path: '', redirectTo: 'books'),
        AutoRoute(
          path: 'todo_description',
          page: TodoDescription.page,
          // maintainState: true,
        ),
      //   profileTab,
      //   AutoRoute(
      //     path: 'settings/:tab',
      //     page: SettingsTab.page,
      //   ),
      ],
    ),
    AutoRoute(page: LoginPage.page , path: '/login'),
    AutoRoute(page: REgistrationPage.page, path: '/registration'),
    AutoRoute(page: TodoDescription.page, path: '/todo_description'),
    RedirectRoute(path: '*', redirectTo: '/'),
  ];
}

@RoutePage(name: 'TodoView')
class TodoView extends AutoRouter {
  const TodoView({super.key});
}
@RoutePage(name: 'TodoDescription')
class TodoDescription extends AutoRouter {
  const TodoDescription({super.key});
}
@RoutePage(name: 'LoginPage')
class LoginPage extends AutoRouter {
  const LoginPage({super.key});
}
@RoutePage(name: 'REgistrationPage')
class REgistrationPage extends AutoRouter {
  const REgistrationPage({super.key});
}

// @RoutePage(name: 'ProfileTab')
// class ProfileTabPage extends AutoRouter {
//   const ProfileTabPage({super.key});
// }