import 'package:agconnect_auth/agconnect_auth.dart';

import '../other/logs/printe_log.dart';


/// Авторизация через Huawei AgConnect
class AuthHuaweiService extends AuthService<AGCUser> {
  @override
  Future<AGCUser?> login({required String login,required String password})async{
    try{
      AGCAuthCredential credential =
          EmailAuthProvider.credentialWithPassword(login, password);
      SignInResult resultLogin = await AGCAuth.instance.signIn(credential);
      AGCUser? user = resultLogin.user;
      return user;
    } on AGCAuthException catch (error) {
      printWWWW("Huawei Errore ${error.message}");
      return null;
    }
  }
  /// 1 Нужно сначало запросить код подтвержждение, только потом начать регистрацию, передав код подтверждения при регистрации
  @override
  Future<bool> requestCodeConfirmEmail({required String login})async{
    VerifyCodeSettings settings =
        VerifyCodeSettings(VerifyCodeAction.registerLogin, sendInterval: 5);
    try {
      VerifyCodeResult? resultVerifyCode =
          await EmailAuthProvider.requestVerifyCode(login, settings);
      return resultVerifyCode != null ? true : false;
    } on AGCAuthException catch (error) {
      printWWWW("Huawei Errore ${error.message}");
      String codeException = error.code.toString();
      throw Exception(_convertErroreCodeToText(codeException));
    }
  }
  /// 2 После получения токена подтверждения, зарегестрировать пользователя
  @override
  Future<AGCUser?> registration(String email, code, password)async{
    EmailUser user = EmailUser(email, code, password: password);
    try {
      SignInResult resultregistrationEmail =
          await AGCAuth.instance.createEmailUser(user);
      return resultregistrationEmail.user;
    } on AGCAuthException catch (error) {
      printWWWW("Huawei Errore ${error.message}");
      String codeException = error.code.toString();
      throw Exception(_convertErroreCodeToText(codeException));
    }
  }
  /// Проверить авторизован ли полльзователь в локально аккаунте
  @override
  Future<AGCUser?> chechLogin()async{
    try{
      AGCUser? currentUser = await AGCAuth.instance.currentUser;
      return currentUser;
    }catch(e){
      printWWWW("Huawei Errore ${e}");
      return null;
    }
  }
  /// Выйти из аккаунта локального
  @override
  Future<bool> logout()async{
    try{
      AGCAuth.instance.signOut();
      return true;
    }catch(e){
      printWWWW("Huawei Errore ${e}");
      return false;
    }
  }
  /// По коду сообщения аозвращается текст об ошибке, какая именно ошибка
  String _convertErroreCodeToText(String code){
    return "";
  }
}

class AuthService<T> {
  Future<T?> login({required String login,required String password})async => null;
  Future<bool> requestCodeConfirmEmail({required String login})async => false;
  Future<T?> registration(String email, code, password)async => null;
  Future<T?> chechLogin()async => null;
  Future<bool> logout()async => false;
}

class AuthApi {

}