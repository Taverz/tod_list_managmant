// import 'package:agconnect_auth/agconnect_auth.dart';

// import '../logs/printe_log.dart';

import 'authorization.dart';

/// Авторизация через Huawei AgConnect
// class AuthHuaweiService extends AuthService<AGCUser> {
//   @override
//   Future<AGCUser?> login(
//       {required String login, required String password}) async {
//     try {
//       AGCAuthCredential credential =
//           EmailAuthProvider.credentialWithPassword(login, password);
//       SignInResult? resultLogin = await AGCAuth.instance.signIn(credential);
//       AGCUser? user = resultLogin.user;
//       return user;
//     } on AGCAuthException catch (error) {
//       printWWWW("Huawei Errore ${error.message}");
//       return null;
//     }
//   }

//   /// 1 Нужно сначало запросить код подтвержждение, только потом начать регистрацию, передав код подтверждения при регистрации
//   @override
//   Future<VerifyCodeResult?> requestCodeConfirmEmail(
//       {required String login}) async {
//     VerifyCodeSettings settings =
//         VerifyCodeSettings(VerifyCodeAction.registerLogin, sendInterval: 5);
//     try {
//       VerifyCodeResult? resultVerifyCode =
//           await EmailAuthProvider.requestVerifyCode(login, settings);
//       return resultVerifyCode;
//     } on AGCAuthException catch (error) {
//       printWWWW("Huawei Errore ${error.message}");
//       String codeException = error.code.toString();
//       throw Exception(_convertErroreCodeToText(codeException));
//     }
//   }

//   /// 2 После получения токена подтверждения, зарегестрировать пользователя
//   @override
//   Future<AGCUser?> registration(
//       {required String email,
//       required String code,
//       required String password}) async {
//     EmailUser user = EmailUser(email, code, password: password);
//     try {
//       SignInResult resultregistrationEmail =
//           await AGCAuth.instance.createEmailUser(user);
//       return resultregistrationEmail.user;
//     } on AGCAuthException catch (error) {
//       printWWWW("Huawei Errore ${error.message}");
//       String codeException = error.code.toString();
//       throw Exception(_convertErroreCodeToText(codeException));
//     }
//   }

//   /// Проверить авторизован ли полльзователь в локально аккаунте
//   @override
//   Future<AGCUser?> chechLogin() async {
//     try {
//       AGCUser? currentUser = await AGCAuth.instance.currentUser;
//       return currentUser;
//     } catch (e) {
//       printWWWW("Huawei Errore ${e}");
//       return null;
//     }
//   }

//   /// Выйти из аккаунта локального
//   @override
//   Future<bool> logout() async {
//     try {
//       AGCAuth.instance.signOut();
//       return true;
//     } catch (e) {
//       printWWWW("Huawei Errore ${e}");
//       return false;
//     }
//   }

//   /// По коду сообщения аозвращается текст об ошибке, какая именно ошибка
//   String _convertErroreCodeToText(String code) {
//     return "";
//   }
// }

class AuthService<T> {
  Future<T?> login({required String login, required String password}) async =>
      null;
  Future<dynamic> requestCodeConfirmEmail({required String login}) async =>
      false;
  Future<T?> registration(
          {required String email,
          required String code,
          required String password}) async =>
      null;
  Future<T?> chechLogin() async => null;
  Future<bool> logout() async => false;
}


class HuaweiInit {

  Future initHuawei() async {
    //TODO:
  }
}

class HuaweiWLogin implements LoginW {
  @override
  init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  login() {
    // try {
    //   AGCAuthCredential credential =
    //       EmailAuthProvider.credentialWithPassword(login, password);
    //   SignInResult? resultLogin = await AGCAuth.instance.signIn(credential);
    //   AGCUser? user = resultLogin.user;
    //   return user;
    // } on AGCAuthException catch (error) {
    //   printWWWW("Huawei Errore ${error.message}");
    //   return null;
    // }
  }

  @override
  logout() {
    // try {
    //   AGCAuth.instance.signOut();
    //   return true;
    // } catch (e) {
    //   printWWWW("Huawei Errore ${e}");
    //   return false;
    // }
  }
  
  @override
  TypeAuth? type;

  @override
  set typeSet(typeW) {
    // TODO: implement typeSet
  }
  
  @override
  // TODO: implement typeGet
  TypeAuth get typeGet => throw UnimplementedError();

}

class HuaweCheckLogin implements CheckLoginW{
  @override
  TypeAuth? type;

  @override
  // TODO: implement typeGet
  TypeAuth get typeGet => throw UnimplementedError();

  @override
  checkLogin() {
    // try {
    //   AGCUser? currentUser = await AGCAuth.instance.currentUser;
    //   return currentUser;
    // } catch (e) {
    //   printWWWW("Huawei Errore ${e}");
    //   return null;
    // }
  }

  @override
  init() {
    // TODO: implement init
    throw UnimplementedError();
  }
  
  @override
  set typeSet(typeW) {
    // TODO: implement typeSet
  }
}

class HuaweiWRegistration implements RegitrationW {
  @override
  init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  checkConfirm() {
    // TODO: implement checkConfirm
    throw UnimplementedError();
  }

  @override
  confirm({String? login}) {
    // VerifyCodeSettings settings =
    //     VerifyCodeSettings(VerifyCodeAction.registerLogin, sendInterval: 5);
    // try {
    //   VerifyCodeResult? resultVerifyCode =
    //       await EmailAuthProvider.requestVerifyCode(login, settings);
    //   return resultVerifyCode;
    // } on AGCAuthException catch (error) {
    //   printWWWW("Huawei Errore ${error.message}");
    //   String codeException = error.code.toString();
    //   throw Exception(_convertErroreCodeToText(codeException));
    // }
  }

  @override
  registration({ String? login,
      String? code,
      String? password,
    }) async {
    // EmailUser user = EmailUser(login, code, password: password);
    // try {
    //   SignInResult resultregistrationEmail =
    //       await AGCAuth.instance.createEmailUser(user);
    //   await confirm(login: login);
    //   return resultregistrationEmail.user;
    // } on AGCAuthException catch (error) {
    //   printWWWW("Huawei Errore ${error.message}");
    //   String codeException = error.code.toString();
    //   throw Exception(_convertErroreCodeToText(codeException));
    // }
  }

  requestCode({String? login}){
    // VerifyCodeSettings settings =
    //     VerifyCodeSettings(VerifyCodeAction.registerLogin, sendInterval: 5);
    // try {
    //   VerifyCodeResult? resultVerifyCode =
    //       await EmailAuthProvider.requestVerifyCode(login, settings);
    //   return resultVerifyCode;
    // } on AGCAuthException catch (error) {
    //   printWWWW("Huawei Errore ${error.message}");
    //   String codeException = error.code.toString();
    //   throw Exception(_convertErroreCodeToText(codeException));
    // }
  }

    @override
  TypeAuth? type;

  @override
  set typeSet(typeW) {
    // TODO: implement typeSet
  }
  
  @override
  // TODO: implement typeGet
  TypeAuth get typeGet => throw UnimplementedError();
}