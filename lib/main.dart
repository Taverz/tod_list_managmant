
import 'package:flutter/material.dart';

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
    return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(
          initialRoutes: [
              SplashPreloader(),
            ]
          )
      );
  }
}


//TODO: logging the state of the page, after routing, whether the state changes or whether the page remains active
//TODO: error handling
//TODO: application design details
