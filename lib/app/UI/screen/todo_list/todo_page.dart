// import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'todo_viewmodel.dart';

// @RoutePage<String>(name:"TodoList")
class TodoView extends StackedView<TodoViewModel> {
  //extends HookWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  TodoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TodoViewModel();

  @override
  Widget builder(
    BuildContext context,
    TodoViewModel viewModel,
    Widget? child,
  ) {
    var todoController = useTextEditingController();
    return ViewModelBuilder<TodoViewModel>.reactive(
        viewModelBuilder: () => viewModel,
        builder: (context, model, child) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
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
                if (model.todos.isNotEmpty)
                  Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 20),
                      itemCount: model.todos.length,
                      itemBuilder: (context, index) {
                        return _elementList(model.todos[index]);
                      },
                    ),
                  )
              ],
            ),
          );
        });
  }

  Widget _elementList(String elemtListTodo) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.purple[100],
      ),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Text(elemtListTodo),
    );
  }
}
