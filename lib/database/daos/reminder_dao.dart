// import 'package:drift/drift.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:testrun/database/tables/reminder_table.dart';
// import 'package:testrun/database/tables/weight_tables.dart';
// import '../database.dart';

// part 'reminder_dao.g.dart';

// @DriftAccessor(tables: [Reminder])
// class ReminderDao extends DatabaseAccessor<AppDatabase> with _$ReminderDaoMixin {
//   ReminderDao(super.db);

//   Future<int> logWeight(
//     int userID,
//     DateTime date,
//     double amount,
//   ) {
//     return into(Reminder).insert(WeightLogCompanion(userID: Value(userID), date: Value(date), amount: Value(amount))
//     );
//   }

//   Future<int> insertWeight(int userID, double newWeight, DateTime today) async {
//     final insert = await into(weightLog).insert(WeightLogCompanion(userID: Value(userID), date: Value(today), amount: Value(newWeight)));
//     return insert;
//   }

  
// }