import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tod_list_managmant/di/get_it_app.dart';
import 'package:tod_list_managmant/todo_list/todo_viewmodel.dart';
import 'package:auto_route/auto_route.dart';

import 'app/locator.dart';
import 'app/route.dart';
import 'app/route.dart' as r;

void main() async {
  
  await _initializeApp();

  //  EasyLocalization(
  //     supportedLocales: const [Locale("en", "US"), Locale("hi", "IN")],
  //     path: "assets/translations",
  //     fallbackLocale: const Locale("en", "US"),
  //     assetLoader: const CodegenLoader(),
  //     child: TemplateApp(),
  //   ),
  runApp(const MyApp());
}

Future<void> _initializeApp() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  binding.deferFirstFrame();
  _initializeGetIt();
  // await Future.wait([
  //   EasyLocalization.ensureInitialized(),
  // ]);
  binding.allowFirstFrame();
}

void _initializeGetIt() {
  setupLocator();
}

final _appRouter = locator<AppRouter>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   routerDelegate: _appRouter.delegate
    //(initialRoutes: [
    //     // LoginPage(),
    //     // TodoList(),
    //     // TodoDescription(),
    //      SplashPreloader(),
    //   ]),
    //   routeInformationParser: _appRouter.defaultRouteParser(),
    // );
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(
        initialRoutes: [
            // LoginPage(),
            // TodoList(),
            // TodoDescription(),
            SplashPreloader(),
          ]
        )
    );
    // return MaterialApp(
    //       builder: ExtendedNavigator.builder<r.AppRouter>(
    //         router: r.AppRouter(),
    //         builder: (context, extendedNav) => Theme(
    //             data: ThemeData(),
    //             child: extendedNav!,
    //           ),
    //         initialRoute: r.SplashPreloader.name ,
    //         navigatorKey: locator<NavigationService>().navigatorKey,
    //       ),
    //     );
  }
}


//TODO: logging the state of the page, after routing, whether the state changes or whether the page remains active
//TODO: error handling
//TODO: application design details
