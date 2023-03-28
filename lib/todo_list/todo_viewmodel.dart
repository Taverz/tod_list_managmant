
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'todo_view.dart';

class TodoView extends HookWidget {
  const TodoView({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    var todoController = useTextEditingController();
    return ViewModelBuilder<TodoViewModel>.reactive(
      viewModelBuilder: ()=> TodoViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              model.addTodo(todoController.text);
              todoController.clear();
            },
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              TextField(
                controller: todoController,
              ),
              if(model.todos.isNotEmpty)
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                  itemCount: model.todos.length,
                  itemBuilder: (context, index){
                    return _elementList(model.todos[index]);
                  },
                ),
              )
              
            ],
          ),
        );
      }
    );
  }
  Widget _elementList(String elemtListTodo){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.purple[100],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.symmetric(
          horizontal: 25, vertical: 15),
      child: Text(elemtListTodo),
    );
  }
}