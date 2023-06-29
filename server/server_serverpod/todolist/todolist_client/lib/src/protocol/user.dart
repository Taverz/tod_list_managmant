/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class User extends _i1.SerializableEntity {
  User({
    this.id,
    required this.name,
    required this.iduser,
    required this.login,
    required this.password,
    required this.email,
  });

  factory User.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return User(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      iduser:
          serializationManager.deserialize<String>(jsonSerialization['iduser']),
      login:
          serializationManager.deserialize<String>(jsonSerialization['login']),
      password: serializationManager
          .deserialize<String>(jsonSerialization['password']),
      email:
          serializationManager.deserialize<String>(jsonSerialization['email']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String iduser;

  String login;

  String password;

  String email;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'iduser': iduser,
      'login': login,
      'password': password,
      'email': email,
    };
  }
}
