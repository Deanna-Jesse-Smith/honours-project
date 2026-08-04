import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:testrun/database/tables/goal_tables.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:timezone/timezone.dart' as tz;

const Map<GoalType, int> reminderKey = {
  GoalType.fasting: 1,
  GoalType.hydration: 2,
  GoalType.nutrition: 3,
  GoalType.weight: 4,
};

const Map<String, int> fastingTypeKey = {
  'preStartTRE': 1,
  'startTRE': 2,
  'preEndTRE': 3,
  'endTRE': 4,
  'halfTRE': 5,
  'morningADF': 6,
  'halfADF': 7,
  'morningFiveTwo': 8,
};

extension NotificationIDs on GoalType {
  int reminderID({int index = 0}) {
    switch (this) {
      case GoalType.fasting:
        if (index == 1) return 0;
        if (index == 2) return 1;
        if (index == 3) return 2;
        if (index == 4) return 3;

        if (index == 5) return 4;
        if (index == 6) return 5;
        if (index == 7) return 6;
        if (index == 8) return 7;
      case GoalType.weight:
        return 8;
      case GoalType.hydration:
        return 9;
      case GoalType.nutrition:
        return 10;
    }
    return -1;
  }
}

class CalculateReminderTimes {
  CalculateReminderTimes();

  static void getTREtimes(UserSessionData session) {
    List<DateTime> list = [];
    list.add(session.startTime.subtract(const Duration(minutes: 15)));
    list.add(session.startTime);
    Duration temp = session.startTime.difference(session.endTime);
    
    list.add(session.endTime.subtract(const Duration(minutes: 15)));
    list.add(session.endTime);
    list.add(session.startTime.add(temp));

    setNotification(GoalType.fasting.reminderID(index: 1),
                      'Eating window ending soon!',
                      'Your eating window ends in 15 minutes.',
                      list[0],
                          'fasting_channel',
                          'Fasting Reminders',
                          '');

                          setNotification(GoalType.fasting.reminderID(index: 2),
                      'Eating window over!',
                      'Your eating window is finished for today, fasting starts now.',
                      list[1],
                          'fasting_channel',
                          'Fasting Reminders',
                          '');
    setNotification(GoalType.fasting.reminderID(index: 2),
                      'Eating window starting soon!',
                      'Your eating window starts in 15 minutes.',
                      list[2],
                          'fasting_channel',
                          'Fasting Reminders',
                          '');
    setNotification(GoalType.fasting.reminderID(index: 3),
                      'Eating window starting!',
                      'Your eating window starts now.',
                      list[3],
                          'fasting_channel',
                          'Fasting Reminders',
                          '');
    setNotification(GoalType.fasting.reminderID(index: 4),
                      'Eating window ending soon!',
                      'Your eating window ends in 15 minutes.',
                      list[4],
                          'fasting_channel',
                          'Fasting Reminders',
                          '');
    setNotification(GoalType.fasting.reminderID(index: 5),
                      'Halfway there',
                      'You\'re halfway through your eating window.',
                      list[5],
                          'fasting_channel',
                          'Fasting Reminders',
                          '');
  }

  // static List<DateTime> getADFtimes(UserSessionData session) {
    
  // }

  static void setNotification(int id, String title, String body, DateTime date, String channelID, String channelName, String description) {
    FlutterLocalNotificationsPlugin().zonedSchedule(
                      id: GoalType.fasting.reminderID(index: id),
                      title: title,
                      body: body,
                      scheduledDate: tz.TZDateTime.from(date, tz.local),
                      notificationDetails: const NotificationDetails(
                        android: AndroidNotificationDetails(
                          'fasting_channel',
                          'Fasting Reminders',
                          importance: Importance.max,
                          priority: Priority.high,
                        ),
                      ),
                      androidScheduleMode:
                          AndroidScheduleMode.exactAllowWhileIdle,
                    );
  }
}

extension TimeOfDayToDateTime on TimeOfDay {
  DateTime get dateTimeConversion {
    DateTime today = DateTime.now();
    return DateTime(today.year, today.month, today.day, hour, minute);
  }
}