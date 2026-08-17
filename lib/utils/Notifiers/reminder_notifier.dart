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
    await ref
        .read(rDaoProvider)
        .saveReminder(
          ReminderCompanion(
            userID: Value(session!.userId),
            type: Value(ReminderType.foodLog),
            isEnabled: Value(true),
            time: Value(
              time.convertToDateTime(
                DateTime(2026, 1, 1, time.hour, time.minute),
              ),
            ),
          ),
        );

    if (enabled) {
      NotificationSystem.scheduleMealReminders(
        userID: session!.userId,
        time: time,
      );
    } else {
      NotificationSystem.cancelMealReminder(session!.userId);
      ref.read(rDaoProvider).deleteReminder(session!.userId, ReminderType.foodLog);
    }
  }

  Future<void> setWaterReminder({
    required bool enabled,
    required TimeOfDay time,
  }) async {
    await ref
        .read(rDaoProvider)
        .saveReminder(
          ReminderCompanion(
            userID: Value(session!.userId),
            type: Value(ReminderType.waterLog),
            isEnabled: Value(true),
            time: Value(
              time.convertToDateTime(
                DateTime(2026, 1, 1, time.hour, time.minute),
              ),
            ),
          ),
        );

    if (enabled) {
      NotificationSystem.scheduleHydrationReminders(
        userID: session!.userId,
        time: time,
      );
    } else {
      NotificationSystem.cancelWaterReminder(session!.userId);
      ref.read(rDaoProvider).deleteReminder(session!.userId, ReminderType.waterLog);
    }
  }

  Future<void> setFastingReminders({
   required DateTime fastStart,
    required DateTime fastEnd,
    required bool startEnabled,
    required bool midpointEnabled,
    required bool endEnabled,
  }) async {

    if (startEnabled) {
      await ref
        .read(rDaoProvider)
        .saveReminder(
          ReminderCompanion(
            userID: Value(session!.userId),
            type: Value(ReminderType.fastStart),
            isEnabled: Value(true),
            time: Value(
              fastStart),
              ),
            );
    }

    if (endEnabled) {
      await ref
        .read(rDaoProvider)
        .saveReminder(
          ReminderCompanion(
            userID: Value(session!.userId),
            type: Value(ReminderType.fastEnd),
            isEnabled: Value(true),
            time: Value(
              fastEnd),
              ),
            );
    }

    if (midpointEnabled) {
      final midpoint = fastStart.add(fastEnd.difference(fastStart) ~/ 2);
      await ref
        .read(rDaoProvider)
        .saveReminder(
          ReminderCompanion(
            userID: Value(session!.userId),
            type: Value(ReminderType.fastMidpoint),
            isEnabled: Value(true),
            time: Value(
              midpoint),
              ),
            );
    }

    NotificationSystem.scheduleFastingReminders(
      userID: session!.userId,
      fastStart: fastStart,
      fastEnd: fastEnd,
      startEnabled: startEnabled,
      midpointEnabled: midpointEnabled,
      endEnabled: endEnabled,
    );
  }

  // Future<void> interventionNotification() {

  // }
}

final asyncReminderNotifier =
    AsyncNotifierProvider<AsyncReminder, NotificationSystem>(AsyncReminder.new);
