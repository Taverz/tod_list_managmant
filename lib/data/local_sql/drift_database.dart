import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tod_list_managmant/data/local_sql/dao/dao_company.dart';
import 'package:tod_list_managmant/data/local_sql/dao/dao_todo.dart';
import 'package:tod_list_managmant/data/local_sql/dao/dao_user.dart';
import 'package:tod_list_managmant/data/local_sql/table/company.dart';
import 'package:tod_list_managmant/data/local_sql/table/todo.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

part 'drift_database.g.dart';

@DriftDatabase(
  tables: [
    Todo,
    User,
    Company,
  ],
  daos: [
    UserDao,
    CompanyDao,
    TodosDao,
  ],
)
class FirstDatabase extends _$FirstDatabase {
  // we tell the database where to store the data with this constructor
  FirstDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'db_drift_2023_07_03_111.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

// @DriftDatabase(tables: [
//   TodoItems,
//   TodoCategories,
// ], views: [
//   TodoCategoryItemCount,
//   TodoItemWithCategoryNameView,
// ])
// class Database extends _$Database {
//   Database(QueryExecutor e) : super(e);

//   @override
//   int get schemaVersion => 2;

//   // @override
//   // MigrationStrategy get migration {
//   //   return MigrationStrategy(
//   //     onCreate: (m) async {
//   //       await m.createAll();

//   //       // Add a bunch of default items in a batch
//   //       await batch((b) {
//   //         b.insertAll(todoItems, [
//   //           TodoItemsCompanion.insert(title: 'A first entry', categoryId: 0),
//   //           TodoItemsCompanion.insert(
//   //             title: 'Todo: Checkout drift',
//   //             content: const Value('Drift is a persistence library for Dart '
//   //                 'and Flutter applications.'),
//   //             categoryId: 0,
//   //           ),
//   //         ]);
//   //       });
//   //     },
//   //   );
//   // }


//   Stream<List<TodoItem>> get allItems => select(todoItems).watch();
// }


