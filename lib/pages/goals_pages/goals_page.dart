import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/utils/Notifiers/goal_notifier.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/dialogs.dart';

class GoalsPage extends ConsumerStatefulWidget {
  final GoalType type;
  final MetricType mType;
  final double? startWeight;
  const GoalsPage({
    super.key,
    required this.type,
    this.mType = MetricType.hours,
    this.startWeight,
  });

  @override
  ConsumerState<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends ConsumerState<GoalsPage> {
  late GoalType type;
  late String title, description, bestStreak;
  late BasicGoal curGoal;
  final TextEditingController goalController = TextEditingController();
  final focusNode = FocusNode();
  bool isLogOnly = true;

  static final List<DropdownMenuEntry<GoalOperator>> entries =
      UnmodifiableListView<DropdownMenuEntry<GoalOperator>>(
        GoalOperator.values.map<DropdownMenuEntry<GoalOperator>>(
          (GoalOperator op) => DropdownMenuEntry(value: op, label: op.symbol),
        ),
      );
  GoalOperator curGoalOperator = GoalOperator.greaterThan;

  @override
  void initState() {
    super.initState();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        goalController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: goalController.text.length,
        );
      }
    });

    type = widget.type;

    final outcome = ref.read(bestStreakProvider(type));

    bestStreak = outcome.when(data: (streak) {
      if (streak == null) {
        return '\n\nYou have no streaks of this type recorded.';
      }
      return '\n\nYour best streak is $streak days';
    }, error: (e, _) => '', loading: () => '');

    description = switch (type) {
      GoalType.fasting =>
        'A TRE fasting goal is the minimum number of hours you can aim to reach each day of the week.\n\nAn ADF or 5:2 fasting goal is striving to complete the planned number of fasting days per week.\n\nYour fasting streak (incremented or broken on Mondays) is the number of weeks you have managed to reach your fasting goal.',
      GoalType.weight =>
        'Your weight goal is the amount you want to aim for.\nUnlike other goal types, you cannot create a weight streak.',
      GoalType.hydration => 'Your hydration goal is the amount of water you aim to drink in a day.\n\nYour hydration streak is the number of days in a row you have managed to reach your hydration goal.',
      GoalType.nutrition => 'Your nutrition goal is the number of meals.\n\nYour hydration streak is the number of days in a row you have managed to reach your meal goal.',
    };

    description += bestStreak;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          type.forDisplay,
          style: TextStyle(fontSize: TextSizing.large),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () async {
            final decision = await Dialogs.dangerDialog(
              context,
              title: type.forDisplay,
              message:
                  'Leaving without saving will discard any changes you made',
            );
            if (!context.mounted) return;
            if (decision) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      // body: AsyncData(asyncGoals) => SingleChildScrollView(child: Column(children: [],)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            description,
            style: TextStyle(fontSize: TextSizing.medium),
            textAlign: TextAlign.center,
          ),
          goalInfo(),
        ],
      ),
      persistentFooterButtons: [
        Center(
          child: OutlinedButton(
            onPressed: () async {
              await saveChanges();
          
              if (!mounted) {
                return;
              } else if (mounted) {
                Navigator.of(context).pop();
              }
            },
            child: const Text(
              'Save Changes',
              style: TextStyle(fontSize: TextSizing.medium),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> saveChanges() async {
    curGoal.threshold = double.tryParse(goalController.text)!;
    if (curGoal.goalID < 0) {
      await ref.read(asyncGoalsProvider.notifier).insertGoal(curGoal);
    } else {
      await ref.read(asyncGoalsProvider.notifier).changeGoal(curGoal);
    }

    if (curGoal is HydrationGoalModel) {
      ref.invalidate(checkHydrationGoalProvider);
    } else if (curGoal is WeightGoalModel) {
      ref.invalidate(checkWeightGoalProvider);
    } else if (curGoal is FastingGoalModel) {
      ref.invalidate(checkFastingGoalProvider);
    } else if (curGoal is NutritionGoalModel) {
      ref.invalidate(checkNutritionGoalProvider);
    }
  }

  Widget testing() {
    final asyncGoals = ref.watch(asyncGoalsProvider.notifier);

    return switch (asyncGoals.findGoal(type)) {
      Future<BasicGoal?>() => throw UnimplementedError(),
    };
  }

  BasicGoal createDummyGoal() {
    return switch (type) {
      GoalType.fasting => FastingGoalModel(
        -1,
        0,
        0,
        GoalOperator.greaterThan,
        widget.mType,
        DateTime.now(),
        false,
      ),
      GoalType.weight => WeightGoalModel(
        -1,
        0,
        0,
        GoalOperator.lesserEqual,
        MetricType.kg,
        DateTime.now(),
        false,
        startWeight: widget.startWeight!,
      ),
      GoalType.hydration => HydrationGoalModel(
        -1,
        0,
        0,
        GoalOperator.greaterEqual,
        MetricType.litres,
        DateTime.now(),
        false,
      ),
      GoalType.nutrition => NutritionGoalModel(
        -1,
        3,
        0,
        GoalOperator.greaterEqual,
        MetricType.meals,
        DateTime.now(),
        false,
      ),
    };
  }

  FutureBuilder goalInfo() {
    return FutureBuilder(
      future: ref.watch(gDaoProvider).findActiveGoal(type),
      builder: (context, asyncSnapshot) {
        debugPrint('connectionState: ${asyncSnapshot.connectionState}');
        debugPrint('hasData: ${asyncSnapshot.hasData}');
        debugPrint('data: ${asyncSnapshot.data}');
        debugPrint('error: ${asyncSnapshot.error}');
        debugPrint('hasError: ${asyncSnapshot.hasError}');
        debugPrint('FUTURE BUILDER BUILD: ${asyncSnapshot.connectionState}');
        debugPrint('DATA: ${asyncSnapshot.data?.runtimeType}');
        if (asyncSnapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        BasicGoal? goal = asyncSnapshot.data;

        if (goal == null) {
          curGoal = createDummyGoal();
        } else {
          curGoal = goal;
        }

        goalController.text = curGoal.threshold.toString();

        switch (curGoal) {
          case FastingGoalModel model:
            curGoal = model;

            final session = ref.watch(userSessionProvider).value;
            String goalText = '';

            switch (session!.fastingForm) {
              case FastingForm.tre:
                goalText = 'Hours of fasting per day.';
              case FastingForm.fiveTwo:
                goalText = 'Meals per fasting day.';
              case FastingForm.adf:
                goalText = 'Days of fasting a week.';
            }

            return goalCard(TextInputType.numberWithOptions(), goalText);
          case WeightGoalModel model:
            curGoal = model;
            return goalCard(
              TextInputType.numberWithOptions(decimal: true),
              'As my goal',
              suffixText: 'kg',
            );
          case HydrationGoalModel model:
            curGoal = model;
            return goalCard(
              TextInputType.numberWithOptions(decimal: true),
              'litres of water per day',
              suffixText: 'Litres',
            );
          case NutritionGoalModel model:
            curGoal = model;
            return goalCard(
              TextInputType.numberWithOptions(),
              'Meal(s) per day',
            );
          case BasicStreak():
            // TODO: Handle this case.
            throw UnimplementedError();
        }
      },
    );
  }

  Card goalCard(
    TextInputType inputType,
    String goalText, {
    String suffixText = '',
  }) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 40,
        children: [
          Text(type.goalText, style: TextStyle(fontSize: TextSizing.medium)),
          Table(
            children: [
              TableRow(
                children: [
                  Text(
                    'Comparison: ',
                    style: TextStyle(fontSize: TextSizing.medium),
                  ),
                  goalOperatorMenu(),
                ],
              ),
              TableRow(
                children: [
                  Text(
                    'Amount: ',
                    style: TextStyle(fontSize: TextSizing.medium),
                  ),
                  TextField(
                    style: TextStyle(fontSize: TextSizing.medium),
                    controller: goalController,
                    focusNode: focusNode,
                    keyboardType: inputType,
                    decoration: InputDecoration(suffix: Text(suffixText)),
                    // onChanged: (value) => setState(() {
                    //   double? temp = double.tryParse(value);
                    //   if (temp != null) {
                    //     curGoal.threshold = temp;
                    //     goalController.text = temp.toString();
                    //   }
                    // }),
                  ),
                ],
              ),
            ],
          ),
          Text(goalText, style: TextStyle(fontSize: TextSizing.medium)),
        ],
      ),
    );
  }

  DropdownMenu<GoalOperator> goalOperatorMenu() {
    return DropdownMenu<GoalOperator>(
      initialSelection: curGoal.op,
      dropdownMenuEntries: entries,
      onSelected: (GoalOperator? value) {
        setState(() {
          curGoal.op = value!;
        });
      },
      textStyle: TextStyle(fontSize: TextSizing.large),
    );
  }
}
