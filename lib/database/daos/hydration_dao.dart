import 'package:drift/drift.dart';
import 'package:testrun/database/tables/hydration_tables.dart';
import '../database.dart';

part 'hydration_dao.g.dart';

@DriftAccessor(tables: [HydrationLog])
class HydrationDao extends DatabaseAccessor<AppDatabase>
    with _$HydrationDaoMixin {
  HydrationDao(super.db);

  Future<int> addHydration(int userId, DateTime when, int amount) {
    return into(hydrationLog).insert(
      HydrationLogCompanion.insert(
        userID: userId,
        logDateTime: Value(when),
        amount: Value(amount.toDouble()),
      ),
    );
  }

  Future<double> getTodayHydration(int userId, DateTime today) async {
    final todayStart = DateTime(
      today.year,
      today.month,
      today.day,
    );
    final todayEnd = todayStart.add(const Duration(days: 1));
    final sumHydration = hydrationLog.amount.sum();

    final logs = selectOnly(hydrationLog)..addColumns([sumHydration])..where(
          hydrationLog.userID.equals(userId) &
              hydrationLog.logDateTime.isBiggerOrEqualValue(todayStart) &
              hydrationLog.logDateTime.isSmallerOrEqualValue(todayEnd),
        );
    final output = await logs.getSingle();
    return output.read(sumHydration)!;
  }
}
