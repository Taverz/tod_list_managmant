import 'dart:math';

// import 'package:agconnect_auth/agconnect_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tod_list_managmant/app/core/app.locator.dart';
import 'package:tod_list_managmant/app/core/app.router.dart';
import 'package:tod_list_managmant/app/data/repository/repository_simple.dart';
import 'package:tod_list_managmant/app/data/model/user_model.dart';

import '../../../../main.dart';
import '../../../core/app.dialogs.dart';
import '../../../service/auth/authorization.dart';
import '../../../service/auth/firebase_goog_auth.dart';
import '../../../service/auth/huawei_auth.dart';

/// Сотсояние UI при решистрации, что отображать в обределенный момент
enum StateRegistration {
  /// 1стр Ввод почты, куда отправить код
  LoginWriteFromCodeReq,
  /// 2стр Поле ввода кода
  CodeWriteConfirm,
  /// 3стр Несокольео полей ввода
  RegistrationField,

  /// Начать регистрацию заново, вернуться в начало
  LoginRepeatWrite,

  /// Неверный код
  ErroreCode,

  /// Привысил количество повторов
  ErroreCountRepeatMany,

  /// Ошибка регистрации
  ErroreRegistration,

  /// Неправельно введенные поля
  ErroreField
}

class ModelRegistration {
  ModelRegistration();

  bool requestCodeSuccess = false;
  RegitrationW? auth;
  String? codeConfirm;
  String? name;
  String? password;
  String? email;

  StateRegistration statePage = StateRegistration.LoginWriteFromCodeReq;
}

class RegistrationViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _repositoryService = locator<RepositorySimple>();

  ModelRegistration _modelRegistration = ModelRegistration();

  bool get requestCodeSuccess => _modelRegistration.requestCodeSuccess;
  StateRegistration get statePage => _modelRegistration.statePage;


  initRegistration(){
    if (typeServiceAuth == TypeServiceAuth.firebase) {
      _modelRegistration.auth = FirebaseWRegistration();
    } else if (typeServiceAuth == TypeServiceAuth.huawei) {
      _modelRegistration.auth = HuaweiWRegistration();
    } else if (typeServiceAuth == TypeServiceAuth.api) {
      //TODO:  
    }
  }

  Future<void> registrationRequestCode({required String email}) async {
    _loading();
    _modelRegistration.email = email;
    // final VerifyCodeResult? userResult =
    //     await AuthHuaweiService().requestCodeConfirmEmail(
    //   login: email,
    // );
    //TODO: user save
    //TODO: change status dialog
    //TODO: delayed and close dialog
    _loadingStop();
    // if (userResult == null) {
    //   erroreRegistration();
    // } else {
    //   _changeState(StateRegistration.CodeWriteConfirm);
    // }
  }

  void writeCode(String code) {
    _modelRegistration.codeConfirm = code;
    _changeState(StateRegistration.RegistrationField);
  }

  Future<void> registration({
    required String password,
    required String email,
    required String name,
  }) async {
    _loading();
    // final AGCUser? userResult = await AuthHuaweiService().registration(
    //   email: email,
    //   code: _modelRegistration.codeConfirm!,
    //   password: password,
    // );
    _loadingStop();
    // if (userResult == null) {
    //   erroreRegistration();
    // } else {
    //   _saveUser();
    //   _navigateNextPage();
    // }
  }

  Future<bool> _saveUser() async {
    _repositoryService.addUserData(User_model(
      id_user: Random().nextInt(1000000).toString(),
      login: _modelRegistration.email!,
      password: _modelRegistration.password!,
      name: _modelRegistration.name!,
      email: _modelRegistration.email!,
    ));
    return true;
  }

  void _changeState(StateRegistration state) {
    _modelRegistration.statePage = state;
    notifyListeners();
  }

  void _loading() {
    _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Warning!',
      description: 'Give stacked stars.',
    );
  }

  void _loadingStop() {
    if(_dialogService.isDialogOpen??false){
      _dialogService.completeDialog(DialogResponse(confirmed: true));
    }
  }

  /// Errore data to registration
  void erroreRegistration({String? messageErrore}) {
    _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Warning!',
      description: 'Give stacked stars.',
    );
  }

  /// Errore after many errore request
  void warningManyRequestRegistration({String? messageWarning}) {
    _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Warning!',
      description: 'Give stacked stars.',
    );
  }

  void _navigateNextPage() {
    _navigationService.navigateToOrganizationListScreen();
  }

  void navigateLogin() {
    _navigationService.navigateToLoginPageView();
  }
}
