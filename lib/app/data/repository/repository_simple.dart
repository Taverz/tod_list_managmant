import 'dart:math';

import 'package:tod_list_managmant/app/data/local_sql/dao/daouser.dart';

import '../local_sql/dao/dao_company.dart';
import '../local_sql/dao/dao_todo.dart';
import '../local_sql/driftdatabase.dart';
import '../model/company_model.dart';
import '../model/user_model.dart';

class RepositorySimple implements CompanyRepo, TodoRepo, UserRepo {
  final CompanyDao _daoCompany;
  final UserDao _daoUser;
  final TodosDao _daoTodo;

  const RepositorySimple._(this._daoCompany, this._daoTodo, this._daoUser);

  factory RepositorySimple.initAll() {
    final db = FirstDatabase();
    return RepositorySimple._(CompanyDao(db), TodosDao(db), UserDao(db));
  }

  @override
  Future<bool> addCompany(Company_model company) async {
    String ranomNumer = "0";
    for(int i = 0; i<9;i++){
      final random = Random().nextInt(10);
      ranomNumer += random.toString();
    }
    return await _daoCompany.insertNewCompany(Companyobj(id: int.parse(ranomNumer), id_company: company.id_company, name: company.name)) == 1 ? true : false;
  }

  @override
  Future<bool> addTodo(todo) async {
    return await _daoTodo.insertNewTodo(todo) == 1 ? true : false;
  }

  @override
  Future addUserData(User_model user) async {
    final random = Random().nextInt(1000000);
    return await _daoUser.insertNewUser(UserObj(
              id: random,
              id_user: user.id_user,
              login: user.login,
              password: user.password,
              name: user.name,
              email: user.login,
            )) ==
            1
        ? true
        : false;
  }

  @override
  Future<bool> changeTodo(todo) async {
    return await _daoTodo.updateTodo(todo);
  }

  @override
  Future<bool> deleteCompany(Companyobj company) async {
    return await _daoCompany.deleteCompany(Companyobj(id: company.id, id_company: company.id_company, name: company.name)) == 0 ? false : true;
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
    return await _daoCompany.getAll();
  }

  @override
  Future<TodoObj> getTodo(int idTodo) async {
    return await _daoTodo.getOneTodo(idTodo);
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

  Future<bool> addCompany(Company_model company) async {
    throw UnimplementedError();
  }

  Future<bool> deleteCompany(Companyobj company) async {
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
  Future getUserData(dynamic user) async {
    throw UnimplementedError();
  }

  Future addUserData(User_model user) async {
    throw UnimplementedError();
  }

  Future deleteUserData(dynamic user) async {
    throw UnimplementedError();
  }
}
