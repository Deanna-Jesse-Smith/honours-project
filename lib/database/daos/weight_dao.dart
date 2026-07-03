import 'package:drift/drift.dart';
import 'package:testrun/database/tables/weight_tables.dart';
import '../database.dart';

part 'weight_dao.g.dart';

@DriftAccessor(tables: [WeightLog])
class WeightDao extends DatabaseAccessor<AppDatabase> with _$WeightDaoMixin {
  WeightDao(super.db);

  Future<int> logWeight(
    int userID,
    DateTime date,
    double amount,
  ) {
    return into(weightLog).insert(WeightLogCompanion(userID: Value(userID), date: Value(date), amount: Value(amount))
    );
  }

  
}