import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:testrun/custom_widgets.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/pages/fasting_history.dart';
import 'package:testrun/pages/goals_pages/goals_page.dart';
import 'package:testrun/utils/Notifiers/concerns_notifier.dart';
import 'package:testrun/utils/Notifiers/fasting_notifier.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/custom_checkbox.dart';
import 'package:testrun/widgets/dialogs.dart';
import 'package:testrun/widgets/fab.dart';
import 'package:testrun/widgets/navigation_drawer.dart';

class FastingPlan extends ConsumerStatefulWidget {
  const FastingPlan({super.key});
  @override
  ConsumerState<FastingPlan> createState() => FastingPlanState();
}

class FastingPlanState extends ConsumerState<FastingPlan> {
  late Future<FastingStreak?> curStreak;
  late FastingStreak? gottenStreak;

  List<bool> adfDaysSelected = List.filled(7, false),
      ogADF = List.filled(7, false);
  List<bool> fiveTwoDaysSelected = List.filled(7, false),
      ogFiveTwo = List.filled(7, false);

  static final List<DropdownMenuEntry<FastingForm>> entriess =
      UnmodifiableListView<DropdownMenuEntry<FastingForm>>(
        FastingForm.values.map<DropdownMenuEntry<FastingForm>>(
          (FastingForm form) =>
              DropdownMenuEntry(value: form, label: form.label),
        ),
      );
  late FastingForm dropDownValuee;
  TimeOfDay start = TimeOfDay(hour: 0, minute: 0),
      end = TimeOfDay(hour: 0, minute: 0);
  late AsyncFasting asyncFasting;

  @override
  void initState() {
    super.initState();

    final session = ref.read(userSessionProvider).value;
    dropDownValuee = session!.fastingForm;
    asyncFasting = ref.read(asyncFatingNotifier.notifier);

    ogFiveTwo = intsToBools(session.fiveTwoDaysSelected, ogFiveTwo);
    fiveTwoDaysSelected = List<bool>.of(ogFiveTwo);

    ogADF = intsToBools(session.adfDaysSelected, ogADF);
    adfDaysSelected = List<bool>.of(ogADF);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final concern = await ref
          .read(asyncConcernsProvider.notifier)
          .getConcern(GoalType.fasting);

      if (!mounted) return;

      if (concern != null) {
        await ref
            .read(asyncConcernsProvider.notifier)
            .doConcernDialogue(concern, context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(userSessionProvider);

    // ref.read(gDaoProvider).createDummyGoals();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fasting Plan',
          style: TextStyle(fontSize: TextSizing.large),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        actions: [
          const Tooltip(
            message:
                'Toggle your fast from the floating action button on your screen when you want to start or end a TRE or ADF fast. A 5:2 fast is recorded in the week following the fast based on your recorded meals.',
            textStyle: TextStyle(fontSize: TextSizing.small),
            constraints: BoxConstraints(maxWidth: 300),
            triggerMode: TooltipTriggerMode.tap,
            showDuration: Duration(seconds: 10),
            child: SizedBox(width: 50, child: Icon(Icons.question_mark)),
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: session.when(
          data: (session) {
            if (session != null) {
              if (session.fastingForm == FastingForm.adf) {
                return createADF(session);
              } else if (session.fastingForm == FastingForm.tre) {
                return createTRE(session);
              } else {
                return create52(session);
              }
            } else {
              return const CircularProgressIndicator();
            }
          },
          error: (e, _) => Text(e.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        TextButton(
          onPressed: () => {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const FastingHistory()),
            ),
          },
          child: Text(
            'View Fasting History',
            style: TextStyle(fontSize: TextSizing.smallmed),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => GoalsPage(type: GoalType.fasting),
            ),
          ),
          child: Text(
            'Set Goals',
            style: TextStyle(fontSize: TextSizing.smallmed),
          ),
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   // spacing: 30,
        //   children: [
        //     ElevatedButton(
        //       onPressed: () => {
        //         Navigator.of(context).push(
        //           MaterialPageRoute(
        //             builder: (context) => const FastingHistory(),
        //           ),
        //         ),
        //       },
        //       child: Text(
        //         'View Fasting History',
        //         style: TextStyle(fontSize: TextSizing.medium),
        //       ),
        //     ),
        //     ElevatedButton(
        //       onPressed: () => Navigator.of(context).push(
        //         MaterialPageRoute(
        //           builder: (context) => GoalsPage(type: GoalType.fasting),
        //         ),
        //       ),
        //       child: Text(
        //         'Goals/Streaks',
        //         style: TextStyle(fontSize: TextSizing.medium),
        //       ),
        //     ),
        //   ],
        // ),
      ],
      drawer: MyNavigationDrawer(),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: MyExpandableFAB(
        index: 1,
        posi: ExpandableFabPos.right,
      ),
      // floatingActionButton: customWidgets.getFAB(
      //   ref,
      //   context,
      //   1,
      //   posi: ExpandableFabPos.right,
      // ),
    );
  }

  void initDays(UserSessionData session) {
    adfDaysSelected = intsToBools(session.adfDaysSelected, adfDaysSelected);
    fiveTwoDaysSelected = intsToBools(
      session.fiveTwoDaysSelected,
      fiveTwoDaysSelected,
    );
  }

  List<bool> intsToBools(List<int> days, List<bool> list) {
    list.fillRange(0, 6, false);
    for (int day in days) {
      list[day] = true;
    }
    return list;
  }

  List<int> boolsToInts(List<bool> days) => [
    for (int loop = 0; loop < days.length; loop++)
      if (days[loop]) loop,
  ];

  CustomCheckbox getBox(int index, List<bool> curList) {
    return .new(
      isSelected: curList[index],
      dayOfWeek: daysOfWeek[index],
      onTap: (bool val) {
        final tempList = [...fiveTwoDaysSelected];
        tempList[index] = val;
        if (asyncFasting.validate52plan(tempList)) {
          setState(() {
            curList[index] = val;
            asyncFasting.changeDays(false, curList);
          });
        } else {
          planDecision(tempList, false);
        }
      },
    );
  }

  CustomCheckbox getADFBox(int index) => .new(
    isSelected: adfDaysSelected[index],
    dayOfWeek: daysOfWeek[index],
    onTap: (bool val) {
      final tempList = [...adfDaysSelected];
      tempList[index] = val;
      if (asyncFasting.validateADFplan(tempList)) {
        setState(() {
          adfDaysSelected[index] = val;
          asyncFasting.changeDays(true, adfDaysSelected);
        });
      } else {
        planDecision(tempList, true);
      }
    },
  );

  Future<void> planDecision(List<bool> list, bool isADF) async {
    final decision = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(
          child: Text(
            'Invalid Fasting Days Selected',
            style: TextStyle(fontSize: TextSizing.large),
          ),
        ),
        content: Text(
          isADF
              ? 'You should have 3 non-consecutive fasting days selected'
              : 'You should have 2 non-consecutive fasting days selected',
          style: TextStyle(fontSize: TextSizing.medium),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              'Cancel selection',
              style: TextStyle(fontSize: TextSizing.medlarge),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text(
              'Continue with selection',
              style: TextStyle(fontSize: TextSizing.medlarge),
            ),
          ),
        ],
      ),
    );

    if (decision != null && decision) {
      asyncFasting.changeDays(isADF, list);

      if (isADF) {
        setState(() {
          adfDaysSelected = List<bool>.from(list);
        });
      } else {
        setState(() {
          fiveTwoDaysSelected = List<bool>.from(list);
        });
      }
    }
  }

  Column create52(UserSessionData session) => Column(
    children: [
      Padding(padding: const EdgeInsets.all(15), child: chooseFastingPlan(session)),
      const Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          'Select Fasting Days',
          style: TextStyle(fontSize: TextSizing.medium),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (c) => getBox(c, fiveTwoDaysSelected)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(35, 15, 35, 45),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (c) => getBox(c + 4, fiveTwoDaysSelected)),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          'Which days of the week are right for you?',
          style: TextStyle(fontSize: TextSizing.medium),
          textAlign: TextAlign.center,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          'Consider which days of the week you are typically eat less on, and which days you have less opportunity to be socially pressured into eating.',
          style: TextStyle(fontSize: TextSizing.small),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );

  String startText = 'Start', endText = 'End';

  Future<void> selectStartTime(int id) async {
    final time = await Dialogs.showTimeInput(context, initialTime: start);
    if (time != null) {
      final outcome = await ref
          .read(userSessionProvider.notifier)
          .updateTRE(time, end);
      setState(() {
        if (outcome) {
          start = time;
          startText = time.format(context);
        } else {
          //! Pop up to warn user
        }
      });
    }
  }

  Future<void> selectEndTime(int id) async {
    final time = await Dialogs.showTimeInput(context, initialTime: end);
    if (time != null) {
      final outcome = await ref
          .read(userSessionProvider.notifier)
          .updateTRE(start, time);
      setState(() {
        if (outcome) {
          end = time;
          endText = time.format(context);
        } else {
          //! Pop up to warn user
        }
      });
    }
  }

  Future<void> giveWarning(FastingForm form) async {
    late String title, message;
    switch (form) {
      case FastingForm.adf:
        title = 'WARNING: Incompatible ADF Days Selected';
        message = 'Only non-consecutive days can be selected.';
      case FastingForm.tre:
        title = 'WARNING: Incompatible Start and End Times Selected';
        message = 'Reduce your planned fast time.';
      case FastingForm.fiveTwo:
        title = 'WARNING: Incompatible 5:2 Days Selected';
        message = 'Only non-consecutive days can be selected.';
    }

    await Dialogs.dangerDialog(context, title: title, message: message);
  }

  Column createTRE(UserSessionData session) {
    start = TimeOfDay.fromDateTime(session.startTime);
    startText = start.format(context);
    end = TimeOfDay.fromDateTime(session.endTime);
    endText = end.format(context);
    // List<String> headings = ['Starting Time', 'Ending Time'];
    List<ElevatedButton> times = [
      ElevatedButton(
        onPressed: () => selectStartTime(session.userId),
        child: Text(startText, style: TextStyle(fontSize: TextSizing.medium)),
      ),
      ElevatedButton(
        onPressed: () => selectEndTime(session.userId),
        child: Text(endText, style: TextStyle(fontSize: TextSizing.medium)),
      ),
    ];

    return Column(
      children: [
        Padding(padding: EdgeInsets.all(15), child: chooseFastingPlan(session)),
        Padding(
          padding: EdgeInsets.all(15),
          child: const Text(
            'Select Eating Window Times',
            style: TextStyle(fontSize: TextSizing.large),
          ),
        ),
        Table(
          children: [
            const TableRow(children: [
              Center(child: Text('Starting Time', style: TextStyle(fontSize: TextSizing.medium),),),
              Center(child: Text('Ending Time', style: TextStyle(fontSize: TextSizing.medium),),),
            ]),
            // TableRow(
            //   children: headings
            //       .map(
            //         (heading) => Center(
            //           child: Text(
            //             heading,
            //             style: TextStyle(fontSize: TextSizing.medium),
            //           ),
            //         ),
            //       )
            //       .toList(),
            // ),
            TableRow(
              children: [
                const SizedBox(height: 10),
                const SizedBox(height: 10),
              ],
            ),
            TableRow(
              children: times.map((times) => Center(child: times)).toList(),
            ),
          ],
        ),
        const SizedBox(height: 35),
        Padding(
          padding: EdgeInsets.all(15),
          child: const Text(
            'What eating window times are sustainable every day?',
            style: TextStyle(fontSize: TextSizing.medium),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: const Text(
            'Consider when you normally eat throughout the day and plan your TRE times around that. If you regularly eat with others at a certain time, do not resolve to not eat with them, as social pressure to eat is a major barrier for adhereing to intermittent fasting.',
            style: TextStyle(fontSize: TextSizing.small),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Column createADF(UserSessionData session) => Column(
    children: [
      Padding(padding: EdgeInsets.all(15), child: chooseFastingPlan(session)),
      const Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          'Select Fasting Days',
          style: TextStyle(fontSize: TextSizing.medium),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (c) => getADFBox(c)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(35, 15, 35, 45),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(3, (c) => getADFBox(c + 4)),
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          'Which days of the week are right for you?',
          style: TextStyle(fontSize: TextSizing.medium),
          textAlign: TextAlign.center,
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          'Consider which days of the week you are typically eat less on, and days where you have less opportunity to be socially pressured into eating.',
          style: TextStyle(fontSize: TextSizing.small),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );

  List<Padding> getStreakProgress() {
    return [
      Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          'Streak progress text',
          style: TextStyle(fontSize: TextSizing.medium),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(15),
        child: CustomWidgets().streakIndicator(
          'Streak underway',
          0.6,
          Colors.orange,
          Colors.amberAccent,
          context,
        ),
      ),
    ];
  }

  Row chooseFastingPlan(UserSessionData session) {
    return .new(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text('Plan', style: TextStyle(fontSize: TextSizing.large)),
        DropdownMenu<FastingForm>(
          initialSelection: dropDownValuee,
          // side
          // menuStyle: MenuStyle(),
          onSelected: (FastingForm? value) {
            setState(() {
              checkChanging(value, session);
            });
          },
          dropdownMenuEntries: entriess,
          textStyle: TextStyle(fontSize: TextSizing.large),
        ),
      ],
    );
  }

  Future<void> checkChanging(
    FastingForm? value,
    UserSessionData session,
  ) async {
    bool decision = true;

    if (value! != session.fastingForm) {
      decision = await Dialogs.dangerDialog(
        context,
        title: 'Are you sure?',
        message:
            'Changing your fasting form will wipe your current fasting goal and/or streak.',
      );
    }

    if (decision) {
      dropDownValuee = value;
      debugPrint('The user selected: $value');
      AsyncFasting asyncFasting = ref.read(asyncFatingNotifier.notifier);

      asyncFasting.handleChangingForms(
        dropDownValuee,
        start,
        end,
        fiveTwoDaysSelected,
        adfDaysSelected,
      );
    }
  }
}

extension TimeOfDayToDateTime on TimeOfDay {
  DateTime convertToDateTime(DateTime date) {
    return DateTime(date.year, date.month, date.day, hour, minute);
  }
}
