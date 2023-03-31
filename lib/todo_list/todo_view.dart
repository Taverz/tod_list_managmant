
import 'package:stacked/stacked.dart';

class TodoViewModel extends BaseViewModel {
  List<String> _todo = [];
  List<String> get todos => _todo;

  String _dataTok = "";

  void startupLogic(){
    assert((){
      print("");
      return false;
    }());
  }

  set setDataTok(String vallue) => _dataTok;

  void addTodo(String text){
    _todo.add(text);
    notifyListeners();
  }

}