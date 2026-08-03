import 'package:drift/drift.dart';
import 'package:testrun/database/tables/goal_tables.dart';
import 'package:testrun/database/tables/reminder_table.dart';
import '../database.dart';

part 'reminder_dao.g.dart';

@DriftAccessor(tables: [Reminder])
class ReminderDao extends DatabaseAccessor<AppDatabase> with _$ReminderDaoMixin {
  ReminderDao(super.db);

  Future<int> insertReminder(int userID, DateTime time, String days, String text, GoalType type) async {
    final newReminder = into(reminder).insert(ReminderCompanion.insert(userID: userID, time: Value(time), days: Value(days), type: type));

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