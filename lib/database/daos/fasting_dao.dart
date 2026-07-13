import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:testrun/models/converters.dart';
import '../database.dart';
import '../tables/fasting_tables.dart';

part 'fasting_dao.g.dart';

@DriftAccessor(tables: [FastLog])
class FastingDao extends DatabaseAccessor<AppDatabase> with _$FastingDaoMixin {
  FastingDao(super.attachedDatabase);

  Future<int> startFast(int userID, FastingForm form, DateTime startTime) {
    return into(fastLog).insert(
      FastLogCompanion.insert(
        userID: userID,
        formIF: Value(form.name),
        startDateTime: Value(startTime),
        endDateTime: Value(startTime)
      ),
    );
  }

  Future<int> breakFast(int userID, DateTime endTime) async {
    final curLog =
        await (select(fastLog)
              ..orderBy([(f) => OrderingTerm.desc(f.fastLogID)])
              ..limit(1))
            .getSingle();

    return (update(fastLog)..where((f) => f.fastLogID.equals(curLog.fastLogID)))
        .write(FastLogCompanion(endDateTime: Value(endTime)));
  }

  Future<FastLogData?> isFasting(int userID) {
    final fast =
        (select(fastLog)
        ..where((f) => f.userID.equals(userID) & f.endDateTime.isNull())
              ..orderBy([(f) => OrderingTerm.desc(f.fastLogID)])
              ..limit(1))
            .getSingleOrNull();

    return fast;
  }

  Stream<List<FastLogData>> findFastsInRange(int userID, DateTimeRange range) {
    final history =
        (select(fastLog)..where(
              (u) =>
                  u.userID.equals(userID) &
                  u.startDateTime.isSmallerOrEqualValue(range.end) &  // fasts that start before the end of the range
                  (u.endDateTime.isNull() | // current fast
                  u.endDateTime.isBiggerOrEqualValue(range.start))  // fasts that end during the range
            )
            ..orderBy([(f) => OrderingTerm.asc(f.startDateTime)]))
            .watch();

    return history;
  }
}
