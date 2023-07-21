

import 'package:drift/drift.dart';

// part 'company.g.dart';

@DataClassName('Companyobj')
class Company extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get content => text().nullable()();
  // IntColumn get categoryId => integer().references(TodoCategories, #id)();

  //TODO:
  // String id_company;
  // List<String>? list_user;
  // String name;

  TextColumn get generatedText => text().nullable().generatedAs(
      title + const Constant(' (') + content + const Constant(')'))();
}
