import 'dart:async';

import 'package:agconnect_auth/agconnect_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
// import '../../../core/route.dart';

class SplashScreenViewModel extends BaseViewModel {
  // final _navigationService = GetIt.instance.get<AppRouter>();
  Future<void> preload() async {
    await Future.delayed(const Duration(seconds: 3));
    final AGCUser? userCurrent = await AGCAuth.instance.currentUser;
    if (userCurrent != null) {
      // _navigationService.replace(const OrganizationList());
    } else {
      // _navigationService.replace(LoginPage());
    }
  }
}
