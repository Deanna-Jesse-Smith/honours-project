import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/reminder_model.dart';
import 'package:testrun/pages/fasting_history.dart';
import 'package:testrun/utils/Notifiers/reminder_notifier.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/custom_checkbox.dart';
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
  late int? weightDay;
  final List<bool> daySelected = List.filled(7, false);

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

    final weightRem = await ref
        .read(rDaoProvider)
        .getReminder(ReminderType.weight);
    if (weightRem != null) {
      weightDay = int.parse(weightRem.days!);
      daySelected[weightDay!] = true;
      isWeight = weightRem.isEnabled;
      weightTime = TimeOfDay.fromDateTime(weightRem.time!);
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
      weightText = weightTime.format(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    session = ref.watch(userSessionProvider).value!;
    // testing();
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                'Fasting (${session.fastingForm.label})',
                style: TextStyle(fontSize: TextSizing.large),
              ),
            ),
            if (session.fastingForm == FastingForm.tre)
              dailyFastReminder()
            else
              weekdayFastReminder(),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: const Text(
                'Hydration  (Daily)',
                style: TextStyle(fontSize: TextSizing.large),
              ),
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
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: const Text(
                'Weight (Weekly)',
                style: TextStyle(fontSize: TextSizing.large),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    value: isWeight,
                    onChanged: (bool? value) {
                      if (value! && weightDay != null) {
                        setState(() {
                          isWeight = value;
                          asyncReminder.setWeightReminder(
                            enabled: isWeight,
                            time: waterTime,
                            dayOfWeek: weightDay!,
                          );
                        });
                      } else {
                        Dialogs.dangerDialog(
                          context,
                          title: 'Invalid Selection',
                          message:
                              'One day of the week must be selected to create a weight reminder',
                              confrim: 'Back'
                        );
                      }
                    },
                    title: ElevatedButton(
                      onPressed: selectWeightTime,
                      child: Text(
                        weightText,
                        style: TextStyle(fontSize: TextSizing.medium),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (c) => getBox(c)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (c) => getBox(c + 4)),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: const Text(
                'Food (Daily)',
                style: TextStyle(fontSize: TextSizing.large),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                    value: isNutrition,
                    onChanged: (bool? value) {
                      setState(() {
                        isNutrition = value!;
                      });
                      asyncReminder.setFoodReminder(
                        enabled: isNutrition,
                        time: foodTime,
                      );
                    },
                    title: ElevatedButton(
                      onPressed: selectFoodTime,
                      child: Text(
                        foodText,
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
      ),
    );
  }

  CustomCheckbox getBox(int index) {
    return .new(
      isSelected: daySelected[index],
      dayOfWeek: daysOfWeek[index],
      onTap: (bool val) {
        final tempList = [...daySelected];
        tempList[index] = val;
        tempList.retainWhere((day) => day == true);
        if (tempList.isEmpty) {
          setState(() {
            daySelected[index] = false;
            weightDay = null;
          });
        } else if (tempList.length == 1) {
          setState(() {
            daySelected[index] = true;
            weightDay = index;
          });
        }
      },
    );
  }

  bool isStart = false, isEnd = false, isMid = false;

  // Future<void> testing() async {
  //   await asyncReminder.testingNotifs();
  // }

  Widget dailyFastReminder() {
    return Column(
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
          title: const Text(
            'Fast starting soon (15 minutes before)',
            style: TextStyle(fontSize: TextSizing.medium),
          ),
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
          title: const Text(
            'Halfway through fast',
            style: TextStyle(fontSize: TextSizing.medium),
          ),
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
          title: const Text(
            'Fast ending soon (15 minutes before)',
            style: TextStyle(fontSize: TextSizing.medium),
          ),
        ),
      ],
    );
  }

  Widget weekdayFastReminder() {
    final days = session.fastingForm == FastingForm.adf
        ? session.adfDaysSelected
        : session.fiveTwoDaysSelected;
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          CheckboxListTile(
            value: isStart,
            onChanged: (bool? value) => setState(() {
              isStart = value!;
              asyncReminder.setWeeklyFastingReminders(
                days: days,
                startEnabled: isStart,
                midpointEnabled: isMid,
                endEnabled: isEnd,
              );
            }),
            title: const Text(
              'The night before (20:00)',
              style: TextStyle(fontSize: TextSizing.medium),
            ),
          ),
          CheckboxListTile(
            value: isMid,
            onChanged: (bool? value) => setState(() {
              isMid = value!;
              asyncReminder.setWeeklyFastingReminders(
                days: days,
                startEnabled: isStart,
                midpointEnabled: isMid,
                endEnabled: isEnd,
              );
            }),
            title: const Text(
              'Halfway through fast',
              style: TextStyle(fontSize: TextSizing.medium),
            ),
          ),
          CheckboxListTile(
            value: isEnd,
            onChanged: (bool? value) => setState(() {
              isEnd = value!;
              asyncReminder.setWeeklyFastingReminders(
                days: days,
                startEnabled: isStart,
                midpointEnabled: isMid,
                endEnabled: isEnd,
              );
            }),
            title: const Text(
              'The morning after (06:00)',
              style: TextStyle(fontSize: TextSizing.medium),
            ),
          ),
        ],
      ),
    );
  }

  TimeOfDay foodTime = TimeOfDay.now(),
      waterTime = TimeOfDay.now(),
      weightTime = TimeOfDay.now();
  String foodText = '', waterText = '', weightText = '';

  Future<void> selectFoodTime() async {
    final time = await Dialogs.showTimeInput(context, initialTime: foodTime);
    if (time != null) {
      setState(() {
        foodTime = time;
        foodText = time.format(context);
      });

      // await asyncReminder.testingNotifs();

      if (isNutrition) {
        await asyncReminder.setFoodReminder(enabled: true, time: time);
      }
    }
  }

  Future<void> selectWaterTime() async {
    final time = await Dialogs.showTimeInput(context, initialTime: waterTime);
    if (time != null) {
      setState(() {
        waterTime = time;
        waterText = time.format(context);
      });

      // await asyncReminder.testingNotifs();

      if (isHydration) {
        await asyncReminder.setWaterReminder(enabled: true, time: time);
      }
    }
  }

  Future<void> selectWeightTime() async {
    final time = await Dialogs.showTimeInput(context, initialTime: weightTime);
    if (time != null) {
      setState(() {
        weightTime = time;
        weightText = time.format(context);
      });

      // await asyncReminder.testingNotifs();

      if (isWeight) {
        if (weightDay != null) {
          await asyncReminder.setWeightReminder(
            enabled: true,
            time: time,
            dayOfWeek: weightDay!,
          );
        } else {
          if (!mounted) return;
          Dialogs.dangerDialog(
            context,
            title: 'Invalid Selection',
            message:
                'One day of the week must be selected to create a weight reminder',
          );
        }
      }
    }
  }
}
