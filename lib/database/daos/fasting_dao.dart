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

  Future<int> startFast(int userID, FastingForm form, DateTime startTime, DateTime expectedStart) {
      // testing();

      final (result, severity) = evaluateTiming(
  startTime,
  expectedStart,
  FastResult.earlyStart,
  FastResult.lateStart,
);

    return into(fastLog).insert(
      FastLogCompanion.insert(
        userID: userID,
        formIF: form,
        startDateTime: Value(startTime),
        fastResult: Value(result.name),
        fastResultSeverity: Value(severity.toString()),
      ),
    );
  }

  Future<DateTime?> getLatestStart(int userID) async {
    final fast =
        await (selectOnly(fastLog)..addColumns([fastLog.startDateTime])
        ..where(fastLog.endDateTime.isNull())
              ..orderBy([OrderingTerm.desc(fastLog.fastLogID)])
              ..limit(1)).getSingleOrNull();
    return fast?.read(fastLog.startDateTime);
  }

  Future<int> breakFast(int userID, DateTime endTime, DateTime expectedEnd) async {
      // testing();

      final (result, severity) = evaluateTiming(
  endTime,
  expectedEnd,
  FastResult.earlyEnd,
  FastResult.lateEnd,
);

    final curLog =
        await (select(fastLog)
              ..orderBy([(f) => OrderingTerm.desc(f.fastLogID)])
              ..limit(1))
            .getSingle();

    return (update(fastLog)..where((f) => f.fastLogID.equals(curLog.fastLogID)))
        .write(FastLogCompanion(endDateTime: Value(endTime), fastResult: Value('${curLog.fastResult},${result.name}'), ));
  }

  Future<bool> isFasting() async {
    final fast =
        await (select(fastLog)
        ..where((f) => f.endDateTime.isNull())
              ..orderBy([(f) => OrderingTerm.desc(f.fastLogID)])
              ..limit(1))
            .getSingleOrNull();

    return fast != null;
  }

  Stream<bool> checkFastingStatus() {
    return (select(fastLog)
        ..where((f) => f.endDateTime.isNull())
              ..orderBy([(f) => OrderingTerm.desc(f.fastLogID)])
              ..limit(1)).watchSingleOrNull().map((fast) => fast != null);
  }

  Stream<List<FastLogData>> findFastsInRange(int userID, DateTime start, DateTime end) {
    final history =
        (select(fastLog)..where(
              (u) =>
                  u.userID.equals(userID) &
                  u.startDateTime.isSmallerOrEqualValue(end) &  // fasts that start before the end of the range
                  (u.endDateTime.isNull() | // current fast
                  u.endDateTime.isBiggerOrEqualValue(start))  // fasts that end during the range
            )
            ..orderBy([(f) => OrderingTerm.asc(f.startDateTime)]))
            .watch();

    return history;
  }

    Stream<List<FastLogData>> findFasts(int userID) {
    final history =
        (select(fastLog)..where(
              (u) => u.userID.equals(userID))
            ..orderBy([(f) => OrderingTerm.asc(f.startDateTime)]))
            .watch();

    return history;
  }

  Future<int> getCurDuration(int userID) async {
    final dur =
        await (select(fastLog)
        ..where((f) => f.userID.equals(userID))
              ..orderBy([(f) => OrderingTerm.desc(f.fastLogID)])
              ..limit(1)).getSingleOrNull();
    if (dur == null) return 0;

    DateTime start = dur.startDateTime;
    DateTime end = dur.endDateTime == null ? dur.endDateTime! : DateTime.now();
    return start.difference(end).inMinutes;
  }

  Future<List<FastLogData>> getDurations(int userID, String form) async {
    final avg = await (select(fastLog)..where((f) => f.userID.equals(userID) & f.formIF.equals(form) & f.endDateTime.isNotNull())).get();

    return avg;
  }

  // Future<void> testing() async {
  //   final count = await (select(fastLog)).get();

  //   for (FastLogData fast in count) {
  //     debugPrint(fast.toString());
  //   }
  //   debugPrint('User number: ${count.length}');
  // }

  void deleteAll() {
    fastLog.deleteAll();
  }

  Future<void> dummyData() async {
    await into(fastLog).insert(FastLogCompanion.insert(
  userID: 1,
  formIF: FastingForm.tre,
  fastResult: Value('asPlanned'),
  startDateTime: Value(DateTime(2026, 6, 20, 20, 15)),
  endDateTime: Value(DateTime(2026, 6, 21, 12, 20)),
));

await into(fastLog).insert(FastLogCompanion.insert(
  userID: 1,
  formIF: FastingForm.tre,
  fastResult: Value('earlyStart,lateEnd'),
  startDateTime: Value(DateTime(2026, 6, 21, 19, 55)),
  endDateTime: Value(DateTime(2026, 6, 22, 12, 5)),
));

await into(fastLog).insert(FastLogCompanion.insert(
  userID: 1,
  formIF: FastingForm.tre,
  fastResult: Value('skipped'),
  startDateTime: Value(DateTime(2026, 6, 22, 20, 30)),
  endDateTime: Value(DateTime(2026, 6, 23, 12, 45)),
));

await into(fastLog).insert(FastLogCompanion.insert(
  userID: 1,
  formIF: FastingForm.tre,
  fastResult: Value('earlyEnd'),
  startDateTime: Value(DateTime(2026, 6, 23, 20, 5)),
  endDateTime: Value(DateTime(2026, 6, 24, 11, 55)),
));

await into(fastLog).insert(FastLogCompanion.insert(
  userID: 1,
  formIF: FastingForm.tre,
  fastResult: Value('lateStart'),
  startDateTime: Value(DateTime(2026, 6, 24, 20, 20)),
  endDateTime: Value(DateTime(2026, 6, 25, 12, 30)),
));

await into(fastLog).insert(FastLogCompanion.insert(
  userID: 1,
  formIF: FastingForm.tre,
  fastResult: Value('asPlanned'),
  startDateTime: Value(DateTime(2026, 6, 25, 21, 0)),
  endDateTime: Value(DateTime(2026, 6, 26, 13, 10)),
));

await into(fastLog).insert(FastLogCompanion.insert(
  userID: 1,
  formIF: FastingForm.tre,
  fastResult: Value('earlyStart,lateEnd'),
  startDateTime: Value(DateTime(2026, 6, 26, 20, 40)),
  endDateTime: Value(DateTime(2026, 6, 27, 12, 50)),
));

await into(fastLog).insert(FastLogCompanion.insert(
  userID: 1,
  formIF: FastingForm.tre,
  fastResult: Value('lateStart,earlyEnd'),
  startDateTime: Value(DateTime(2026, 6, 27, 20, 0)),
  endDateTime: Value(DateTime(2026, 6, 28, 12, 0)),
));

await into(fastLog).insert(FastLogCompanion.insert(
  userID: 1,
  formIF: FastingForm.tre,
  fastResult: Value('skipped'),
  startDateTime: Value(DateTime(2026, 6, 28, 20, 10)),
  endDateTime: Value(DateTime(2026, 6, 29, 12, 25)),
));

await into(fastLog).insert(FastLogCompanion.insert(
  userID: 1,
  formIF: FastingForm.tre,
  fastResult: Value('asPlanned'),
  startDateTime: Value(DateTime(2026, 6, 29, 20, 35)),
  endDateTime: Value(DateTime(2026, 6, 30, 12, 40)),
));

await into(fastLog).insert(FastLogCompanion.insert(
  userID: 1,
  formIF: FastingForm.tre,
  fastResult: Value('asPlanned'),
  startDateTime: Value(DateTime(2026, 6, 30, 20, 0)),
  endDateTime: Value(DateTime(2026, 7, 1, 12, 10)),
));

await into(fastLog).insert(FastLogCompanion.insert(
  userID: 1,
  formIF: FastingForm.tre,
  fastResult: Value('asPlanned'),
  startDateTime: Value(DateTime(2026, 7, 1, 20, 20)),
  endDateTime: Value(DateTime(2026, 7, 2, 12, 30)),
));

await into(fastLog).insert(FastLogCompanion.insert(
  userID: 1,
  formIF: FastingForm.tre,
  fastResult: Value('asPlanned'),
  startDateTime: Value(DateTime(2026, 7, 2, 20, 45)),
  endDateTime: Value(DateTime(2026, 7, 3, 13, 0)),
));

await into(fastLog).insert(FastLogCompanion.insert(
  userID: 1,
  formIF: FastingForm.tre,
  fastResult: Value('asPlanned'),
  startDateTime: Value(DateTime(2026, 7, 3, 20, 10)),
  endDateTime: Value(DateTime(2026, 7, 4, 12, 15)),
));
  }
}
