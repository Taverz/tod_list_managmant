
abstract class AuthW {
  TypeAuth? type;

  TypeAuth get typeGet => type ?? TypeAuth.anonumus;

  set typeSet(typeW) => type = typeW;

  @override
  String toString() => 'AuthW(type: $type)';

  @override
  bool operator ==(covariant AuthW other) {
    if (identical(this, other)) return true;

    return other.type == type;
  }

  @override
  int get hashCode => type.hashCode;
}

// class AuthApi {}

class LoginW extends AuthW {
  init() {}
  login() {}
  logout() {}
}

class CheckLoginW extends AuthW {
  init() {}
  checkLogin() {}
}

class RegitrationW extends AuthW {
  init() {}
  registration() {}
  confirm() {}
  checkConfirm() {}
}

enum TypeAuth { anonumus, googleaccount, email, phone }


enum TypeServiceAuth { huawei, firebase, api }



