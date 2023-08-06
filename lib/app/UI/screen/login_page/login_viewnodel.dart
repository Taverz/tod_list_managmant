// import 'package:agconnect_auth/agconnect_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tod_list_managmant/app/core/app.locator.dart';
import 'package:tod_list_managmant/app/core/app.router.dart';

// import '../../../core/route.dart';
import '../../../core/app.dialogs.dart';
import '../../../service/huawei_auth.dart';

class LoginViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  Future<void> loginConfirm(
      {required String password, required String login}) async {
    // AGCUser? userResult =
    //     await AuthHuaweiService().login(login: login, password: password);
    // if (userResult == null) {
    //   erroreLogin(title: "Ошибка авторизации", description: "Проверте правильность введенных данных");
    // } else {
    //   _navigateNextPage();
    // }
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
    // TODO:
    _navigationService.navigateToRegistrationPageView();
  }
}
