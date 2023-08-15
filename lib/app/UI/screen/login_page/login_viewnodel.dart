// import 'package:agconnect_auth/agconnect_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tod_list_managmant/app/core/app.locator.dart';
import 'package:tod_list_managmant/app/core/app.router.dart';
import 'package:tod_list_managmant/main.dart';

// import '../../../core/route.dart';
import '../../../core/app.dialogs.dart';
import '../../../service/auth/authorization.dart';
import '../../../service/auth/firebase_goog_auth.dart';
import '../../../service/firebase_options.dart';
import '../../../service/auth/huawei_auth.dart';

class LoginViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  LoginW? auth;

  initLogin() {
    try {
      if (typeServiceAuth == TypeServiceAuth.firebase) {
        auth = FirebaseWLogin();
      } else if (typeServiceAuth == TypeServiceAuth.huawei) {
        auth = HuaweiWLogin();
      } else if (typeServiceAuth == TypeServiceAuth.api) {
        //TODO:
      }
    } catch (e) {
      if (typeServiceAuth == TypeServiceAuth.firebase) {
        typeServiceAuth == TypeServiceAuth.huawei;
      } else if (typeServiceAuth == TypeServiceAuth.huawei) {
        typeServiceAuth == TypeServiceAuth.api;
      } else if (typeServiceAuth == TypeServiceAuth.api) {
        typeServiceAuth == TypeServiceAuth.firebase;
      }
      erroreLogin(
          title: "Ошибка авторизации", description: "Попробуйте другой способ");
    }
  }

  Future<void> loginConfirm(
      {required String password, required String login}) async {
    try {
      final userResult = auth!.login();
      // dynamic userResult = true;
      if (userResult == null) {
        erroreLogin(
            title: "Ошибка авторизации",
            description: "Проверте правильность введенных данных");
      } else {
        _navigateNextPage();
      }
    } catch (e) {
      erroreLogin(
          title: "Ошибка авторизации",
          description: "Проверте правильность введенных данных");
    }
  }

  /// Errore data to login
  erroreLogin({String? title, String? description}) {
    _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Warning!',
      description: 'Give stacked stars.',
    );
  }

  /// Errore after many errore request
  warningManyRequestLogin({String? title, String? description}) {
    _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Warning!',
      description: 'Give stacked stars.',
    );
  }

  _navigateNextPage() {
    _navigationService.navigateToOrganizationListScreen();
  }

  navigateRegistration() {
    _navigationService.navigateToRegistrationPageView();
  }
}
