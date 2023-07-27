
import 'package:agconnect_auth/agconnect_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


import '../../../core/route.dart';
import '../../../service/huawei_auth.dart';

enum StateRegistration {
  LoginWriteFromCodeReq,
  CodeWriteConfirm,
  RegistrationField
}

class RegistrationViewModel extends BaseViewModel {
  final _dialogService = GetIt.instance.get<DialogService>();
  final _navigationService = GetIt.instance.get<AppRouter>();

  bool _requestCodeSuccess = false;
  bool get requestCodeSuccess => _requestCodeSuccess;

  String? _codeConfirm;

  StateRegistration _statePage = StateRegistration.LoginWriteFromCodeReq;
  StateRegistration get statePage => _statePage;



  Future<void> registrationRequestCode(
      { required String email}) async {
        _loading();
    final VerifyCodeResult? userResult =
        await AuthHuaweiService().requestCodeConfirmEmail(login: email,);
    //TODO: change status dialog
    //TODO: delayed and close dialog
    if (userResult == null) {
      erroreRegistration();
    } else {
      _changeState(StateRegistration.CodeWriteConfirm);
    }
  }

  void writeCode(String code){
    _codeConfirm = code;
    _changeState(StateRegistration.RegistrationField);
  }
  Future<void> registration(
      {required String password, required String email,  required String name }) async {
    final AGCUser? userResult =
        await AuthHuaweiService().registration(email: email, code: _codeConfirm!, password: password);
    if (userResult == null) {
      erroreRegistration();
    } else {
      _navigateNextPage();
    }
  }

  void _changeState(StateRegistration state){
    _statePage = state;
  }

  void _loading() {
    // _dialogService.showDialog();
  }
  void _loadingStop() {
    // _dialogService.showDialog();
  }

  /// Errore data to registration
  void erroreRegistration() {
    // _dialogService.showDialog();
  }

  /// Errore after many errore request
  void warningManyRequestRegistration() {
    _dialogService.showDialog();
  }

  void _navigateNextPage() {
    _navigationService.navigate(LoginPage());
  }

  void navigateLogin() {
    _navigationService.navigate(LoginPage());
  }

}
