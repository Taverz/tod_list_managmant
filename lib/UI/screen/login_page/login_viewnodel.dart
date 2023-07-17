import 'package:agconnect_auth/agconnect_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tod_list_managmant/app/route.dart';

import '../../../service/huawei_auth.dart';

class LoginViewModel extends BaseViewModel {
  final _dialogService = GetIt.instance.get<DialogService>();
  final _navigationService = GetIt.instance.get<AppRouter>();

  Future<void> loginConfirm(
      {required String password, required String login}) async {
    AGCUser? userResult =
        await AuthHuaweiService().login(login: login, password: password);
    if (userResult == null) {
      erroreLogin();
    } else {
      navigateNextPage();
    }
  }

  /// Errore data to login
  erroreLogin() {
    _dialogService.showDialog();
  }

  /// Errore after many errore request
  warningManyRequestLogin() {
    _dialogService.showDialog();
  }

  navigateNextPage() {
    _navigationService.navigate(LoginPage());
  }
}
