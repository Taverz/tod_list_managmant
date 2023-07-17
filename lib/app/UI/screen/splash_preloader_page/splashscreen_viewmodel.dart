import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import '../../../core/route.dart';

class SplashScreenViewModel extends BaseViewModel {
  final _navigationService = GetIt.instance.get<AppRouter>();
  Future<void> preload() async {
    await Future.delayed(const Duration(seconds: 3));
    _navigationService.replace(LoginPage());
  }
}
