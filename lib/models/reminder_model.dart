import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tzd;

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

  /// Schedules a notification at a specific time and day of the week. The notification will be displayed with the provided [title] and [body] at the specified [date]. The [id] parameter is used to uniquely identify the notification, allowing for cancellation or modification later. The method uses the timezone package to ensure that the notification is scheduled according to the local timezone.
  static Future<void> schedule({
    required int id,
    required String title,
    required String body,
    required DateTime date,
  }) async {
    // final scheduled = tz.TZDateTime.from(date, tz.local);
    // debugPrint('System time: ${DateTime.now()}');
    // debugPrint('TZ local: ${tz.local}');
    // debugPrint('Input date: $date');
    // debugPrint('Scheduled date: $scheduled');
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

  static Future<void> cancelWeightReminder(int userID) {
    return cancel(notificationId(userID, ReminderType.weight));
  }

  static Future<int> scheduleWeightReminders({
    required int userID,
    required DateTime date,
  }) async {
    int id = notificationId(userID, ReminderType.weight);
    await schedule(
      id: id,
      title: 'Log your weight',
      body: 'Remember to log what your current weight.',
      date: date,
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

    // debugPrint('System time: ${DateTime.now()}');
    // debugPrint('TZ local: ${tz.local}');
    // // debugPrint('Input date: $date');
    // debugPrint('Scheduled date: $scheduled');

    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }

    // debugPrint('NOW: $now');
    // debugPrint('SCHEDULED: $scheduled');

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
      await schedule(
        id: notificationId(userID, ReminderType.fastStart),
        title: 'Eating window starting soon!',
        body: 'Your eating window starts in 15 minutes.',
        date: fastStart,
      );
    } else {
      await cancel(notificationId(userID, ReminderType.fastStart));
    }
    if (midpointEnabled) {
      await schedule(
        id: notificationId(userID, ReminderType.fastMidpoint),
        title: 'Eating window halfway through!',
        body: 'You\'re halfway through your eating window.',
        date: fastMid,
      );
    } else {
      await cancel(notificationId(userID, ReminderType.fastMidpoint));
    }
    if (endEnabled) {
      await schedule(
        id: notificationId(userID, ReminderType.fastEnd),
        title: 'Eating window ending soon!',
        body: 'Your eating window ends in 15 minutes.',
        date: fastEnd,
      );
    } else {
      await cancel(notificationId(userID, ReminderType.fastEnd));
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
      await scheduleDaily(
        id: notificationId(userID, ReminderType.fastStart),
        title: 'Eating window starting soon!',
        body: 'Your eating window starts in 15 minutes.',
        time: startTime,
      );
    } else {
      await cancel(notificationId(userID, ReminderType.fastStart));
    }
    if (midpointEnabled) {
      await scheduleDaily(
        id: notificationId(userID, ReminderType.fastMidpoint),
        title: 'Eating window halfway through!',
        body: 'You\'re halfway through your eating window.',
        time: midTime,
      );
    } else {
      await cancel(notificationId(userID, ReminderType.fastMidpoint));
    }
    if (endEnabled) {
      await scheduleDaily(
        id: notificationId(userID, ReminderType.fastEnd),
        title: 'Eating window ending soon!',
        body: 'Your eating window ends in 15 minutes.',
        time: endTime,
      );
    } else {
      await cancel(notificationId(userID, ReminderType.fastEnd));
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
  weight
}

extension ReminderID on ReminderType {
  int get id => switch (this) {
    ReminderType.fastStart => 1,
    ReminderType.fastMidpoint => 2,
    ReminderType.fastEnd => 3,
    ReminderType.foodLog => 4,
    ReminderType.waterLog => 5,
    ReminderType.deEscalation => 6,
    ReminderType.weight => 7,
  };
}
