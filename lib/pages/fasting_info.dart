import 'package:flutter/material.dart';
import 'package:testrun/pages/setup_user.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/widgets/navigation_drawer.dart';

class FastingInformation extends StatelessWidget {
  final bool isForStart;
  final String name;
  final bool hasExperience;
  const FastingInformation({
    super.key,
    this.isForStart = false,
    this.name = '',
    this.hasExperience = false,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('Name: $name exp: $hasExperience');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: !isForStart,
        title: Text(
          'About Intermittent Fasting',
          style: const TextStyle(fontSize: TextSizing.medlarge),
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
      drawer: isForStart ? null : MyNavigationDrawer(),
      body: SingleChildScrollView(child: Column(
        children: [
          buildTextCard(
            'Time Restricted Eating (TRE)',
            'TRE limits eating to a specific period of time each day.\n\nFor example, with a 16:8 schedule, you fast for 16 hours and have an 8-hour eating window each day.',
          ),
          buildTextCard(
            'Alternate Day Fasting (ADF)',
            'ADF alternates between fasting days and non-fasting days.\n\nFor example, you might fast on Monday, eat normally on Tuesday, and continue alternating between fasting and non-fasting days throughout the week.',
          ),
          buildTextCard(
            'Modified Fasting (5:2)',
            '5:2 involves restricting your food intake to 500–700 calories on two days of each week, while eating normally on the other five days.\n\nFor example, you might choose Monday and Thursday as your two fasting days and eat normally on the remaining days.',
          ),
        ],
      ),),
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      persistentFooterButtons: isForStart
          ? [
              FilledButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SetupUser(name: name, experience: hasExperience),
                    ),
                  );
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(fontSize: TextSizing.medium),
                ),
              ),
            ]
          : null,
    );
  }

    Widget buildTextCard(String title, text) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card.outlined(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Text(
              title,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: TextSizing.medium, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10,),
            Text(text, style: const TextStyle(fontSize: TextSizing.medium))],
          ),
        ),
      ),
    );
  }
}
