import 'package:drift/drift.dart';
import 'package:testrun/database/tables/hydration_tables.dart';
import '../database.dart';

part 'hydration_dao.g.dart';

@DriftAccessor(tables: [HydrationLog])
class HydrationDao extends DatabaseAccessor<AppDatabase>
    with _$HydrationDaoMixin {
  HydrationDao(super.db);

  Future<int> addHydration(int userId, DateTime when, double amount) {
    return into(hydrationLog).insert(
      HydrationLogCompanion.insert(
        userID: userId,
        logDateTime: Value(when),
        amount: Value(amount),
      ),
    );
  }

  Future<List<HydrationLogData>> getTodayHydration(int userId, DateTime today) {
    final todayStart = DateTime(
      today.year,
      today.month,
      today.day,
    );
    final todayEnd = todayStart.add(const Duration(days: 1));

    return (select(hydrationLog)..where(
          (u) =>
              u.userID.equals(userId) &
              u.logDateTime.isBiggerOrEqualValue(todayStart) &
              u.logDateTime.isSmallerOrEqualValue(todayEnd),
        ))
        .get();
  }
}
