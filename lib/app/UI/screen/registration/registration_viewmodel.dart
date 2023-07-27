
import 'package:agconnect_auth/agconnect_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


import '../../../core/route.dart';
import '../../../service/huawei_auth.dart';
import '../../widget/dialog/dialog_custom.dart';

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



  Future<void> registrationRequestCode({required String email}) async {
        _loading();
    final VerifyCodeResult? userResult =
        await AuthHuaweiService().requestCodeConfirmEmail(login: email,);
    //TODO: user save
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
    notifyListeners();
  }

  void _loading() {
    _dialogService.showCustomDialog(
      variant: DialogType.loading, // Which builder you'd like to call that was assigned in the builders function above.
      // title: 'This is a custom UI with Text as main button',
      // description: 'Sheck out the builder in the dialog_ui_register.dart file',
      // mainButtonTitle: 'Ok',
    ); //.showDialog(); 
  }
  void _loadingStop() {
    _dialogService.showDialog(
       title: "Title",
        description: "Description",
    );
  }

  /// Errore data to registration
  void erroreRegistration({String? messageErrore}) {
    _dialogService.showCustomDialog(
      variant: DialogType.errore, // Which builder you'd like to call that was assigned in the builders function above.
      title: messageErrore ?? 'Errore',
      // description: 'Sheck out the builder in the dialog_ui_register.dart file',
      mainButtonTitle: 'Ok',
    ); //.showDialog(); 
  }

  /// Errore after many errore request
  void warningManyRequestRegistration({String? messageWarning}) {
    _dialogService.showCustomDialog(
      variant: DialogType.warning, // Which builder you'd like to call that was assigned in the builders function above.
      title: messageWarning ?? 'Warning',
      // description: 'Sheck out the builder in the dialog_ui_register.dart file',
      mainButtonTitle: 'Ok',
    ); //.showDialog(); 
  }

  void _navigateNextPage() {
    _navigationService.navigate(const OrganizationList());
  }

  void navigateLogin() {
    _navigationService.navigate(LoginPage());
  }

}
