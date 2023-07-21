

import 'package:drift/drift.dart';

// part 'user.g.dart';

@DataClassName('UserObj')
class User extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get content => text().nullable()();
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
