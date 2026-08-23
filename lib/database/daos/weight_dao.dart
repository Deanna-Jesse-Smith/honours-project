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

  Future<double?> latestWeight(int userID) async { //! Convert to a stream later if I have the energy/time
    final weight = await (select(weightLog)
    ..orderBy([(u) => OrderingTerm.desc(u.userID)])
    ..limit(1))
    .getSingleOrNull();

    return weight?.amount;
  }

  Stream<double?> getCurWeight(int userID) {
    final weight = (selectOnly(weightLog)..addColumns([weightLog.amount])
    ..orderBy([OrderingTerm.desc(weightLog.date)])
    ..limit(1)).watchSingle();
    return weight.map((w) => w.read(weightLog.amount));
  }

  Future<int> insertWeight(int userID, double newWeight, DateTime today) async {
    final insert = await into(weightLog).insert(WeightLogCompanion(userID: Value(userID), date: Value(today), amount: Value(newWeight)));
    return insert;
  }
}