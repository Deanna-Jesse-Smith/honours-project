import 'package:drift/drift.dart';
import 'package:testrun/database/tables/goal_tables.dart';
import 'package:testrun/database/tables/reminder_table.dart';
import 'package:testrun/models/goals_model.dart';
import '../database.dart';

part 'reminder_dao.g.dart';

@DriftAccessor(tables: [Reminder])
class ReminderDao extends DatabaseAccessor<AppDatabase> with _$ReminderDaoMixin {
  ReminderDao(super.db);

  Future<int> insertReminder(int userID, DateTime time, String days, String text, GoalType type) async {
    final newReminder = into(reminder).insert(ReminderCompanion.insert(userID: userID, time: Value(time), days: Value(days), type: type));

    // TRE: ~15 minutes before/after and at the time, plus a halfway one? 5 daily
    // ADF: Have one at like 6:30 that reminds the person to not eat that day, plus one halfway through. 2 on fasting days
    // 5:2 A reminder to eat only one meal or one meal plus a snack that day? 1 on fasting days
    return newReminder;
  }

  Future<void> changeReminder(int reminderID, DateTime time, String days, String text) {
    return (update(reminder)..where((r) => r.reminderID.equals(reminderID))).write(ReminderCompanion(time: Value(time), days: Value(days)));
  }

  // void deleteReminder(int reminderID) {
  //   delete(reminder).where((r) => r.reminderID.equals(reminderID));
  // }

  Future<void> changeEnabled(int reminderID, bool isEnabled) {
    return (update(reminder)..where((r) => r.reminderID.equals(reminderID))).write(ReminderCompanion(isEnabled: Value(isEnabled)));
  }

  Future<List<ReminderData>> getReminders() {
    final reminders = (select(reminder)).get();
    return reminders;
  }
}