

import 'package:agconnect_auth/agconnect_auth.dart';
import 'package:stacked/stacked.dart';

import '../../../other/logs/printe_log.dart';

class LoginViewModel extends BaseViewModel {
  // final _bottomSheetService = locator<BottomSheetService>();

  
  bool? confirmWriteData({required String password, required String login}){
    //TODO: Api request autorized
    return true;
  }

  Future<bool> _loginHuawei({required String login,required String password})async{
    AGCAuthCredential credential =
        EmailAuthProvider.credentialWithPassword(login, password);
    AGCAuth.instance.signIn(credential).then((signInResult) async {
      //get user info
      AGCUser? user = signInResult.user;
      AGCUser? currentUser = await AGCAuth.instance.currentUser;
      printWWWW("Success login Huawei");
    }).catchError((error) {
      printWWWW("Errore registration Huawei");
    });
    return false;
  }
  Future<bool> _registrationHuawei(email, code, password)async{
    EmailUser user = EmailUser(email, code, password: password);
    try {
      SignInResult resultregistrationEmail =
          await AGCAuth.instance.createEmailUser(user);
      if (resultregistrationEmail.user == null) {
        return false;
      }
      return true;
    } on AGCAuthException catch (error) {
      String codeException = error.code.toString();
      return false;
    }
  }
  Future<String?> _requestCodeConfirmEmail_FromRegistration({required String login})async{
    VerifyCodeSettings settings =
        VerifyCodeSettings(VerifyCodeAction.registerLogin, sendInterval: 5);
    try {
      VerifyCodeResult? resultVerifyCode =
          await EmailAuthProvider.requestVerifyCode(login, settings);
      return resultVerifyCode != null ?"":"";
    } on AGCAuthException catch (error) {
      String codeException = error.code.toString();
    }
  }
  Future<void> _logoutHuawei()async{
    AGCAuth.instance.signOut();
  }
}