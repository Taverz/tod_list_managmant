import 'package:drift/drift.dart';
import 'package:tod_list_managmant/app/data/local_sql/driftdatabase.dart';

import 'package:tod_list_managmant/app/data/local_sql/table/user.dart';

part 'daouser.g.dart';

@DriftAccessor(tables: [User])
class UserDao extends DatabaseAccessor<FirstDatabase> with _$UserDaoMixin {
  UserDao(FirstDatabase db) : super(db);

  /// From small list
  Future<List<UserObj>> getAll() => select(user).get();

  /// From big list loaded
  Future<List<UserObj>> limitUser(int limit, {required int offset}) =>
      (select(user)..limit(limit, offset: offset)).get();

  Future<int> insertNewUser(UserObj obj) => into(user).insert(obj);
  Future<int> deleteUser(UserObj obj) => delete(user).delete(obj);

  /// Change content and update state field
  Future<bool> updateUser(UserObj obj) => update(user).replace(obj);
}
