import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tod_list_managmant/di/get_it_app.dart';
import 'package:tod_list_managmant/todo_list/todo_viewmodel.dart';

import 'app/route.gr.dart';

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

Future<void> _initializeApp() async{
  final binding = WidgetsFlutterBinding.ensureInitialized();
  binding.deferFirstFrame();
  _initializeGetIt();
  await Future.wait([
    EasyLocalization.ensureInitialized(),
  ]);
  binding.allowFirstFrame();
}

void _initializeGetIt(){
  GetIt.instance..setup();
}

final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}


//TODO: logging the state of the page, after routing, whether the state changes or whether the page remains active
//TODO: error handling
//TODO: application design details
