import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
// import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/UI/widget/dialog/dialog_custom.dart';
import 'app/core/app.router.dart';
import 'app/core/locator.dart';
// import 'app/core/route.dart';
// import 'app/data/repository/repository_simple.dart';
import 'app/service/setup_snackbar.dart';

// import 'app/core/route.gr.dart' as auto_router;
// import 'app/core/route.dart' as auto_router;

// import 'app/locator.dart';
// import 'app/route.dart';
// import 'service/setup_snackbar.dart';
// import 'UI/widget/dialog/dialog_custom.dart';

// import 'widget/dialog/dialogrequest.dart';

void main() async {
  await _initializeApp();

  //  EasyLocalization(
  //     supportedLocales: const [Locale("en", "US"), Locale("hi", "IN")],
  //     path: "assets/translations",
  //     fallbackLocale: const Locale("en", "US"),
  //     assetLoader: const CodegenLoader(),
  //     child: TemplateApp(),
  //   ),

  // await _sentry(const MyApp());
  runApp(const MyApp());
}

@pragma('vm:entry-point')
Future<void> _initializeApp() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  binding.deferFirstFrame();
  try {
    _initPushService();
  } catch (e) {}
  await _initializeGetIt();
  setupDialogUi();
  setupSnackbarUiWW();
  await setupSnackBarUI(locator);
  setupBottomSheetUi();

  // service.registerCustomDialogBuilder(variant: Dialog.basic, builder: (context, request, completer) => Dialog(...))

  // await Future.wait([
  //   EasyLocalization.ensureInitialized(),
  // ]);
  binding.allowFirstFrame();
}

/// Crash analitics
Future<void> _sentry(Widget childW) async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://62bf1fca9f7748b68d836bd29c1d72ec:a9953c31b6814d8288c936caaec8cbf0@help.<project-name>.io/3';
      options.tracesSampleRate = 1.0;
      // options.reportPackages = false;
      // options.addInAppInclude(
      //     'ServiceBook-dev-${packageInfoW.buildNumber + "+" + packageInfoW.version}');
      // options.considerInAppFramesByDefault = false;
      options.attachThreads = true;
      options.enableWindowMetricBreadcrumbs = true;
      // options.platformChecker = PlatformChecker
      // options.release = packageInfoW.packageName +
      //     " " +
      //     packageInfoW.buildNumber +
      //     packageInfoW.version;
      // options.addIntegration(LoggingIntegration());
      // We can enable Sentry debug logging during development. This is likely
      // going to log too much for your app, but can be useful when figuring out
      // configuration issues, e.g. finding out why your events are not uploaded.
      options.debug = true;
    },
    // (options) => options.dsn = 'https://62bf1fca9f7748b68d836bd29c1d72ec:a9953c31b6814d8288c936caaec8cbf0@help.service-book.io/3',
    appRunner: () => runApp(
      DefaultAssetBundle(
        bundle: SentryAssetBundle(enableStructuredDataTracing: true),
        child: childW,
      ),
    ),
  );
}

/// @pragma('vm:entry-point') - from background worked push
@pragma('vm:entry-point')
void _initPushService() {
  if (Platform.isAndroid) {
    /// В случае если это Android  без GMS, или какой-нибудь другой Huawei, то выкенет ошибку и запустит другой сервис пушей
    try {
      //TODO: google push
    } catch (e) {
      //TODO: huawei push
    }
  } else if (Platform.isIOS) {
    try {
      //TODO: google push
    } catch (e) {}
  }
}

Future<void> _initializeGetIt() async {
  await setupLocator();
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final builders = {
    DialogType.basic: (BuildContext context, DialogRequest request,
            MyCallbackFuncResponseDialog completer) =>
        BasicDialog(
          request: request,
          completer: completer,
          status: BasicDialogStatus.loading,
        ),
    DialogType.loading: (BuildContext context, DialogRequest request,
            MyCallbackFuncResponseDialog completer) =>
        BasicDialog(
          request: request,
          completer: completer,
          status: BasicDialogStatus.loading,
        ),
    DialogType.errore: (BuildContext context, DialogRequest request,
            MyCallbackFuncResponseDialog completer) =>
        BasicDialog(
          request: request,
          completer: completer,
          status: BasicDialogStatus.error,
        ),
    DialogType.warning: (BuildContext context, DialogRequest request,
            MyCallbackFuncResponseDialog completer) =>
        BasicDialog(
          request: request,
          completer: completer,
          status: BasicDialogStatus.warning,
        ),
  };

  dialogService.registerCustomDialogBuilders(builders);
}

void setupSnackbarUiWW() {}
void setupBottomSheetUi() {}

// final _appRouter = locator<AppRouter>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   debugShowCheckedModeBanner: false,
    //   // localizationsDelegates: [
    //   //   ...AppLocalizations.localizationsDelegates,
    //   //   LocaleNamesLocalizationsDelegate()
    //   // ],
    //   // supportedLocales: AppLocalizations.supportedLocales,
    //   // locale: Locale('ru'),
    //   // findSystemLocale().toString().substring(0, 2) == "ru"
    //   //     ? Locale('ru')
    //   //     : Locale('en'), //App_Options.of(context).locale,
    //   // localeListResolutionCallback: (locales, supportedLocales) {
    //   //   return basicLocaleListResolution(locales, supportedLocales);
    //   // },
    //   routerConfig: _appRouter.config(
    //     initialRoutes: [
    //       const SplashPreloader(),
    //     ],
    //   ),
    // );

    return MaterialApp(
      initialRoute: Routes.splashPreloaderPageView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );

    // return MaterialApp(
    //   builder:  ExtendedNavigator.builder<AppRouter>(
    //         router: AppRouter(),
    //         builder: (context,Widget? extendedNav) => Theme(
    //             data: ThemeData(),
    //             child: extendedNav??SizedBox(),
    //           ),
    //         initialRoute: SplashPreloader.name,
    //         navigatorKey: locator<NavigationService>().navigatorKey,
    //       ),
    // );
  }
}

//TODO: logging the state of the page, after routing, whether the state changes or whether the page remains active
//TODO: error handling
//TODO: application design details
