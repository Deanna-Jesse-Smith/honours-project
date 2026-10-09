import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/fasting_model.dart';
import '../database.dart';
import '../tables/fasting_tables.dart';

part 'fasting_dao.g.dart';

@DriftAccessor(tables: [FastLog])
class FastingDao extends DatabaseAccessor<AppDatabase> with _$FastingDaoMixin {
  FastingDao(super.attachedDatabase);

  Future<int> startFast(
    int userID,
    FastingForm form,
    DateTime startTime,
    FastResult result,
    int severity,
  ) {
    return attachedDatabase.transaction(() async {
      final activeFast =
          await (select(fastLog)
                ..where(
                  (fast) =>
                      fast.userID.equals(userID) & fast.endDateTime.isNull(),
                )
                ..orderBy([(fast) => OrderingTerm.desc(fast.fastLogID)])
                ..limit(1))
              .getSingleOrNull();

      if (activeFast != null) return activeFast.fastLogID;

      return into(fastLog).insert(
        FastLogCompanion.insert(
          userID: userID,
          formIF: form,
          startDateTime: Value(startTime),
          earlyFastResult: result,
          earlyResultSeverity: Value(severity),
        ),
      );
    });
  }

  Future<void> breakFast(
    int userID,
    DateTime endTime,
    FastResult result,
    int severity,
  ) async {
    final curLog =
        await (select(fastLog)
              ..where(
                (fast) =>
                    fast.userID.equals(userID) & fast.endDateTime.isNull(),
              )
              ..orderBy([(f) => OrderingTerm.desc(f.fastLogID)])
              ..limit(1))
            .getSingleOrNull();

    if (curLog == null) return;

    await (update(
      fastLog,
    )..where((f) => f.fastLogID.equals(curLog.fastLogID))).write(
      FastLogCompanion(
        endDateTime: Value(endTime),
        lateFastResult: Value(result),
        lateResultSeverity: Value(severity),
      ),
    );
  }

  Future<bool> isFasting(int userID) async {
    final fast =
        await (select(fastLog)
              ..where((f) => f.userID.equals(userID) & f.endDateTime.isNull())
              ..orderBy([(f) => OrderingTerm.desc(f.fastLogID)])
              ..limit(1))
            .getSingleOrNull();

    return fast != null;
  }

  Future<DateTime?> getLatestStart(int userID) async {
    final fast =
        await (selectOnly(fastLog)
              ..addColumns([fastLog.startDateTime])
              ..where(
                fastLog.userID.equals(userID) & fastLog.endDateTime.isNull(),
              )
              ..orderBy([OrderingTerm.desc(fastLog.fastLogID)])
              ..limit(1))
            .getSingleOrNull();
    return fast?.read(fastLog.startDateTime);
  }

  Future<int> createSyntheticFiveTwoLog(
    int userID,
    DateTime day,
    FastResult adherenceResult,
  ) {
    final dayStart = DateTime(day.year, day.month, day.day);
    final dayEnd = dayStart.add(const Duration(days: 1));

    return attachedDatabase.transaction(() async {
      final existingLog =
          await (select(fastLog)
                ..where(
                  (fast) =>
                      fast.userID.equals(userID) &
                      fast.formIF.equals(FastingForm.fiveTwo.name) &
                      fast.startDateTime.isBiggerOrEqualValue(dayStart) &
                      fast.startDateTime.isSmallerThanValue(dayEnd),
                )
                ..limit(1))
              .getSingleOrNull();

      if (existingLog != null) return existingLog.fastLogID;

      return into(fastLog).insert(
        FastLogCompanion.insert(
          userID: userID,
          formIF: FastingForm.fiveTwo,
          startDateTime: Value(dayStart),
          endDateTime: Value(dayEnd),
          earlyFastResult: adherenceResult,
        ),
      );
    });
  }

  Stream<bool> checkFastingStatus() {
    return (select(fastLog)
          ..where((f) => f.endDateTime.isNull())
          ..orderBy([(f) => OrderingTerm.desc(f.fastLogID)])
          ..limit(1))
        .watchSingleOrNull()
        .map((fast) => fast != null);
  }

  Future<List<FastLogData>> findAllFasts() {
    return (select(fastLog)
          ..orderBy([(f) => OrderingTerm.desc(f.fastLogID)])
          ..orderBy([(f) => OrderingTerm.asc(f.startDateTime)]))
        .get();
  }

  Stream<List<FastLogData>> findFastsInRange(DateTime start, DateTime end) {
    final history =
        (select(fastLog)
              ..where(
                (u) =>
                    u.formIF.equals(FastingForm.tre.name) &
                    // u.userID.equals(userID) &
                    u.startDateTime.isSmallerOrEqualValue(
                      end,
                    ) & // fasts that start before the end of the range
                    (u.endDateTime.isNull() | // current fast
                        u.endDateTime.isBiggerOrEqualValue(
                          start,
                        )), // fasts that end during the range
              )
              ..orderBy([(f) => OrderingTerm.asc(f.startDateTime)]))
            .watch();

    return history;
  }

  Future<List<FastLogData>> find52Fasts(DateTime start, DateTime end) {
    final history =
        (select(fastLog)
              ..where(
                (u) =>
                    u.formIF.equals(FastingForm.fiveTwo.name) &
                    u.startDateTime.isSmallerOrEqualValue(
                      end,
                    ) & // fasts that start before the end of the range
                    (u.endDateTime.isNull() | // current fast
                        u.endDateTime.isBiggerOrEqualValue(
                          start,
                        )), // fasts that end during the range
              )
              ..orderBy([(f) => OrderingTerm.asc(f.startDateTime)]))
            .get();

    return history;
  }

  Future<int> getCurDuration(int userID) async {
    final dur =
        await (select(fastLog)
              ..where((f) => f.userID.equals(userID))
              ..orderBy([(f) => OrderingTerm.desc(f.fastLogID)])
              ..limit(1))
            .getSingleOrNull();
    if (dur == null) return 0;

    DateTime start = dur.startDateTime;
    DateTime end = dur.endDateTime == null ? DateTime.now() : dur.endDateTime!;
    return end.difference(start).inMinutes;
  }

  Future<List<int>> getWeeksDuration(
    int userID,
    DateTime begin,
    DateTime last,
  ) async {
    final durs =
        await (select(fastLog)
              ..where(
                (f) =>
                    f.userID.equals(userID) &
                    f.startDateTime.isSmallerOrEqualValue(last) &
                    (f.endDateTime.isNull() |
                        f.endDateTime.isBiggerOrEqualValue(begin)),
              )
              ..orderBy([(f) => OrderingTerm.desc(f.fastLogID)]))
            .get();

    List<int> output = [];
    for (final dur in durs) {
      DateTime start = dur.startDateTime;
      DateTime end = dur.endDateTime == null
          ? DateTime.now()
          : dur.endDateTime!;
      output.add(end.difference(start).inMinutes);
    }

    return output;
  }

  Future<List<FastLogData>> getDurations(int userID, String form) async {
    final avg =
        await (select(fastLog)..where(
              (f) =>
                  f.userID.equals(userID) &
                  f.formIF.equals(form) &
                  f.endDateTime.isNotNull(),
            ))
            .get();

    return avg;
  }

  Future<void> testing() async {
    final count = await (select(fastLog)).get();

    for (FastLogData fast in count) {
      debugPrint(fast.toString());
    }
    debugPrint('Fasts number: ${count.length}');
  }

  void deleteAll() {
    fastLog.deleteAll();
  }

  Future<void> dummyData() async {
    await batch((batch) {
      batch.insertAll(fastLog, [
        FastLogCompanion.insert(
          userID: 1,
          formIF: FastingForm.tre,
          earlyFastResult: FastResult.asPlanned,
          lateFastResult: Value(FastResult.asPlanned),
          startDateTime: Value(DateTime(2026, 6, 20, 20, 15)),
          endDateTime: Value(DateTime(2026, 6, 21, 12, 20)),
          earlyResultSeverity: Value(0),
          lateResultSeverity: Value(0),
        ),
        FastLogCompanion.insert(
          userID: 1,
          formIF: FastingForm.tre,
          earlyFastResult: FastResult.earlyStart,
          lateFastResult: Value(FastResult.lateEnd),
          startDateTime: Value(DateTime(2026, 6, 21, 19, 55)),
          endDateTime: Value(DateTime(2026, 6, 22, 12, 5)),
          earlyResultSeverity: Value(30),
          lateResultSeverity: Value(40),
        ),
        FastLogCompanion.insert(
          userID: 1,
          formIF: FastingForm.tre,
          earlyFastResult: FastResult.skipped,
          lateFastResult: Value(FastResult.skipped),
          startDateTime: Value(DateTime(2026, 6, 22, 20, 30)),
          endDateTime: Value(DateTime(2026, 6, 23, 12, 45)),
          earlyResultSeverity: Value(0),
          lateResultSeverity: Value(0),
        ),
        FastLogCompanion.insert(
          userID: 1,
          formIF: FastingForm.tre,
          earlyFastResult: FastResult.asPlanned,
          lateFastResult: Value(FastResult.earlyEnd),
          startDateTime: Value(DateTime(2026, 6, 23, 20, 5)),
          endDateTime: Value(DateTime(2026, 6, 24, 11, 55)),
          earlyResultSeverity: Value(0),
          lateResultSeverity: Value(40),
        ),
        FastLogCompanion.insert(
          userID: 1,
          formIF: FastingForm.tre,
          earlyFastResult: FastResult.lateEnd,
          lateFastResult: Value(FastResult.asPlanned),
          startDateTime: Value(DateTime(2026, 6, 24, 20, 20)),
          endDateTime: Value(DateTime(2026, 6, 25, 12, 30)),
          earlyResultSeverity: Value(30),
          lateResultSeverity: Value(0),
        ),
        FastLogCompanion.insert(
          userID: 1,
          formIF: FastingForm.tre,
          earlyFastResult: FastResult.asPlanned,
          lateFastResult: Value(FastResult.asPlanned),
          startDateTime: Value(DateTime(2026, 6, 25, 21, 0)),
          endDateTime: Value(DateTime(2026, 6, 26, 13, 10)),
          earlyResultSeverity: Value(0),
          lateResultSeverity: Value(0),
        ),
        FastLogCompanion.insert(
          userID: 1,
          formIF: FastingForm.tre,
          earlyFastResult: FastResult.earlyStart,
          lateFastResult: Value(FastResult.lateEnd),
          startDateTime: Value(DateTime(2026, 6, 26, 20, 40)),
          endDateTime: Value(DateTime(2026, 6, 27, 12, 50)),
          earlyResultSeverity: Value(30),
          lateResultSeverity: Value(40),
        ),
        FastLogCompanion.insert(
          userID: 1,
          formIF: FastingForm.tre,
          earlyFastResult: FastResult.lateStart,
          lateFastResult: Value(FastResult.earlyEnd),
          startDateTime: Value(DateTime(2026, 6, 27, 20, 0)),
          endDateTime: Value(DateTime(2026, 6, 28, 12, 0)),
          earlyResultSeverity: Value(30),
          lateResultSeverity: Value(40),
        ),
        FastLogCompanion.insert(
          userID: 1,
          formIF: FastingForm.tre,
          earlyFastResult: FastResult.skipped,
          lateFastResult: Value(FastResult.skipped),
          startDateTime: Value(DateTime(2026, 6, 28, 20, 10)),
          endDateTime: Value(DateTime(2026, 6, 29, 12, 25)),
          earlyResultSeverity: Value(0),
          lateResultSeverity: Value(0),
        ),
        FastLogCompanion.insert(
          userID: 1,
          formIF: FastingForm.tre,
          earlyFastResult: FastResult.asPlanned,
          lateFastResult: Value(FastResult.asPlanned),
          startDateTime: Value(DateTime(2026, 6, 29, 20, 35)),
          endDateTime: Value(DateTime(2026, 6, 30, 12, 40)),
          earlyResultSeverity: Value(0),
          lateResultSeverity: Value(0),
        ),
        FastLogCompanion.insert(
          userID: 1,
          formIF: FastingForm.tre,
          earlyFastResult: FastResult.asPlanned,
          lateFastResult: Value(FastResult.asPlanned),
          startDateTime: Value(DateTime(2026, 6, 30, 20, 0)),
          endDateTime: Value(DateTime(2026, 7, 1, 12, 10)),
          earlyResultSeverity: Value(0),
          lateResultSeverity: Value(0),
        ),
        FastLogCompanion.insert(
          userID: 1,
          formIF: FastingForm.tre,
          earlyFastResult: FastResult.asPlanned,
          lateFastResult: Value(FastResult.asPlanned),
          startDateTime: Value(DateTime(2026, 7, 1, 20, 20)),
          endDateTime: Value(DateTime(2026, 7, 2, 12, 30)),
          earlyResultSeverity: Value(0),
          lateResultSeverity: Value(0),
        ),
        FastLogCompanion.insert(
          userID: 1,
          formIF: FastingForm.tre,
          earlyFastResult: FastResult.asPlanned,
          lateFastResult: Value(FastResult.asPlanned),
          startDateTime: Value(DateTime(2026, 7, 2, 20, 45)),
          endDateTime: Value(DateTime(2026, 7, 3, 13, 0)),
          earlyResultSeverity: Value(0),
          lateResultSeverity: Value(0),
        ),
        FastLogCompanion.insert(
          userID: 1,
          formIF: FastingForm.tre,
          earlyFastResult: FastResult.asPlanned,
          lateFastResult: Value(FastResult.asPlanned),
          startDateTime: Value(DateTime(2026, 7, 3, 20, 10)),
          endDateTime: Value(DateTime(2026, 7, 4, 12, 15)),
          earlyResultSeverity: Value(0),
          lateResultSeverity: Value(0),
        ),
      ]);
    });
  }
}
