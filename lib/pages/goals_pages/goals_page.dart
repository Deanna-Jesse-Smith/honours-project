import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/utils/Notifiers/goal_notifier.dart';
import 'package:testrun/utils/input_format.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/dialogs.dart';

class GoalsPage extends ConsumerStatefulWidget {
  final GoalType type;
  final MetricType mType;
  final double startWeight;
  const GoalsPage({
    super.key,
    required this.type,
    this.mType = MetricType.hours,
    this.startWeight = 0,
  });

  @override
  ConsumerState<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends ConsumerState<GoalsPage> {
  late GoalType type;
  late String title, bestStreak;
  String description = '', cardTitle = '', screenTitle = '';
  late BasicGoal curGoal;
  final TextEditingController goalController = TextEditingController();
  final focusNode = FocusNode();
  bool isLogOnly = true;
  double maxAmount = 20000, minAmount = 1;
  late Future<BasicGoal?> futureGoal;

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
    futureGoal = ref.read(gDaoProvider).findActiveGoal(type);

    final outcome = ref.watch(bestStreakProvider(type));

    bestStreak = outcome.when(
      data: (streak) {
        if (streak == null) {
          return '\n\nYou have no streaks of this type recorded.';
        }
        return '\n\nYour best streak is $streak';
      },
      error: (e, _) => '',
      loading: () => '',
    );

    final session = ref.read(userSessionProvider).value;

    // description = switch (type) {
    //   GoalType.fasting =>
    //     session!.fastingForm == FastingForm.fiveTwo
    //         ? 'An ADF or 5:2 fasting goal is striving to complete the planned number of fasting days per week.\n\nYour fasting streak is the number of consecutive weeks in which you have met your fasting goal. Your streak is checked and either continued or broken at the start of each week.'
    //         : 'A TRE fasting goal is the minimum number of hours you aim to fast each day.\n\nYour fasting streak is the number of consecutive weeks in which you have met your fasting goal. Your streak is checked and either continued or broken at the start of each week.',
    //   GoalType.weight =>
    //     'Your weight goal is the weight you are aiming to reach.\nUnlike the other goal types, weight goals do not have a streak.',
    //   GoalType.hydration =>
    //     'Your hydration goal is the amount of water you aim to drink each day.\n\nYour hydration streak is the number of consecutive days in which you have met your hydration goal.',
    //   GoalType.nutrition =>
    //     'Your nutrition goal is the maximum number of calories you aim to consume each day.\n\nYour nutrition streak is the number of consecutive days in which you have met your nutrition goal.',
    // };

    // cardTitle = switch (type) {
    //   GoalType.fasting =>
    //     session!.fastingForm == FastingForm.fiveTwo
    //         ? 'I will eat less than'
    //         : 'I will reach my fasting goal of:',
    //   GoalType.weight => 'I will weigh less than or equal to:',
    //   GoalType.hydration => 'I will drink more than:',
    //   GoalType.nutrition => 'I will reach my daily calorie goal:',
    // };

    switch (type) {
      case GoalType.fasting:
        if (session!.fastingForm == FastingForm.fiveTwo) {
          description =
              'A 5:2 fasting goal is striving to complete the planned number of fasting days per week.';
        } else if (session.fastingForm == FastingForm.tre) {
          description =
              'An ADF fasting goal is striving to complete the planned number of fasting days per week.';
        } else if (session.fastingForm == FastingForm.adf) {
          description =
              'A TRE fasting goal is the minimum number of hours you aim to fast each day.';
        }
        description +=
            '\n\nYour fasting streak is the number of consecutive weeks in which you have met your fasting goal. Your streak is checked and either continued or broken at the start of each week.';
        cardTitle = session.fastingForm == FastingForm.fiveTwo
            ? 'I will eat less than'
            : 'I will reach my fasting goal of:';
        screenTitle = 'Fasting Goals';
      case GoalType.weight:
        description =
            'Your weight goal is the weight you are aiming to reach.\nUnlike the other goal types, weight goals do not have a streak.';
        cardTitle = 'I will weigh less than or equal to:';
        screenTitle = 'Weight Goals';
      case GoalType.hydration:
        description =
            'Your hydration goal is the amount of water you aim to drink each day.\n\nYour hydration streak is the number of consecutive days in which you have met your hydration goal.';
        cardTitle = 'I will drink more than:';
        screenTitle = 'Hydration Goals';
      case GoalType.nutrition:
        description =
            'Your nutrition goal is the maximum number of calories you aim to consume each day.\n\nYour nutrition streak is the number of consecutive days in which you have met your nutrition goal.';
        cardTitle = 'I will reach my daily calorie goal:';
        screenTitle = 'Nutrition Goals';
    }

    if (type != GoalType.weight) description += bestStreak;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle, style: TextStyle(fontSize: TextSizing.large)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () async {
            final decision = await Dialogs.dangerDialog(
              context,
              title: screenTitle,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                description,
                style: TextStyle(fontSize: TextSizing.medium),
                textAlign: TextAlign.center,
              ),
            ),
            goalInfo(),
          ],
        ),
      ),
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      persistentFooterButtons: [
        FilledButton(
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
        widget.startWeight - 1,
        0,
        GoalOperator.lesserEqual,
        MetricType.kg,
        DateTime.now(),
        false,
        startWeight: widget.startWeight,
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
        // session!.isFemale ? 1600 : 1900,
        3000,
        0,
        GoalOperator.lesserEqual,
        MetricType.meals,
        DateTime.now(),
        false,
      ),
    };
  }

  FutureBuilder goalInfo() {
    return FutureBuilder(
      future: futureGoal,
      builder: (context, asyncSnapshot) {
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
        final session = ref.read(userSessionProvider).value;

        switch (curGoal) {
          case FastingGoalModel model:
            curGoal = model;

            String goalText = '', suffixText = '';
            switch (session!.fastingForm) {
              case FastingForm.tre:
                goalText = 'Hours of fasting per day.';
                suffixText = 'Hours';
                maxAmount = 22;
                if (curGoal.goalID == -1) {
                  final session = ref.read(userSessionProvider).value;
                  curGoal.threshold = session!.startTime.difference(session.endTime).inHours.abs() - 1;
                }
              case FastingForm.fiveTwo:
                goalText = 'Calories per fasting day.';
                suffixText = 'Calories';
                maxAmount = 800;
                if (curGoal.goalID == -1) {
                  curGoal.threshold == 700;
                }
              case FastingForm.adf:
                goalText = 'Days of fasting a week.';
                suffixText = 'Days';
                maxAmount = 4;
                if (curGoal.goalID == -1) {
                  final session = ref.read(userSessionProvider).value;
                  curGoal.threshold == session!.adfDaysSelected.length;
                }
            }

            return goalCard(
              TextInputType.numberWithOptions(),
              goalText,
              suffixText: suffixText,
            );
          case WeightGoalModel model:
            curGoal = model;
            return goalCard(
              TextInputType.numberWithOptions(decimal: true),
              'As my goal',
              suffixText: 'kg',
            );
          case HydrationGoalModel model:
            curGoal = model;
            minAmount = 0.5;
            return goalCard(
              TextInputType.numberWithOptions(decimal: true),
              'litres of water per day',
              suffixText: 'Litres',
            );
          case NutritionGoalModel model:
            curGoal = model;
            minAmount = session!.isFemale ? 500 : 600;
            return goalCard(
              TextInputType.numberWithOptions(),
              'calories per day',
              suffixText: 'calories',
            );
          case BasicStreak():
            /// There is no care where this would run, but this is here to satisfy the compiler that all cases are covered.
            throw UnimplementedError();
        }
      },
    );
  }

  /// Creates a card with a text field for the user to input their goal.
  Card goalCard(
    TextInputType inputType,
    String goalText, {
    String suffixText = '',
  }) {
    return Card.outlined(
      margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 20,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: Text(
              cardTitle,
              style: const TextStyle(fontSize: TextSizing.medium),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            // child: SizedBox(width: MediaQuery.of(context).size.width * 0.5, child: TextField(
            child: SizedBox(
              width: 250,
              child: TextField(
                style: TextStyle(fontSize: TextSizing.medium),
                controller: goalController,
                focusNode: focusNode,
                keyboardType: inputType,
                inputFormatters: [MyInputFormatter(maxAmount, minAmount)],
                decoration: InputDecoration(suffixText: suffixText),
                // onChanged: (value) => setState(() {
                //   double? temp = double.tryParse(value);
                //   if (temp != null) {
                //     curGoal.threshold = temp;
                //     goalController.text = temp.toString();
                //   }
                // }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              goalText,
              style: TextStyle(fontSize: TextSizing.medium),
            ),
          ),
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
