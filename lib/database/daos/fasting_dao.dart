import 'dart:async';

import 'package:drift/drift.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/fasting_model.dart';
import '../database.dart';
import '../tables/fasting_tables.dart';

part 'fasting_dao.g.dart';

@DriftAccessor(tables: [FastLog])
class FastingDao extends DatabaseAccessor<AppDatabase> with _$FastingDaoMixin {
  FastingDao(super.attachedDatabase);

  /// Starts a new fast for the user with the given fasting form, start time, early fast result, and severity. If there is already an active fast for the user, it returns the ID of that fast instead of creating a new one.
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

  /// Breaks the current fast for the user with the given end time, late fast result, and severity. If there is no active fast for the user, it does nothing.
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

  /// Retrieves the start time of the latest active fast for the user with the given user ID. If there is no active fast, it returns null.
  /// 
  /// This method is useful for informing the user about their current fasting status and duration.
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

  /// Generates a synthetic log entry for the 5:2 fasting method for the user with the given user ID, day, and adherence result. If a log entry for that day already exists, it returns the existing log's ID instead of creating a new one.
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

  /// Retrieves a stream of fasting log entries for the user, ordered by start time in descending order. This allows for real-time updates to the fasting log as new entries are added or existing entries are modified.
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

  /// Retrieves a future list of fasting log entries for the user with the specified fasting form, ordered by start time in descending order.
  /// This method is useful for fetching historical fasting data for fasting goal analysis and progress tracking.
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

  /// Retrieves a future list of fasting log entries for the user with the specified fasting form, ordered by start time in descending order.
  /// This method is useful for fetching historical fasting data for fasting goal analysis and progress tracking.
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
}
