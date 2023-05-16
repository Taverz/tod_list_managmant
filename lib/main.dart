
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/locator.dart';
import 'app/route.dart';
import 'app/route.dart' as r;
import 'service/setup_snackbar.dart';
import 'widget/dialog/dialog_custom.dart';
import 'widget/dialog/dialogrequest.dart';

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

  setupLocator();
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

void _initializeGetIt() {
  setupLocator();
}
void setupDialogUi(){
  final dialogService = locator<DialogService>();

	final builders = {
		DialogType.basic: (BuildContext context, DialogRequest request, MyCallbackFuncResponseDialog  completer)
    =>
		BasicDialog(request: request, completer: completer),
	};  

	dialogService.registerCustomDialogBuilders(builders);
}
void setupSnackbarUiWW(){}
void setupBottomSheetUi(){}


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
