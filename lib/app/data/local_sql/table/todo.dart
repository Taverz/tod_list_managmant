

import 'package:drift/drift.dart';

// part 'todo.g.dart';

@DataClassName('TodoObj')
class Todo extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get content => text().nullable()();
  // IntColumn get categoryId => integer().references(TodoCategories, #id)();

  //TODO:
  // String id_todo;
  // String id_user_creater;
  // String id_user_executor;

  // String name;
  // String description;

  // /// UTC date
  // String dateTime_create;
  // /// Convert to enum
  // PriorityTodoTask priority_task;

  TextColumn get generatedText => text().nullable().generatedAs(
      title + const Constant(' (') + content + const Constant(')'))();
}
