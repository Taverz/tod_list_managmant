

import 'package:drift/drift.dart';
import 'package:tod_list_managmant/data/local_sql/drift_database.dart';
import 'package:tod_list_managmant/data/local_sql/table/user.dart';

part 'dao_user.g.dart';


@DriftAccessor(tables: [User])
class UserDao extends DatabaseAccessor<FirstDatabase> with _$UserDaoMixin {

  UserDao(FirstDatabase db) : super(db);

    /// From small list
  Future<List<Username>> getAll() => select(user).get();
  /// From big list loaded
  Future<List<Username>> limitUser(int limit, {int offset}) => (select(user)..limit(limit, offset: offset)).get();

  
  Future insertNewUser(Username obj) => into(user).insert(obj);
  Future deleteUser(Username obj) => delete(user).delete(obj);
  /// Change content and update state field
  Future updateUser(Username obj) => update(user).replace(obj);

}