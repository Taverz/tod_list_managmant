

import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart';
// import 'package:tod_list_managmant/app/locator.dart';

import '../../../app/route.dart';
// import '../app/routegr.dart';
// import '../login_page/login_page.dart';
// import '../service/navigation_service.dart';

class SplashScreenViewModel extends BaseViewModel {
  final _navigationService = GetIt.instance.get<AppRouter>();
  preload() async {
    await Future.delayed(Duration(seconds: 2));
    // Timer _timer = Timer(Duration(seconds: 1), (){
      _navigationService
      .push(LoginPage());
      // _timer!.cancel();
      // .navigateTo("/login");
      // .navigateToView (LoginPageView());
    // });
  }
}