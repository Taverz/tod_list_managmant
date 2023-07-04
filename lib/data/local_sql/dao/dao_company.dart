import 'package:drift/drift.dart';
import 'package:tod_list_managmant/data/local_sql/drift_database.dart';
import 'package:tod_list_managmant/data/local_sql/table/company.dart';


part 'dao_company.g.dart';


@DriftAccessor(tables: [Company])
class CompanyDao extends DatabaseAccessor<FirstDatabase> with _$CompanyDaoMixin {

  CompanyDao(FirstDatabase db) : super(db);

    /// From small list
  Future<List<Companyname>> getAll() => select(company).get();
  /// From big list loaded
  Future<List<Companyname>> limitCompany(int limit, {int offset}) => (select(company)..limit(limit, offset: offset)).get();

  
  Future insertNewCompany(Companyname obj) => into(company).insert(obj);
  Future deleteCompany(Companyname obj) => delete(company).delete(obj);
  /// Change content and update state field
  Future updateCompany(Companyname obj) => update(company).replace(obj);

}