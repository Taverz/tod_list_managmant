
import 'authorization.dart';

class MockInit {

}

class MockCheckLogin implements CheckLoginW {
  @override
  TypeAuth? type;

  @override
  // TODO: implement typeGet
  TypeAuth get typeGet => throw UnimplementedError();

  @override
  checkLogin() {
    // TODO: implement checkLogin
    throw UnimplementedError();
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

class MockWLogin implements LoginW {
  @override
  init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  login() {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  logout() {
    // TODO: implement logout
    throw UnimplementedError();
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

class MockWRegistration implements RegitrationW {
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
  confirm() {
    // TODO: implement confirm
    throw UnimplementedError();
  }

  @override
  registration() {
    // TODO: implement registration
    throw UnimplementedError();
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
