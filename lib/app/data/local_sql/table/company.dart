import 'package:drift/drift.dart';

// part 'company.g.dart';

@DataClassName('Companyobj')
class Company extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get id_company => text()();
  TextColumn get name => text()();
  // TextColumn get description => text().nullable()();
  TextColumn get list_user => text().nullable()();
  // IntColumn get categoryId => integer().references(TodoCategories, #id)();

  TextColumn get generatedText => text().nullable().generatedAs(
      name + const Constant(' (') + id_company + const Constant(')'))();
}
