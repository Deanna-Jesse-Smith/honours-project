import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/main.dart';
import 'package:testrun/utils/user_state.dart';

class FabButton {
  final String title;
  final Color colour;
  final VoidCallback onPressed;

  const FabButton ({
    required this.title,
    required this.colour,
    required this.onPressed,
  });
}

class BuildFAB {
  static List<FabButton> buildFab(WidgetRef ref, {required int index, required VoidCallback onWeightTapped, required VoidCallback onMealTapped, required VoidCallback onHydrationTapped}) {
    debugPrint('mid start FAB');
    final isFasting = ref.watch(isFastingProvider);
    final actions = [
    FabButton(title: isFasting ? 'Break my fast' : 'Start my fast', colour: Colors.deepPurpleAccent, onPressed: () => ref.read(userSessionProvider.notifier).toggleFast()),
    FabButton(title: 'Log Weight', colour: Colors.green, onPressed: onWeightTapped),
    FabButton(title: 'Log Meal', colour: Colors.amber, onPressed: onMealTapped),
    FabButton(title: 'Log Hydration', colour: Colors.blue, onPressed: onHydrationTapped)
  ];
    debugPrint('mid end FAB');
    return [
      ...actions.sublist(index - 1),
      ...actions.sublist(0, index - 1),
    ];
  }
}

class CategoryModel {
  late String text;
  late Color primaryColour;
  late int index;
  bool isFasting = false;

  CategoryModel({required this.index});

  CategoryModel.n({required this.text, required this.primaryColour, this.isFasting = false});

  List<CategoryModel> getFABList() {
    List<CategoryModel> categories = [];

    List<String> titles = [];
    List<Color> colours = [];

    String fastingText;
    if (isFasting) {
        fastingText = 'Break my fast';
      } else {
        fastingText = 'Start my fast';
      }

    switch (index) {
      case 1:
      titles.add(fastingText);
      colours.add(Colors.deepPurpleAccent);

      titles.add('Log Weight');
      colours.add( Colors.green);

      titles.add('Log Meal');
      colours.add( Colors.amber);

      titles.add('Log Hydration');
      colours.add( Colors.blue);
      break;
      case 2:
      titles[0] = 'Log Weight';
      colours[0] = Colors.green;

      titles[1] = fastingText;
      colours[1] = Colors.deepPurpleAccent;

      titles[2] = 'Log Meal';
      colours[2] = Colors.amber;

      titles[3] = 'Log Hydration';
      colours[3] = Colors.blue;
      break;
      case 3:
      titles.add('Log Meal');
      colours.add(Colors.amber);

      titles.add('Log Weight');
      colours.add(Colors.green);

      titles.add(fastingText);
      colours.add(Colors.deepPurpleAccent);

      titles.add('Log Hydration');
      colours.add(Colors.blue);
      break;
      case 4:
      titles.add('Log Hydration');
      colours.add(Colors.blue);

      titles.add('Log Meal');
      colours.add(Colors.amber);

      titles.add('Log Weight');
      colours.add(Colors.green);

      titles.add(fastingText);
      colours.add(Colors.deepPurpleAccent);
      break;
    }

    categories.add(CategoryModel.n(text: titles[0], primaryColour: colours[0]));
    categories.add(CategoryModel.n(text: titles[1], primaryColour: colours[1]));
    categories.add(CategoryModel.n(text: titles[2], primaryColour: colours[2]));
    categories.add(CategoryModel.n(text: titles[3], primaryColour: colours[3]));

    return categories;
  }
}