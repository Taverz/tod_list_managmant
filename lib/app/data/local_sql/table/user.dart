

import 'package:drift/drift.dart';

// part 'user.g.dart';

@DataClassName('UserObj')
class User extends Table {
  IntColumn get id => integer().autoIncrement()();
  
  TextColumn get id_user => text()();
  TextColumn get list_company => text().nullable()();
  TextColumn get login => text()();

  TextColumn get password => text()();
  TextColumn get name => text()();
  TextColumn get email => text()();

  // TextColumn get description => text().nullable()();
  // IntColumn get categoryId => integer().references(TodoCategories, #id)();

  //TODO:
  //  /// Random id 
  // String id_user;
  // List<String>? list_company;
  // String login;
  // String password;
  // String name;
  // String email;


  // TextColumn get generatedText => text().nullable().generatedAs(
  //     title + const Constant(' (') + content + const Constant(')'))();
}
