import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/reminder_model.dart';
import 'package:testrun/pages/FastingPlan.dart';
import 'package:testrun/utils/user_state.dart';

@riverpod
class AsyncReminder extends AsyncNotifier<NotificationSystem> {
  late UserSessionData? session;
  @override
  Future<NotificationSystem> build() {
    session = ref.watch(userSessionProvider).value;
    return Future.value(NotificationSystem());
  }

  Future<void> setFoodReminder({
    required bool enabled,
    required TimeOfDay time,
  }) async {
    if (enabled) {
      await ref
          .read(rDaoProvider)
          .saveReminder(
            ReminderCompanion(
              userID: Value(session!.userId),
              type: Value(ReminderType.foodLog),
              isEnabled: Value(enabled),
              time: Value(
                time.convertToDateTime(
                  DateTime(2026, 1, 1, time.hour, time.minute),
                ),
              ),
            ),
          );
      debugPrint('Inside reminder en');
      await NotificationSystem.scheduleMealReminders(
        userID: session!.userId,
        time: time,
      );
    } else {
      debugPrint('Inside reminder dis');
      await NotificationSystem.cancelMealReminder(session!.userId);
      await ref
          .read(rDaoProvider)
          .deleteReminder(session!.userId, ReminderType.foodLog);
    }
  }

  Future<void> setWaterReminder({
    required bool enabled,
    required TimeOfDay time,
  }) async {
    if (enabled) {
      await ref
          .read(rDaoProvider)
          .saveReminder(
            ReminderCompanion(
              userID: Value(session!.userId),
              type: Value(ReminderType.waterLog),
              isEnabled: Value(enabled),
              time: Value(
                time.convertToDateTime(
                  DateTime(2026, 1, 1, time.hour, time.minute),
                ),
              ),
            ),
          );
      await NotificationSystem.scheduleHydrationReminders(
        userID: session!.userId,
        time: time,
      );
    } else {
      await NotificationSystem.cancelWaterReminder(session!.userId);
      await ref
          .read(rDaoProvider)
          .deleteReminder(session!.userId, ReminderType.waterLog);
    }
  }

  Future<void> setWeightReminder({
    required bool enabled,
    required TimeOfDay time,
    required int dayOfWeek
  }) async {
    if (enabled) {
      await ref
          .read(rDaoProvider)
          .saveReminder(
            ReminderCompanion(
              userID: Value(session!.userId),
              type: Value(ReminderType.weight),
              isEnabled: Value(enabled),
              time: Value(
                time.convertToDateTime(
                  DateTime(2026, 1, 1, time.hour, time.minute),
                ),
              ),
              days: Value('$dayOfWeek')
            ),
          );
      DateTime temp = getFullDay(dayOfWeek);
      DateTime output = DateTime(temp.year, temp.month, temp.day, time.hour, time.minute);
      await NotificationSystem.scheduleWeightReminders(
        userID: session!.userId,
        date: output,
      );
    } else {
      await NotificationSystem.cancelWeightReminder(session!.userId);
      await ref
          .read(rDaoProvider)
          .deleteReminder(session!.userId, ReminderType.weight);
    }
  }

  Future<void> setWeeklyFastingReminders({
    required List<int> days,
    required bool startEnabled,
    required bool midpointEnabled,
    required bool endEnabled,
  }) async {
      await ref
          .read(rDaoProvider)
          .saveReminder(
            ReminderCompanion(
              userID: Value(session!.userId),
              type: Value(ReminderType.fastStart),
              isEnabled: Value(startEnabled),
              time: Value(DateTime(2026, 1, 1, 20)),
            ),
          );

      await ref
          .read(rDaoProvider)
          .saveReminder(
            ReminderCompanion(
              userID: Value(session!.userId),
              type: Value(ReminderType.fastEnd),
              isEnabled: Value(endEnabled),
              time: Value(DateTime(2026, 1, 1, 6)),
            ),
          );

      await ref
          .read(rDaoProvider)
          .saveReminder(
            ReminderCompanion(
              userID: Value(session!.userId),
              type: Value(ReminderType.fastMidpoint),
              isEnabled: Value(midpointEnabled),
              time: Value(DateTime(2026, 1, 1, 12, 30)),
            ),
          );

    for (final day in days) {
      DateTime? temp = getFullDay(day);

      DateTime start = temp
          .subtract(const Duration(days: 1))
          .copyWith(hour: 20);
      DateTime mid = temp.copyWith(hour: 12, minute: 30);
      DateTime end = temp.add(const Duration(days: 1)).copyWith(hour: 6);

      NotificationSystem.scheduleFastingRemindersNONTRE(
        userID: session!.userId,
        fastStart: start,
        fastMid: mid,
        fastEnd: end,
        startEnabled: startEnabled,
        midpointEnabled: midpointEnabled,
        endEnabled: endEnabled,
      );
    }
  }

  DateTime getFullDay(int dayOfWeek) {
    dayOfWeek++;
    DateTime now = DateTime.now();

    final diff = (dayOfWeek - now.weekday) % 7;

    return DateUtils.dateOnly(now.add(Duration(days: diff)));
  }

  Future<void> setFastingReminders({
    required DateTime fastStart,
    required DateTime fastEnd,
    required bool startEnabled,
    required bool midpointEnabled,
    required bool endEnabled,
  }) async {
    await ref
          .read(rDaoProvider)
          .saveReminder(
            ReminderCompanion(
              userID: Value(session!.userId),
              type: Value(ReminderType.fastStart),
              isEnabled: Value(startEnabled),
              time: Value(fastStart.subtract(const Duration(minutes: 15))),
            ),
          );
    

    await ref
          .read(rDaoProvider)
          .saveReminder(
            ReminderCompanion(
              userID: Value(session!.userId),
              type: Value(ReminderType.fastEnd),
              isEnabled: Value(endEnabled),
              time: Value(fastEnd.subtract(const Duration(minutes: 15))),
            ),
          );
    
    final midpoint = fastStart.add(fastEnd.difference(fastStart) ~/ 2);
    await ref
          .read(rDaoProvider)
          .saveReminder(
            ReminderCompanion(
              userID: Value(session!.userId),
              type: Value(ReminderType.fastMidpoint),
              isEnabled: Value(midpointEnabled),
              time: Value(midpoint),
            ),
          );
    

    await NotificationSystem.scheduleFastingRemindersTRE(
      userID: session!.userId,
      fastStart: fastStart,
      fastEnd: fastEnd,
      fastMid: midpoint,
      startEnabled: startEnabled,
      midpointEnabled: midpointEnabled,
      endEnabled: endEnabled,
    );
  }

  // Future<void> testingNotifs() async {
  //   await NotificationSystem.testNotification();
  // }

  // Future<void> interventionNotification() {

  // }
}

final asyncReminderNotifier =
    AsyncNotifierProvider<AsyncReminder, NotificationSystem>(AsyncReminder.new);
