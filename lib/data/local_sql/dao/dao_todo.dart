

import 'package:drift/drift.dart';
import 'package:tod_list_managmant/data/local_sql/drift_database.dart';
import 'package:tod_list_managmant/data/local_sql/table/todo.dart';

part 'todos_dao.g.dart';


@DriftAccessor(tables: [Todo])
class TodosDao extends DatabaseAccessor<FirstDatabase> with _$TodosDaoMixin {

  TodosDao(FirstDatabase db) : super(db);

  /// From small list
  Future<List<Todoname>> getAll() => select(todo).get();
  /// From big list loaded
  Future<List<Todoname>> limitTodos(int limit, {int offset}) => (select(todo)..limit(limit, offset: offset)).get();

  
  Future insertNewTodo(Todoname obj) => into(todo).insert(obj);
  Future deleteTodo(Todoname obj) => delete(todo).delete(obj);
  /// Change content and update state field
  Future updateTodo(Todoname obj) => update(todo).replace(obj);


}