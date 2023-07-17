

import 'package:drift/drift.dart';
import 'package:tod_list_managmant/app/data/local_sql/driftdatabase.dart';

import 'package:tod_list_managmant/app/data/local_sql/table/todo.dart';

part 'dao_todo.g.dart';


@DriftAccessor(tables: [Todo])
class TodosDao extends DatabaseAccessor<FirstDatabase> with _$TodosDaoMixin {

  TodosDao(FirstDatabase db) : super(db);

  /// From small list
  Future<List<TodoObj>> getAll() => select(todo).get();
  /// From big list loaded
  Future<List<TodoObj>> limitTodos(int limit, {required int offset}) => (select(todo)..limit(limit, offset: offset)).get();

  
  Future insertNewTodo(TodoObj obj) => into(todo).insert(obj);
  Future deleteTodo(TodoObj obj) => delete(todo).delete(obj);
  /// Change content and update state field
  Future updateTodo(TodoObj obj) => update(todo).replace(obj);


}