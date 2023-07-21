// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';


class Company_usecase {
  String id_company;
  List<String>? list_user;
  String name;
  Company_usecase({
    required this.id_company,
    this.list_user,
    required this.name,
  });

  Company_usecase copyWith({
    String? id_company,
    List<String>? list_user,
    String? name,
  }) {
    return Company_usecase(
      id_company: id_company ?? this.id_company,
      list_user: list_user ?? this.list_user,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id_company': id_company,
      'list_user': list_user,
      'name': name,
    };
  }

  factory Company_usecase.fromMap(Map<String, dynamic> map) {
    return Company_usecase(
      id_company: map['id_company'] as String,
      list_user: map['list_user'] != null ? List<String>.from((map['list_user'] as List<String>)) : null,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Company_usecase.fromJson(String source) => Company_usecase.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Company_usecase(id_company: $id_company, list_user: $list_user, name: $name)';

  @override
  bool operator ==(covariant Company_usecase other) {
    if (identical(this, other)) return true;
  
    return 
      other.id_company == id_company &&
      listEquals(other.list_user, list_user) &&
      other.name == name;
  }

  @override
  int get hashCode => id_company.hashCode ^ list_user.hashCode ^ name.hashCode;
}
