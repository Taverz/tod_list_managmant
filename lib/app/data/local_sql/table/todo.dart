

import 'package:drift/drift.dart';

// part 'todo.g.dart';

@DataClassName('TodoObj')
class Todo extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get id_todo => text()();
  TextColumn get id_user_creater => text()();
  TextColumn get id_user_executor => text().nullable()();

  TextColumn get name => text()();
  TextColumn get description => text()();

  TextColumn get dateTime_create => text()();
  TextColumn get priority_task => text()();

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
      id_todo + const Constant(' (') + name +  description + const Constant(')'))();
}
