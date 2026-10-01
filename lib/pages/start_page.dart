import 'package:flutter/material.dart';
import 'package:testrun/pages/fasting_info.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/widgets/dialogs.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  bool hasExperience = false;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: '');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        FilledButton(
          onPressed: () async {
            if (controller.text.isNotEmpty) {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => SetupUser(
              //       name: controller.text,
              //       experience: hasExperience,
              //     ),
              //   ),
              // );

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FastingInformation(
                    isForStart: true,
                    name: controller.text,
                    hasExperience: hasExperience,
                  ),
                ),
              );
            } else {
              await Dialogs.dangerDialog(
                context,
                title: 'WARNING',
                message: 'You need to input your name to proceed',
              );
            }
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(fontSize: TextSizing.medium),
          ),
        ),
      ],
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              const SizedBox(height: 30),
              const Text(
                'Welcome!',
                style: TextStyle(fontSize: TextSizing.large),
              ),
              const Text(
                'To your Intermittent Fasting Support app!',
                style: TextStyle(fontSize: TextSizing.large),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextField(
                  controller: controller,
                  autofocus: true,
                  style: TextStyle(fontSize: TextSizing.medium),
                  textCapitalization: TextCapitalization.sentences,
                  decoration: InputDecoration(hintText: 'Name:'),
                ),
              ),
              const Text(
                'Intermittent fasting is not recommended to individuals who are under the age of 18, pregnant, or have a condition such as diabetes. Consult your doctor about adopting intermittent fasting if you are in any of these categories.',
                style: TextStyle(fontSize: TextSizing.smallmed),
              ),
              const SizedBox(height: 50),
              const Padding(
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Text(
                  'Have you practised intermittent fasting previously?',
                  style: TextStyle(fontSize: TextSizing.medium),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: RadioGroup<bool>(
                  groupValue: hasExperience,
                  onChanged: (bool? value) {
                    setState(() {
                      hasExperience = value!;
                    });
                  },
                  child: const Column(
                    children: [
                      RadioListTile(
                        value: true,
                        title: Text(
                          'Yes',
                          style: TextStyle(fontSize: TextSizing.smallmed),
                        ),
                      ),
                      RadioListTile(
                        value: false,
                        title: Text(
                          'No',
                          style: TextStyle(fontSize: TextSizing.smallmed),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
