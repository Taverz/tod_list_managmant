// import 'dart:js_interop';
import 'dart:math';

import 'package:serverpod/serverpod.dart';
import 'package:todolist_server/src/generated/protocol.dart';

import '../generated/company.dart';

// This is an example endpoint of your server. It's best practice to use the
// `Endpoint` ending of the class name, but it will be removed when accessing
// the endpoint from the client. I.e., this endpoint can be accessed through
// `client.example` on the client side.

// After adding or modifying an endpoint, you will need to run
// `serverpod generate` to update the server and client code.
class ExampleEndpoint extends Endpoint {
  // You create methods in your endpoint which are accessible from the client by
  // creating a public method with `Session` as its first parameter. Supported
  // parameter types are `bool`, `int`, `double`, `String`, `DateTime`, and any
  // objects that are generated from your `protocol` directory. The methods
  // should return a typed future; the same types as for the parameters are
  // supported. The `session` object provides access to the database, logging,
  // passwords, and information about the request being made to the server.
  Future<String> hello(Session session, String name) async {
    return 'Hello $name';
  }

  Future<List<Companyw>?> getCompanyFromUser(
      Session session, String idCompany) async {
    final List<Companyw>? listCompany = await Companyw.find(session,
        where: (elem) => elem.idcompany.equals(idCompany));
    if (listCompany == null) {
      return null;
    }
    if (listCompany.isEmpty) {
      return null;
    }
    return listCompany;
  }

  Future<User?> authorization(Session session, String login, password) async {
    final List<User?>? ueser = await User.find(
      session,
      where: (p0) => p0.login.equals(login) & p0.password.equals(password),
    );
    if (ueser == null) {
      return null;
    }
    if (ueser.isEmpty) {
      return null;
    }
    return ueser[0];
  }

  Future<bool> registration(
    Session session, {
    required String name,
    required String iduser,
    required String login,
    required String password,
    required String email,
  }) async {
    final ueser = await User.find(
      session,
      where: (p0) => p0.login.equals(login) & p0.password.equals(password),
    );
    if (ueser.isEmpty) {
      final User us = User(
          name: name,
          iduser: iduser,
          login: login,
          password: password,
          email: email);
      await User.insert(session, us);
      return true;
    } else {
      return false;
    }
  }
}
