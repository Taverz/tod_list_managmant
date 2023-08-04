// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class User_usecase {
  /// Random id
  String id_user;
  List<String>? list_company;
  String login;
  String password;
  String name;
  String email;
  User_usecase({
    required this.id_user,
    this.list_company,
    required this.login,
    required this.password,
    required this.name,
    required this.email,
  });

  User_usecase copyWith({
    String? id_user,
    List<String>? list_company,
    String? login,
    String? password,
    String? name,
    String? email,
  }) {
    return User_usecase(
      id_user: id_user ?? this.id_user,
      list_company: list_company ?? this.list_company,
      login: login ?? this.login,
      password: password ?? this.password,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_user': id_user,
      'list_company': list_company,
      'login': login,
      'password': password,
      'name': name,
      'email': email,
    };
  }

  factory User_usecase.fromMap(Map<String, dynamic> map) {
    return User_usecase(
      id_user: map['id_user'] as String,
      list_company: map['list_company'] != null
          ? List<String>.from((map['list_company'] as List<String>))
          : null,
      login: map['login'] as String,
      password: map['password'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User_usecase.fromJson(String source) =>
      User_usecase.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User_usecase(id_user: $id_user, list_company: $list_company, login: $login, password: $password, name: $name, email: $email)';
  }

  @override
  bool operator ==(covariant User_usecase other) {
    if (identical(this, other)) return true;

    return other.id_user == id_user &&
        listEquals(other.list_company, list_company) &&
        other.login == login &&
        other.password == password &&
        other.name == name &&
        other.email == email;
  }

  @override
  int get hashCode {
    return id_user.hashCode ^
        list_company.hashCode ^
        login.hashCode ^
        password.hashCode ^
        name.hashCode ^
        email.hashCode;
  }
}
