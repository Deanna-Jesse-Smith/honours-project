import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:testrun/database/tables/steps_tables.dart';
import '../database.dart';

part 'steps_dao.g.dart';

@DriftAccessor(tables: [StepsLog])
class StepsDao extends DatabaseAccessor<AppDatabase> with _$StepsDaoMixin {
  StepsDao(super.db);

  Future<int> logSteps(
    DateTime date,
    int steps,
  ) async {
    final checkToday = await (select(stepsLog)..where((s) => s.date.isValue(DateUtils.dateOnly(date)))).getSingleOrNull();

    if (checkToday == null) {
      (into(stepsLog).insert(StepsLogCompanion.insert(date: Value(date), startingStepCount: Value(steps))));
      return 0;
    } else {
      final stepsToday = steps - checkToday.startingStepCount;
      (update(stepsLog)..whereSamePrimaryKey(checkToday)).write(StepsLogCompanion(steps: Value(stepsToday)));
      return stepsToday;
    }
  }

  // Future<double> getLatestWeight(int userID) async {
  //   final weightLogg = (selectOnly(weightLog)..addColumns([weightLog.amount]))..orderBy([OrderingTerm.desc(weightLog.date)])..limit(1);
  //   final weight = await weightLogg.getSingle();
  //   return weight.read(weightLog.amount)!;
  // }

  // Stream<double?> getCurWeight(int userID) {
  //   final weight = (selectOnly(weightLog)..addColumns([weightLog.amount])
  //   ..orderBy([OrderingTerm.desc(weightLog.date)])
  //   ..limit(1)).watchSingle();
  //   return weight.map((w) => w.read(weightLog.amount));
  // }

  // Future<int> insertWeight(int userID, double newWeight, DateTime today) async {
  //   final insert = await into(weightLog).insert(WeightLogCompanion.insert(userID: userID, date: Value(today), amount: Value(newWeight)));
  //   return insert;
  // }
}