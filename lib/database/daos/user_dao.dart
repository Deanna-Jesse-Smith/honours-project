import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/utils/suggestions.dart';
import '../database.dart';
import '../tables/user_table.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  Future<int> addUser(
    String name,
    bool isMetric,
    FastingForm form,
    Experience exp,
    DateTime start,
    DateTime end,
    String days52,
    String daysADF,
    double height,
  ) {
    return into(users).insert(
      UsersCompanion.insert(
        formIF: form,
        experience: exp,
        name: name,
        typicalEatingStart: Value(start),
        typicalEatingEnd: Value(end),
        adfDaysSelected: Value(daysADF),
        fiveTwoDaysSelected: Value(days52),
        height: height,
      ),
    );
  }

  Future<void> updateTREtimes(int id, DateTime start, DateTime end) {
    // dynamic test = TimeOfDay(hour: 12, minute: 30);
    return (update(users)..where((u) => u.userID.equals(id))).write(
      UsersCompanion(
        typicalEatingStart: Value(start),
        typicalEatingEnd: Value(end),
      ),
    );
  }

  Future<void> testing() async {
    final count = await (select(users)).get();
    print('User number: ' + count.length.toString());
  }

  Future<String?> getName() async {
    final lastUser =
        await (select(users)
              ..orderBy([(u) => OrderingTerm.desc(u.userID)])
              ..limit(1))
            .getSingleOrNull();

    return lastUser?.name;
  }

  Future<User?> getUser() async {
    debugPrint('getting');
    final lastUser =
        await (select(users)
              ..orderBy([(u) => OrderingTerm.desc(u.userID)])
              ..limit(1))
            .getSingleOrNull();
            debugPrint('got');
    final count = await (select(users)).get();
    debugPrint('uDao: User number: ${count.length}');
    debugPrint(lastUser.toString());

    return lastUser;
  }

  Stream<User?> watchUser() {
    final lastUser =
       (select(users)
              ..orderBy([(u) => OrderingTerm.desc(u.userID)])
              ..limit(1))
            .watchSingleOrNull();
    return lastUser;
  } 

  Future<void> updateADF(int userID, List<int> newDays) async {
    String sqlDays = DayOfWeekConverter().toSQL(newDays);

    (update(users)..where((u) => u.userID.equals(userID))).write(
      UsersCompanion(adfDaysSelected: Value(sqlDays)),
    );
  }

  Future<void> update52(int userID, List<int> newDays) async {
    String sqlDays = DayOfWeekConverter().toSQL(newDays);

    (update(users)..where((u) => u.userID.equals(userID))).write(
      UsersCompanion(fiveTwoDaysSelected: Value(sqlDays)),
    );
  }

  Future<void> changeFormIF(
    int userID,
    FastingForm newForm,
    DateTime start,
    DateTime end,
    List<int> adfDays,
    List<int> fiveTwoDays,
  ) async {
    if (newForm == FastingForm.tre) {
      (update(users)..where((u) => u.userID.equals(1))).write(
        UsersCompanion(
          formIF: Value(FastingForm.tre),
          typicalEatingStart: Value(start),
          typicalEatingEnd: Value(end),
          adfDaysSelected: Value(DayOfWeekConverter().toSQL(adfDays)),
          fiveTwoDaysSelected: Value(DayOfWeekConverter().toSQL(fiveTwoDays)),
        ),
      );
    } else {
      (update(users)..where((u) => u.userID.equals(userID))).write(
      UsersCompanion(
        formIF: Value(newForm),
        adfDaysSelected: Value(DayOfWeekConverter().toSQL(adfDays)),
        fiveTwoDaysSelected: Value(DayOfWeekConverter().toSQL(fiveTwoDays)),
      ),
    );
    }
  }

  Future<void> changeToTRE(int userID, DateTime start, DateTime end) async {
    (update(users)..where((u) => u.userID.equals(1))).write(
      UsersCompanion(
        formIF: Value(FastingForm.tre),
        typicalEatingStart: Value(start),
        typicalEatingEnd: Value(end),
      ),
    );
  }

  Future<void> changeToADF(int userID, List<int> days) async {
    (update(users)..where((u) => u.userID.equals(userID))).write(
      UsersCompanion(
        formIF: Value(FastingForm.adf),
        adfDaysSelected: Value(DayOfWeekConverter().toSQL(days)),
      ),
    );
  }

  Future<void> changeTo52(int userID, List<int> days) async {
    (update(users)..where((u) => u.userID.equals(userID))).write(
      UsersCompanion(
        formIF: Value(FastingForm.fiveTwo),
        adfDaysSelected: Value(DayOfWeekConverter().toSQL(days)),
      ),
    );
  }
}
