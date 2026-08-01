import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/main.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/dialogs.dart';
import 'package:testrun/widgets/main_app_bar.dart';
import 'package:testrun/widgets/navigation_drawer.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class ReminderPage extends ConsumerStatefulWidget {
  const ReminderPage({super.key});

  @override
  ConsumerState<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends ConsumerState<ReminderPage> {
  bool isFast = false, isWeight = false, isHydration = false, isNutrition = false;

  final String dailyReminder = '0,1,2,3,4,5,6';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(userSessionProvider).value;
    DateTime today = DateTime.now();
    DateTime time = DateTime(today.year, today.month, today.day, 8);
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
              onPressed: () => Dialogs.getFastResultHelp(context),  //! Replace this with a relevant tooltip later
              icon: Icon(Icons.question_mark),
            ),
        )
      ],
    ),
      drawer: MyNavigationDrawer(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Fasting', style: TextStyle(fontSize: TextSizing.medium),),
              Tooltip(message: '',
              triggerMode: TooltipTriggerMode.tap,
              child: IconButton(onPressed: () => Dialogs.getFastResultHelp(context), icon: Icon(Icons.question_mark))),
            ],
          ),
          Row(children: [
            CheckboxListTile(value: isFast, onChanged: (bool? value) {
              setState(() {
                isFast = value!;
              });
            },
            title: const Text('Have fast reminder:'),),
          ],),
          const SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Hydration', style: TextStyle(fontSize: TextSizing.medium),),
              Tooltip(message: '',
              triggerMode: TooltipTriggerMode.tap,
              child: IconButton(onPressed: () => Dialogs.getFastResultHelp(context), icon: Icon(Icons.question_mark))),
            ],
          ),
          Row(children: [
            CheckboxListTile(value: isHydration, onChanged: (bool? value) {
              setState(() {
                isHydration = value!;
              });
            },
            title: const Text('Have daily hydration reminder:'),),
          ],),
          const SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Weight', style: TextStyle(fontSize: TextSizing.medium),),
              Tooltip(message: '',
              triggerMode: TooltipTriggerMode.tap,
              child: IconButton(onPressed: () => Dialogs.getFastResultHelp(context), icon: Icon(Icons.question_mark))),
            ],
          ),
          Row(children: [
            CheckboxListTile(value: isWeight, onChanged: (bool? value) {
              setState(() {
                isWeight = value!;
              });
            },
            title: const Text('Have weekly weight reminder:'),),
          ],),
          const SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Nutrition', style: TextStyle(fontSize: TextSizing.medium),),
              Tooltip(message: '',
              triggerMode: TooltipTriggerMode.tap,
              child: IconButton(onPressed: () => Dialogs.getFastResultHelp(context), icon: Icon(Icons.question_mark))),
            ],
          ),
          Row(children: [
            CheckboxListTile(value: isNutrition, onChanged: (bool? value) {
              setState(() async {
                isNutrition = value!;

                ref.read(rDaoProvider).insertReminder(session!.userId, time, dailyReminder, '');

                // await flutter(id: 0,androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, scheduledDate: tz.TZDateTime.now(tz.local), notificationDetails: const NotificationDetails(android: AndroidNotificationDetails('','')));
              });
            },
            title: const Text('Have daily food reminder:'),),
          ],),
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
}