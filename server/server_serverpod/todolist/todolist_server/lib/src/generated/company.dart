/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Companyw extends _i1.TableRow {
  Companyw({
    int? id,
    required this.name,
    required this.idcompany,
    this.iduserlist,
  }) : super(id);

  factory Companyw.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Companyw(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      idcompany: serializationManager
          .deserialize<String>(jsonSerialization['idcompany']),
      iduserlist: serializationManager
          .deserialize<List<String>?>(jsonSerialization['iduserlist']),
    );
  }

  static final t = CompanywTable();

  String name;

  String idcompany;

  List<String>? iduserlist;

  @override
  String get tableName => 'companytablew';
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'idcompany': idcompany,
      'iduserlist': iduserlist,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'name': name,
      'idcompany': idcompany,
      'iduserlist': iduserlist,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'name': name,
      'idcompany': idcompany,
      'iduserlist': iduserlist,
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
      case 'idcompany':
        idcompany = value;
        return;
      case 'iduserlist':
        iduserlist = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Companyw>> find(
    _i1.Session session, {
    CompanywExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Companyw>(
      where: where != null ? where(Companyw.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Companyw?> findSingleRow(
    _i1.Session session, {
    CompanywExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Companyw>(
      where: where != null ? where(Companyw.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Companyw?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Companyw>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required CompanywExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Companyw>(
      where: where(Companyw.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Companyw row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Companyw row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Companyw row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    CompanywExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Companyw>(
      where: where != null ? where(Companyw.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef CompanywExpressionBuilder = _i1.Expression Function(CompanywTable);

class CompanywTable extends _i1.Table {
  CompanywTable() : super(tableName: 'companytablew');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final name = _i1.ColumnString('name');

  final idcompany = _i1.ColumnString('idcompany');

  final iduserlist = _i1.ColumnSerializable('iduserlist');

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        idcompany,
        iduserlist,
      ];
}

@Deprecated('Use CompanywTable.t instead.')
CompanywTable tCompanyw = CompanywTable();
