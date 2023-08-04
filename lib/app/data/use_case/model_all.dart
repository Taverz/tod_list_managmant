import 'company_usecase.dart';
import 'todo_usecase.dart';
import 'user_usecase.dart';

class ModelAppData {
  User_usecase? _user;
  Todo_usecase? _todo;
  Company_usecase? _company;

  ModelAppData();

  addUserData(User_usecase user) {
    _user = user;
  }

  deleteUserData() {
    _user = null;
  }

  addTodoData(Todo_usecase todo) {
    _todo = todo;
  }

  deleteTodoData() {
    _todo = null;
  }

  addCompanyData(Company_usecase comany) {
    _company = comany;
  }

  deleteCompanyData() {
    _company = null;
  }
}
