
import 'package:stacked/stacked.dart';

class TodoViewModel extends BaseViewModel {
  List<String> _todo = [];
  List<String> get todos => _todo;

  void startupLogic(){
    assert((){
      print("");
      return false;
    }());
  }

  void addTodo(String text){
    _todo.add(text);
    notifyListeners();
  }

}