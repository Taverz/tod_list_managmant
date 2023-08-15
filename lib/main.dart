import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tod_list_managmant/app/core/app.locator.dart';

import 'app/core/app.bottomsheets.dart';
import 'app/core/app.dialogs.dart';
import 'app/core/app.router.dart';
import 'app/service/auth/authorization.dart';
import 'app/service/auth/firebase_goog_auth.dart';
import 'app/service/auth/huawei_auth.dart';

FirebaseInit? firebaseInit;
HuaweiInit? huaweiInit;

TypeServiceAuth typeServiceAuth = TypeServiceAuth.firebase;

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
    await _initPushService();
  } catch (e) {}
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  await authentication();

  // await Future.wait([
  //   EasyLocalization.ensureInitialized(),
  // ]);
  binding.allowFirstFrame();
}

Future authentication() async {
  if (Platform.isAndroid || Platform.isIOS) {
    try {
      firebaseInit = FirebaseInit();
      await firebaseInit!.initFireb();
      typeServiceAuth = TypeServiceAuth.firebase;
    } catch (e) {
      huaweiInit = HuaweiInit();
      typeServiceAuth = TypeServiceAuth.huawei;
    }
  } else {
    try {
      huaweiInit = HuaweiInit();
      typeServiceAuth = TypeServiceAuth.huawei;
    } catch (e) {
      //TODO: mock
      typeServiceAuth = TypeServiceAuth.api;
    }
  }
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
Future<void> _initPushService() async {
  if (Platform.isAndroid) {
    //  bool permRes =await Permission.notification.isDenied;
    // if(permRes)
    // await Permission.notification.request();
    /// В случае если это Android  без GMS, или какой-нибудь другой Huawei, то выкенет ошибку и запустит другой сервис пушей
    try {
      //  await FirebaseMessaging.instance.requestPermission();
      // try {
      //   tokenn = await FirebaseMessaging.instance.getToken();
       // } catch (e) {
      // return;
      // }
      // try {
        // FirebaseMessaging.onBackgroundMessage((RemoteMessage message)=>_newPushMessageBack(message.data));
       // } catch (e) {
      // return;
      // }
    } catch (e) {
      // HuaweiPush huaweiPush = HuaweiPush();
      // huaweiPush.initPushHuawei();
    }
  } else if (Platform.isIOS) {
    try {
      //  await FirebaseMessaging.instance.requestPermission();
      // try {
      //   tokenn = await FirebaseMessaging.instance.getToken();
      // } catch (e) {
      // return;
      // }
      // try {
        // FirebaseMessaging.onBackgroundMessage((RemoteMessage message)=>_newPushMessageBack(message.data));
      // } catch (e) {
      // return;
      // }
    } catch (e) {}
  }
}

@pragma('vm:entry-point')
_newPushMessageBack(Map<String, dynamic> message) {

  String msgOSType = "";
  if (message.containsKey('data')) {
    // Handle data message
    msgOSType = 'data';
  } else {
    msgOSType = 'notification';
  }

  String? msgType = msgOSType == 'notification'
      ? message['type']
      : message[msgOSType]['type'];

  String unikey = msgOSType == 'notification'
      ? message['unikey'] ?? ""
      : message[msgOSType]['unikey'] ?? "";


  switch (msgType) {
    case "send_auth_notify":
      {
        if (msgOSType == 'notification') {
          String tokAuth = msgOSType == 'notification'
              ? message['token']
              : message[msgOSType]['token'];
          String newUser = msgOSType == 'notification'
              ? message['isNew']
              : message[msgOSType]['isNew'];
          // _setTokenAuthPush(tokAuth, newUser);
        } else {
          String tokAuth = msgOSType == 'notification'
              ? message['token']
              : message[msgOSType]['token'];
          String newUser = msgOSType == 'notification'
              ? message['isNew']
              : message[msgOSType]['isNew'];
          // _setTokenAuthPush(tokAuth, newUser);
        }
      }
      break;
    case "success_notify":
      {
      }
      break;
    default:
      {
      }
      break;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return WidgetsApp(
    //   debugShowCheckedModeBanner: false,
    //   color: Colors.deepPurple,
    //   initialRoute: Routes.splashPreloaderPageView,
    //   onGenerateRoute: StackedRouter().onGenerateRoute,
    //   navigatorKey: StackedService.navigatorKey,
    //   navigatorObservers: [
    //     StackedService.routeObserver,
    //   ],
    // );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: Routes.splashPreloaderPageView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
