import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/reminder_model.dart';
import 'package:testrun/utils/Notifiers/reminder_notifier.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/dialogs.dart';
import 'package:testrun/widgets/navigation_drawer.dart';

class ReminderPage extends ConsumerStatefulWidget {
  const ReminderPage({super.key});

  @override
  ConsumerState<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends ConsumerState<ReminderPage> {
  bool isFast = false,
      isWeight = false,
      isHydration = false,
      isNutrition = false;
  final String dailyReminder = '0,1,2,3,4,5,6';
  final String weeklyReminder = '0';
  late AsyncReminder asyncReminder;
  late UserSessionData session;

  @override
  void initState() {
    asyncReminder = ref.read(asyncReminderNotifier.notifier);

    initTimes();

    super.initState();
  }

  Future<void> initTimes() async {
    final waterRem = await ref
        .read(rDaoProvider)
        .getReminder(ReminderType.waterLog);
    if (waterRem != null) {
      isHydration = waterRem.isEnabled;
      waterTime = TimeOfDay.fromDateTime(waterRem.time!);
    }

    final foodRem = await ref
        .read(rDaoProvider)
        .getReminder(ReminderType.foodLog);
    if (foodRem != null) {
      isNutrition = foodRem.isEnabled;
      foodTime = TimeOfDay.fromDateTime(foodRem.time!);
    }

    final startRem = await ref
        .read(rDaoProvider)
        .getReminder(ReminderType.fastStart);
    if (startRem != null) {
      isStart = startRem.isEnabled;
    }

    final midRem = await ref
        .read(rDaoProvider)
        .getReminder(ReminderType.fastMidpoint);
    if (midRem != null) {
      isMid = midRem.isEnabled;
    }

    final endRem = await ref
        .read(rDaoProvider)
        .getReminder(ReminderType.fastEnd);
    if (endRem != null) {
      isEnd = endRem.isEnabled;
    }

    if (!mounted) return;
    setState(() {
      waterText = waterTime.format(context);
      foodText = foodTime.format(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    session = ref.watch(userSessionProvider).value!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Reminders', style: TextStyle(fontSize: TextSizing.large)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        actions: [
          Tooltip(
            message: '',
            triggerMode: TooltipTriggerMode.tap,
            child: IconButton(
              onPressed: () => Dialogs.getFastResultHelp(
                context,
              ), //! Replace this with a relevant tooltip later
              icon: Icon(Icons.question_mark),
            ),
          ),
        ],
      ),
      drawer: MyNavigationDrawer(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Fasting (${session!.fastingForm.label})',
                style: TextStyle(fontSize: TextSizing.medium),
              ),
              Tooltip(
                message: '',
                triggerMode: TooltipTriggerMode.tap,
                child: IconButton(
                  onPressed: () => Dialogs.getFastResultHelp(context),
                  icon: Icon(Icons.question_mark),
                ),
              ),
            ],
          ),
          if (session.fastingForm == FastingForm.tre)
            dailyFastReminder()
          else
            weekdayFastReminder(),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Hydration', style: TextStyle(fontSize: TextSizing.medium)),
              Tooltip(
                message: '',
                triggerMode: TooltipTriggerMode.tap,
                child: IconButton(
                  onPressed: () => Dialogs.getFastResultHelp(context),
                  icon: Icon(Icons.question_mark),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  value: isHydration,
                  onChanged: (bool? value) {
                    setState(() {
                      isHydration = value!;
                      asyncReminder.setWaterReminder(
                        enabled: isHydration,
                        time: waterTime,
                      );
                    });
                  },
                  title: ElevatedButton(
                    onPressed: selectWaterTime,
                    child: Text(
                      waterText,
                      style: TextStyle(fontSize: TextSizing.medium),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Weight', style: TextStyle(fontSize: TextSizing.medium)),
              Tooltip(
                message: '',
                triggerMode: TooltipTriggerMode.tap,
                child: IconButton(
                  onPressed: () => Dialogs.getFastResultHelp(context),
                  icon: Icon(Icons.question_mark),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  value: isWeight,
                  onChanged: (bool? value) {
                    setState(() {
                      isWeight = value!;
                    });
                  },
                  title: const Text('Have weekly weight reminder:'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Food', style: TextStyle(fontSize: TextSizing.medium)),
              Tooltip(
                message: '',
                triggerMode: TooltipTriggerMode.tap,
                child: IconButton(
                  onPressed: () => Dialogs.getFastResultHelp(context),
                  icon: Icon(Icons.question_mark),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CheckboxListTile(
                  value: isNutrition,
                  onChanged: (bool? value) {
                    setState(() async {
                      isNutrition = value!;
                      asyncReminder.setFoodReminder(
                        enabled: isNutrition,
                        time: foodTime,
                      );
                      // await FlutterLocalNotificationsPlugin(id: 0,androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, scheduledDate: tz.TZDateTime.now(tz.local), notificationDetails: const NotificationDetails(android: AndroidNotificationDetails('','')));
                    });
                  },
                  title: ElevatedButton(
                    onPressed: selectFoodTime,
                    child: Text(
                      waterText,
                      style: TextStyle(fontSize: TextSizing.medium),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Row(children: [
          //   const Text('Remind me at: '),
          //   ElevatedButton(onPressed: () async {
          //     final chosenTime = await Dialogs.showTimeInput(context);

          //     if (chosenTime != null) {

          //     }
          //   }, child: child)
          // ],)
        ],
      ),
    );
  }

  bool isStart = false, isEnd = false, isMid = false;

  Widget dailyFastReminder() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          CheckboxListTile(
            value: isStart,
            onChanged: (bool? value) => setState(() {
              isStart = value!;
              asyncReminder.setFastingReminders(
                fastStart: session.startTime,
                fastEnd: session.endTime,
                startEnabled: isStart,
                midpointEnabled: isMid,
                endEnabled: isEnd,
              );
            }),
            title: const Text('Fast starting soon (15 minutes before)'),
          ),
          CheckboxListTile(
            value: isMid,
            onChanged: (bool? value) => setState(() {
              isMid = value!;
              asyncReminder.setFastingReminders(
                fastStart: session.startTime,
                fastEnd: session.endTime,
                startEnabled: isStart,
                midpointEnabled: isMid,
                endEnabled: isEnd,
              );
            }),
            title: const Text('Halfway through fast'),
          ),
          CheckboxListTile(
            value: isEnd,
            onChanged: (bool? value) => setState(() {
              isEnd = value!;
              asyncReminder.setFastingReminders(
                fastStart: session.startTime,
                fastEnd: session.endTime,
                startEnabled: isStart,
                midpointEnabled: isMid,
                endEnabled: isEnd,
              );
            }),
            title: const Text('Fast ending soon (15 minutes before)'),
          ),
        ],
      ),
    );
  }

  Widget weekdayFastReminder() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          CheckboxListTile(
            value: isStart,
            onChanged: (bool? value) => setState(() {
              isStart = value!;
              asyncReminder.setFastingReminders(
                fastStart: DateTime(2026, 1, 1, 20, 00),
                fastEnd: DateTime(2026, 1, 1, 6, 0),
                startEnabled: isStart,
                midpointEnabled: isMid,
                endEnabled: isEnd,
              );
            }),
            title: const Text('The night before (20:00)'),
          ),
          CheckboxListTile(
            value: isMid,
            onChanged: (bool? value) => setState(() {
              isMid = value!;
              asyncReminder.setFastingReminders(
                fastStart: DateTime(2026, 1, 1, 20, 00),
                fastEnd: DateTime(2026, 1, 1, 6, 0),
                startEnabled: isStart,
                midpointEnabled: isMid,
                endEnabled: isEnd,
              );
            }),
            title: const Text('Halfway through fast'),
          ),
          CheckboxListTile(
            value: isEnd,
            onChanged: (bool? value) => setState(() {
              isEnd = value!;
              asyncReminder.setFastingReminders(
                fastStart: DateTime(2026, 1, 1, 20, 00),
                fastEnd: DateTime(2026, 1, 1, 6, 0),
                startEnabled: isStart,
                midpointEnabled: isMid,
                endEnabled: isEnd,
              );
            }),
            title: const Text('The morning after (06:00)'),
          ),
        ],
      ),
    );
  }

  TimeOfDay foodTime = TimeOfDay.now(), waterTime = TimeOfDay.now();
  String foodText = '', waterText = '';

  Future<void> selectFoodTime() async {
    final time = await Dialogs.showTimeInput(context, initialTime: foodTime);
    if (time != null) {
      setState(() {
        foodTime = time;
        foodText = time.format(context);
      });
    }
  }

  Future<void> selectWaterTime() async {
    final time = await Dialogs.showTimeInput(context, initialTime: waterTime);
    if (time != null) {
      setState(() {
        waterTime = time;
        waterText = time.format(context);
      });
    }
  }
}
