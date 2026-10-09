import 'package:drift/drift.dart';
import 'package:testrun/database/tables/reminder_table.dart';
import 'package:testrun/models/reminder_model.dart';
import '../database.dart';

part 'reminder_dao.g.dart';

@DriftAccessor(tables: [Reminder])
class ReminderDao extends DatabaseAccessor<AppDatabase>
    with _$ReminderDaoMixin {
  ReminderDao(super.db);

  Future<void> changeReminder(
    int reminderID,
    DateTime time,
    String days,
    String text,
  ) {
    return (update(reminder)..where((r) => r.reminderID.equals(reminderID)))
        .write(ReminderCompanion(time: Value(time), days: Value(days)));
  }

  Future<void> changeEnabled(int reminderID, bool isEnabled) {
    return (update(reminder)..where((r) => r.reminderID.equals(reminderID)))
        .write(ReminderCompanion(isEnabled: Value(isEnabled)));
  }

  Future<List<ReminderData>> getReminders() {
    final reminders = (select(reminder)).get();
    return reminders;
  }

  Future<ReminderData?> getReminder(ReminderType type) {
    final rem = (select(reminder)..where((r) => r.type.equals(type.name)));
    return rem.getSingleOrNull();
  }

  Future<void> deleteReminder(int userID, ReminderType type) {
    return (delete(
      reminder,
    )..where((g) => g.userID.equals(userID) & g.type.equals(type.name))).go();
  }

  Future<void> saveReminder(ReminderCompanion reminders) async {
    await into(reminder).insert(
      reminders,
      onConflict: DoUpdate(
        (old) => reminders,
        target: [reminder.userID, reminder.type],
      ),
    );
  }
}
