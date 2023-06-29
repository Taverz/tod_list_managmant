/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Todo extends _i1.SerializableEntity {
  Todo({
    this.id,
    required this.name,
    required this.idtodo,
    required this.idcompany,
    required this.datetimecreate,
    required this.description,
    required this.priority,
    required this.idusercreater,
    required this.iduserexecutor,
  });

  factory Todo.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Todo(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      idtodo:
          serializationManager.deserialize<String>(jsonSerialization['idtodo']),
      idcompany: serializationManager
          .deserialize<String>(jsonSerialization['idcompany']),
      datetimecreate: serializationManager
          .deserialize<String>(jsonSerialization['datetimecreate']),
      description: serializationManager
          .deserialize<String>(jsonSerialization['description']),
      priority: serializationManager
          .deserialize<String>(jsonSerialization['priority']),
      idusercreater: serializationManager
          .deserialize<String>(jsonSerialization['idusercreater']),
      iduserexecutor: serializationManager
          .deserialize<String>(jsonSerialization['iduserexecutor']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  String idtodo;

  String idcompany;

  String datetimecreate;

  String description;

  String priority;

  String idusercreater;

  String iduserexecutor;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'idtodo': idtodo,
      'idcompany': idcompany,
      'datetimecreate': datetimecreate,
      'description': description,
      'priority': priority,
      'idusercreater': idusercreater,
      'iduserexecutor': iduserexecutor,
    };
  }
}
