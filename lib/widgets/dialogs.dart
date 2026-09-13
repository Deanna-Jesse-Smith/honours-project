import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/models/concerns_model.dart';
import 'package:testrun/models/fasting_model.dart';
import 'package:testrun/models/meals_model.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';

class Dialogs {
  static Future<bool> dangerDialog(
    BuildContext context, {
    required String title,
    required String message,
    String confrim = 'Continue',
    String cancel = 'Cancel',
  }) async {
    final decision = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.warning_amber_sharp,
              color: Colors.orange,
              size: 50,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: TextSizing.medium),
                maxLines: 3,
              ),
            ),
          ],
        ),
        content: Text(
          message,
          style: TextStyle(fontSize: TextSizing.medium),
          maxLines: 6,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(confrim),
          ),
        ],
      ),
    );
    return decision ?? false;
  }

  // static Dialog celebrationDialog(BuildContext context) {
  //   return showDialog(context: context, builder: (context) => dialog);
  // }

  static Future<double?> getNewInput(
    BuildContext context, {
    required String title,
    String unit = '',
    double? initialVal,
  }) async {
    final contorller = TextEditingController(
      text: initialVal?.toString() ?? '',
    );

    final focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        contorller.selection = TextSelection(
          baseOffset: 0,
          extentOffset: contorller.text.length,
        );
      }
    });

    final input = await showDialog<double>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: contorller,
          focusNode: focusNode,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          autofocus: true,
          decoration: InputDecoration(suffixText: unit),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final value = double.tryParse(contorller.text);
              Navigator.pop(context, value);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
    return input;
  }

  static Future<TimeOfDay?> showTimeInput(
    BuildContext context, {
    TimeOfDay? initialTime,
  }) {
    return showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
    );
  }

  static Future<int?> getSpinnerInput(
    BuildContext context, {
    required String title,
    int initialValue = 0,
    int min = 0,
    int max = 100,
  }) async {
    int value = initialValue;
    return showDialog<int>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(title),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: value > min ? () => setState(() => value--) : null,
              ),
              Text('$value', style: const TextStyle(fontSize: 24)),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: value < max ? () => setState(() => value++) : null,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, value),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  static Future<int?> getSpinnerWaterInput(
    BuildContext context, {
    required String title,
    int initialValue = 250,
    int min = 0,
    int max = 1000,
  }) async {
    int value = initialValue;
    return showDialog<int>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: Text(title),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: value > min
                    ? () => setState(() => value -= 250)
                    : null,
              ),
              Text('$value ml', style: const TextStyle(fontSize: TextSizing.large)),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: value < max
                    ? () => setState(() => value += 250)
                    : null,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, value),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  static Future<LogMethod?> getCurLogMethod(
    BuildContext context,
    WidgetRef ref,
    UserSessionData session,
  ) async {
    final method = showDialog<LogMethod>(
      context: context,
      builder: (context) => AlertDialog(
        title: Center(child: Text('How would you like to log your meal?')),
        content: Text(
          'You can:',
          style: TextStyle(fontSize: TextSizing.medium),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // ref.read(nDaoProvider).insertMeal(session.userId, DateTime.now(), LogMethod.quick);
              Navigator.pop(context, LogMethod.quick);
            },
            child: Text(
              'Log that I ate',
              style: TextStyle(fontSize: TextSizing.medium),
              textAlign: TextAlign.left,
            ),
          ),
          // TextButton(
          //   onPressed: () => Navigator.pop(context, LogMethod.repeat),
          //   child: Text(
          //     'Repeat yesterday',
          //     style: TextStyle(fontSize: TextSizing.medium),
          //     textAlign: TextAlign.center,
          //   ),
          // ),
          TextButton(
            onPressed: () => Navigator.pop(context, LogMethod.full),
            child: Text(
              'Log Full Meal',
              style: TextStyle(fontSize: TextSizing.medium),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );

    return method;
  }

  static Future<void> getFastResultHelp(BuildContext context) {
    final temp = showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Your fasting result icons'),
        children: FastResult.values
            .map(
              (r) => Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 7),
                child: Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    r.resultIcon,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Text(
                        r.description,
                        style: TextStyle(fontSize: TextSizing.small),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
    return temp;
  }

  static Future<int?> showConcern(
    BuildContext context,
    BasicConcern concern,
  ) async {
    int? output = -1;
    if (concern is HealthConcern) {
      output = await showDialog<int>(
        context: context,
        builder: (context) => AlertDialog(
          title: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.health_and_safety, color: Colors.red),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  concern.title,
                  style: TextStyle(fontSize: TextSizing.large),
                ),
              ),
            ],
          ),
          content: Column(
            children: [
              Flexible(
                child: Text(
                  concern.text,
                  style: TextStyle(fontSize: TextSizing.medium),
                ),
              ),
              Flexible(
                child: Text(
                  concern.citation,
                  style: TextStyle(
                    fontSize: TextSizing.small,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 1),
              child: Text('Close'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 2),
              child: Text('Dismiss (1 week)'),
            ),
          ],
        ),
      );
    } else {
      output = await showDialog<int>(
        context: context,
        builder: (context) => AlertDialog(
          title: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.info_outline, color: Colors.lightGreenAccent),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  concern.title,
                  style: TextStyle(fontSize: TextSizing.large),
                ),
              ),
            ],
          ),
          content: Column(
            children: [
              Expanded(
                child: Text(
                  concern.text,
                  style: TextStyle(fontSize: TextSizing.medium),
                ),
              ),
              Expanded(
                child: Text(
                  concern.citation,
                  style: TextStyle(
                    fontSize: TextSizing.small,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 1),
              child: Text('Close'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 2),
              child: Text('Dismiss (1 week)'),
            ),
          ],
        ),
      );
    }
    return output;
  }

  static Future<void> goalComplete(
    BuildContext context,
    String title,
    String text,
    ConfettiController controller,
  ) async {
    final output = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.health_and_safety, color: Colors.red),
            const SizedBox(width: 8),
            Expanded(
              child: Text(title, style: TextStyle(fontSize: TextSizing.large)),
            ),
          ],
        ),
        content: Column(
          children: [
            Flexible(
              child: Text(text, style: TextStyle(fontSize: TextSizing.medium)),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Close'),
          ),
        ],
      ),
    );
    return output;
  }
}
