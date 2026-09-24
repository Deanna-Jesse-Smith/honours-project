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
    return into(weightLog).insert(WeightLogCompanion.insert(userID: userID, date: Value(date), amount: Value(amount))
    );
  }

  Future<double> getLatestWeight(int userID) async {
    final weightLogg = (selectOnly(weightLog)..addColumns([weightLog.amount]))..orderBy([OrderingTerm.desc(weightLog.date)])..limit(1);
    final weight = await weightLogg.getSingle();
    return weight.read(weightLog.amount)!;
  }

  Stream<double?> getCurWeight(int userID) {
    final weight = (selectOnly(weightLog)..addColumns([weightLog.amount])
    ..orderBy([OrderingTerm.desc(weightLog.date)])
    ..limit(1)).watchSingle();
    return weight.map((w) => w.read(weightLog.amount));
  }

  Future<int> insertWeight(int userID, double newWeight, DateTime today) async {
    final insert = await into(weightLog).insert(WeightLogCompanion.insert(userID: userID, date: Value(today), amount: Value(newWeight)));
    return insert;
  }

  Stream<List<(DateTime, double)>> getAllWeightLogs(int userID, DateTime? startDate) {
    startDate ??= DateTime.now().subtract(const Duration(days: 30));

    final weightLogs = (selectOnly(weightLog)
              ..addColumns([weightLog.date, weightLog.amount])
              // ..where(weightLog.userID.equals(userID))
              ..where(weightLog.date.isBiggerOrEqualValue(startDate))
              ..orderBy([OrderingTerm.desc(weightLog.date)]));
    return weightLogs.watch().map(
      (log) => log.map((entry) {
        final date = entry.read(weightLog.date)!;
        final amount = entry.read(weightLog.amount)!;
        return (date, amount);
      }).toList(),);
  }
}