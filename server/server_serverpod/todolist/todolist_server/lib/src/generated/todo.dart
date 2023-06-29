/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Todo extends _i1.TableRow {
  Todo({
    int? id,
    required this.name,
    required this.idtodo,
    required this.idcompany,
    required this.datetimecreate,
    required this.description,
    required this.priority,
    required this.idusercreater,
    required this.iduserexecutor,
  }) : super(id);

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

  static final t = TodoTable();

  String name;

  String idtodo;

  String idcompany;

  String datetimecreate;

  String description;

  String priority;

  String idusercreater;

  String iduserexecutor;

  @override
  String get tableName => 'todotable';
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

  @override
  Map<String, dynamic> toJsonForDatabase() {
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

  @override
  Map<String, dynamic> allToJson() {
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

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'name':
        name = value;
        return;
      case 'idtodo':
        idtodo = value;
        return;
      case 'idcompany':
        idcompany = value;
        return;
      case 'datetimecreate':
        datetimecreate = value;
        return;
      case 'description':
        description = value;
        return;
      case 'priority':
        priority = value;
        return;
      case 'idusercreater':
        idusercreater = value;
        return;
      case 'iduserexecutor':
        iduserexecutor = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Todo>> find(
    _i1.Session session, {
    TodoExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Todo>(
      where: where != null ? where(Todo.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Todo?> findSingleRow(
    _i1.Session session, {
    TodoExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Todo>(
      where: where != null ? where(Todo.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Todo?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Todo>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required TodoExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Todo>(
      where: where(Todo.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Todo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Todo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Todo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    TodoExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Todo>(
      where: where != null ? where(Todo.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef TodoExpressionBuilder = _i1.Expression Function(TodoTable);

class TodoTable extends _i1.Table {
  TodoTable() : super(tableName: 'todotable');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final name = _i1.ColumnString('name');

  final idtodo = _i1.ColumnString('idtodo');

  final idcompany = _i1.ColumnString('idcompany');

  final datetimecreate = _i1.ColumnString('datetimecreate');

  final description = _i1.ColumnString('description');

  final priority = _i1.ColumnString('priority');

  final idusercreater = _i1.ColumnString('idusercreater');

  final iduserexecutor = _i1.ColumnString('iduserexecutor');

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        idtodo,
        idcompany,
        datetimecreate,
        description,
        priority,
        idusercreater,
        iduserexecutor,
      ];
}

@Deprecated('Use TodoTable.t instead.')
TodoTable tTodo = TodoTable();
