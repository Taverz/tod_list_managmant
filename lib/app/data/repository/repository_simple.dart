import 'package:tod_list_managmant/app/data/local_sql/dao/daouser.dart';

import '../local_sql/dao/dao_company.dart';
import '../local_sql/dao/dao_todo.dart';
import '../local_sql/driftdatabase.dart';

class RepositorySimple implements CompanyRepo, TodoRepo, UserRepo {
  final FirstDatabase _database;

  final CompanyDao _daoCompany;
  final UserDao _daoUser;
  final TodosDao _daoTodo;

  const RepositorySimple._(
      this._database, this._daoCompany, this._daoTodo, this._daoUser);

  factory RepositorySimple.initAll() {
    final db = FirstDatabase();
    return RepositorySimple._(db, CompanyDao(db), TodosDao(db), UserDao(db));
  }

  @override
  Future<bool> addCompany(company) async {
    return _daoCompany.insertNewCompany(company) == 1 ? true : false;
  }

  @override
  Future<bool> addTodo(todo) async {
    return _daoTodo.insertNewTodo(todo) == 1 ? true : false;
  }

  @override
  addUserData(user) {
    _daoUser.insertNewUser(user);
  }

  @override
  Future<bool> changeTodo(todo) async {
    return _daoTodo.updateTodo(todo);
  }

  @override
  Future<bool> deleteCompany(company) async {
    return _daoCompany.deleteCompany(company) == null ? false : true;
  }

  @override
  Future<bool> deleteTodo(idTodo) async {
    // TODO: implement deleteTodo
    throw UnimplementedError();
  }

  @override
  deleteUserData(user) {
    // TODO: implement deleteUserData
    throw UnimplementedError();
  }

  @override
  Future<List<Companyobj>> getAllCompany() async {
    return _daoCompany.getAll();
  }

  @override
  Future<TodoObj> getTodo(int idTodo) async {
    return _daoTodo.getOneTodo(idTodo);
  }

  @override
  getUserData(user) {
    // TODO: implement getUserData
    throw UnimplementedError();
  }

  @override
  loadCompany(int count, int indexCurrent) {
    // TODO: implement loadCompany
    throw UnimplementedError();
  }
}

abstract class CompanyRepo {
  Future<List<Companyobj>> getAllCompany() async {
    throw UnimplementedError();
  }

  // get first 40 todos select company
  // loade + 40 todos select company
  Future<List<Companyobj>> loadCompany(int count, int indexCurrent) async {
    throw UnimplementedError();
  }

  Future<bool> addCompany(dynamic company) async {
    throw UnimplementedError();
  }

  Future<bool> deleteCompany(dynamic company) async {
    throw UnimplementedError();
  }
}

abstract class TodoRepo {
  Future<TodoObj> getTodo(int idTodo) async {
    throw UnimplementedError();
  }

  Future<bool> addTodo(dynamic todo) async {
    throw UnimplementedError();
  }

  Future<bool> deleteTodo(dynamic idTodo) async {
    throw UnimplementedError();
  }

  Future<bool> changeTodo(dynamic todo) async {
    throw UnimplementedError();
  }
}

abstract class UserRepo {
  getUserData(dynamic user) {}
  addUserData(dynamic user) {}
  deleteUserData(dynamic user) {}
}
