import 'package:drift/drift.dart';
import 'package:tod_list_managmant/data/local_sql/driftdatabase.dart';

import 'package:tod_list_managmant/data/local_sql/table/company.dart';


part 'dao_company.g.dart';


@DriftAccessor(tables: [Company])
class CompanyDao extends DatabaseAccessor<FirstDatabase> with _$CompanyDaoMixin {

  CompanyDao(FirstDatabase db) : super(db);

    /// From small list
  Future<List<Companyobj>> getAll() => select(company).get();
  /// From big list loaded
  Future<List<Companyobj>> limitCompany(int limit, {required int offset}) => (select(company)..limit(limit, offset: offset)).get();

  
  Future insertNewCompany(Companyobj obj) => into(company).insert(obj);
  Future deleteCompany(Companyobj obj) => delete(company).delete(obj);
  /// Change content and update state field
  Future updateCompany(Companyobj obj) => update(company).replace(obj);

}