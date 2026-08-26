import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:testrun/database/tables/goal_tables.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tzd;

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

    setNotification(
      GoalType.fasting.reminderID(index: 1),
      'Eating window ending soon!',
      'Your eating window ends in 15 minutes.',
      list[0],
      'fasting_channel',
      'Fasting Reminders',
      '',
    );

    setNotification(
      GoalType.fasting.reminderID(index: 2),
      'Eating window over!',
      'Your eating window is finished for today, fasting starts now.',
      list[1],
      'fasting_channel',
      'Fasting Reminders',
      '',
    );
    setNotification(
      GoalType.fasting.reminderID(index: 2),
      'Eating window starting soon!',
      'Your eating window starts in 15 minutes.',
      list[2],
      'fasting_channel',
      'Fasting Reminders',
      '',
    );
    setNotification(
      GoalType.fasting.reminderID(index: 3),
      'Eating window starting!',
      'Your eating window starts now.',
      list[3],
      'fasting_channel',
      'Fasting Reminders',
      '',
    );
    setNotification(
      GoalType.fasting.reminderID(index: 4),
      'Eating window ending soon!',
      'Your eating window ends in 15 minutes.',
      list[4],
      'fasting_channel',
      'Fasting Reminders',
      '',
    );
    setNotification(
      GoalType.fasting.reminderID(index: 5),
      'Halfway there',
      'You\'re halfway through your eating window.',
      list[5],
      'fasting_channel',
      'Fasting Reminders',
      '',
    );
  }

  // static List<DateTime> getADFtimes(UserSessionData session) {

  // }

  static void setNotification(
    int id,
    String title,
    String body,
    DateTime date,
    String channelID,
    String channelName,
    String description,
  ) {
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
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }
}

extension TimeOfDayToDateTime on TimeOfDay {
  DateTime get dateTimeConversion {
    DateTime today = DateTime.now();
    return DateTime(today.year, today.month, today.day, hour, minute);
  }
}

class NotificationSystem {
  static final FlutterLocalNotificationsPlugin plugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    tzd.initializeTimeZones();

    tz.setLocalLocation(tz.getLocation('Africa/Johannesburg'));

    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const settings = InitializationSettings(android: androidSettings);
    await plugin.initialize(settings: settings);
  }

  static Future<void> requestPermission() async {
    final android = plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    await android?.requestNotificationsPermission();

    await android?.requestExactAlarmsPermission();
  }

  static Future<void> schedule({
    required int id,
    required String title,
    required String body,
    required DateTime date,
  }) async {
    final scheduled = tz.TZDateTime.from(date, tz.local);
    debugPrint('System time: ${DateTime.now()}');
    debugPrint('TZ local: ${tz.local}');
    debugPrint('Input date: $date');
    debugPrint('Scheduled date: $scheduled');
    await plugin.zonedSchedule(
      id: id,
      title: title,
      body: body,
      scheduledDate: tz.TZDateTime.from(date, tz.local),
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'fasting_channel',
          'Fasting Reminders',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
    );
  }

  //   static Future<void> testNotification() async {
  //   final scheduled = tz.TZDateTime.now(tz.local).add(
  //     const Duration(seconds: 10),
  //   );

  //       debugPrint('System time: ${DateTime.now()}');
  // debugPrint('TZ local: ${tz.local}');
  // debugPrint('Scheduled date: $scheduled');
  //   debugPrint('NOW: ${tz.TZDateTime.now(tz.local)}');
  //   debugPrint('TEST SCHEDULED: $scheduled');

  //   await plugin.zonedSchedule(
  //     id: 999999,
  //     title: 'Test notification',
  //     body: 'If you see this, scheduled notifications work.',
  //     scheduledDate: scheduled,
  //     notificationDetails: const NotificationDetails(
  //       android: AndroidNotificationDetails(
  //         'logging_channel',
  //         'Logging Reminders',
  //         importance: Importance.high,
  //         priority: Priority.high,
  //       ),
  //     ),
  //     androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  //   );

  //   final pending = await plugin.pendingNotificationRequests();

  //   debugPrint(
  //     'Pending count: ${pending.length}',
  //   );
  // }

  static Future<void> cancel(int id) async {
    await plugin.cancel(id: id);
  }

  static Future<int> scheduleMealReminders({
    required int userID,
    required TimeOfDay time,
  }) async {
    int id = notificationId(userID, ReminderType.foodLog);
    await scheduleDaily(
      id: id,
      title: 'Log your food',
      body: 'Remember to log what you ate today.',
      time: time,
    );
    return id;
  }

  static Future<void> cancelMealReminder(int userID) {
    return cancel(notificationId(userID, ReminderType.foodLog));
  }

  static Future<void> cancelWaterReminder(int userID) {
    return cancel(notificationId(userID, ReminderType.waterLog));
  }

  static Future<int> scheduleHydrationReminders({
    required int userID,
    required TimeOfDay time,
  }) async {
    int id = notificationId(userID, ReminderType.waterLog);
    await scheduleDaily(
      id: id,
      title: 'Log your water',
      body: 'Remember to log what you drank today.',
      time: time,
    );
    return id;
  }

  static Future<void> scheduleDaily({
    required int id,
    required String title,
    required String body,
    required TimeOfDay time,
  }) async {
    final now = tz.TZDateTime.now(tz.local);

    var scheduled = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    debugPrint('System time: ${DateTime.now()}');
    debugPrint('TZ local: ${tz.local}');
    // debugPrint('Input date: $date');
    debugPrint('Scheduled date: $scheduled');

    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }

    debugPrint('NOW: $now');
    debugPrint('SCHEDULED: $scheduled');

    await plugin.zonedSchedule(
      id: id,
      title: title,
      body: body,
      scheduledDate: scheduled,
      notificationDetails: const NotificationDetails(
        android: AndroidNotificationDetails(
          'logging_channel',
          'Logging Reminders',
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );

    final pending = await plugin.pendingNotificationRequests();

    for (final notification in pending) {
      debugPrint(
        'Pending notification: '
        'id=${notification.id}, '
        'title=${notification.title}, '
        'body=${notification.body}',
      );
    }
  }

  static Future<void> scheduleFastingRemindersNONTRE({
    required int userID,
    required DateTime fastStart,
    required DateTime fastMid,
    required DateTime fastEnd,
    required bool startEnabled,
    required bool midpointEnabled,
    required bool endEnabled,
  }) async {
    if (startEnabled) {
      schedule(
        id: notificationId(userID, ReminderType.fastStart),
        title: 'Eating window starting soon!',
        body: 'Your eating window starts in 15 minutes.',
        date: fastStart,
      );
    } else {
      cancel(notificationId(userID, ReminderType.fastStart));
    }
    if (midpointEnabled) {
      schedule(
        id: notificationId(userID, ReminderType.fastMidpoint),
        title: 'Eating window halfway through!',
        body: 'You\'re halfway through your eating window.',
        date: fastMid,
      );
    } else {
      cancel(notificationId(userID, ReminderType.fastMidpoint));
    }
    if (endEnabled) {
      schedule(
        id: notificationId(userID, ReminderType.fastEnd),
        title: 'Eating window ending soon!',
        body: 'Your eating window ends in 15 minutes.',
        date: fastEnd,
      );
    } else {
      cancel(notificationId(userID, ReminderType.fastEnd));
    }
  }

  static Future<void> scheduleFastingRemindersTRE({
    required int userID,
    required DateTime fastStart,
    required DateTime fastMid,
    required DateTime fastEnd,
    required bool startEnabled,
    required bool midpointEnabled,
    required bool endEnabled,
  }) async {
    final startReminder = fastStart.subtract(const Duration(minutes: 15));
    final endReminder = fastEnd.subtract(const Duration(minutes: 15));

    final startTime = TimeOfDay.fromDateTime(startReminder);
    final midTime = TimeOfDay.fromDateTime(fastMid);
    final endTime = TimeOfDay.fromDateTime(endReminder);

    if (startEnabled) {
      scheduleDaily(
        id: notificationId(userID, ReminderType.fastStart),
        title: 'Eating window starting soon!',
        body: 'Your eating window starts in 15 minutes.',
        time: startTime,
      );
    } else {
      cancel(notificationId(userID, ReminderType.fastStart));
    }
    if (midpointEnabled) {
      scheduleDaily(
        id: notificationId(userID, ReminderType.fastMidpoint),
        title: 'Eating window halfway through!',
        body: 'You\'re halfway through your eating window.',
        time: midTime,
      );
    } else {
      cancel(notificationId(userID, ReminderType.fastMidpoint));
    }
    if (endEnabled) {
      scheduleDaily(
        id: notificationId(userID, ReminderType.fastEnd),
        title: 'Eating window ending soon!',
        body: 'Your eating window ends in 15 minutes.',
        time: endTime,
      );
    } else {
      cancel(notificationId(userID, ReminderType.fastEnd));
    }
  }

  static Future<void> cancelAllFasting(int userID) async {
    cancel(notificationId(userID, ReminderType.fastStart));
    cancel(notificationId(userID, ReminderType.fastMidpoint));
    cancel(notificationId(userID, ReminderType.fastEnd));
  }

  static int fastingNotificationId(int userID, int dayOfWeek, ReminderType type) {
    return userID * 200 + dayOfWeek * 10 + type.index;
  }

  static int notificationId(int userID, ReminderType type) {
    return userID * 100 + type.index;
  }
}

enum ReminderType {
  fastStart,
  fastMidpoint,
  fastEnd,
  foodLog,
  waterLog,
  deEscalation,
}

extension ReminderID on ReminderType {
  int get id => switch (this) {
    ReminderType.fastStart => 1,
    ReminderType.fastMidpoint => 2,
    ReminderType.fastEnd => 3,
    ReminderType.foodLog => 4,
    ReminderType.waterLog => 5,
    ReminderType.deEscalation => 6,
  };
}
