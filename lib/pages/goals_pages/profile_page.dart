import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/navigation_drawer.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  DateTime selectedDate = DateTime(2008);
  bool isFemale = false;
  final TextEditingController heightController = TextEditingController(
    text: '0',
  );
  final TextEditingController weightController = TextEditingController(
    text: '0',
  );
  final TextEditingController nameController = TextEditingController();

  final focusNodeHeight = FocusNode(),
      focusNodeWeight = FocusNode(),
      focusNodeName = FocusNode();

  bool isSaving = false;

  @override
  void initState() {
    super.initState();

    final session = ref.read(userSessionProvider).value;
    // selectedDate = session.

    isFemale = session!.isFemale;

    // nameController.text = session.userName;
    nameController.text = session.userName;
    focusNodeName.addListener(() {
      if (focusNodeName.hasFocus) {
        nameController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: nameController.text.length,
        );
      }
    });

    heightController.text = session.height.toString();
    focusNodeHeight.addListener(() {
      if (focusNodeHeight.hasFocus) {
        heightController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: heightController.text.length,
        );
      }
    });

    focusNodeWeight.addListener(() {
      if (focusNodeWeight.hasFocus) {
        weightController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: weightController.text.length,
        );
      }
    });
  }

  @override
  void dispose() {
    focusNodeHeight.dispose();
    focusNodeName.dispose();

    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(fontSize: TextSizing.large)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
      ),
      drawer: MyNavigationDrawer(),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: [
        FilledButton(
          onPressed: handleFinished,
          child: Text(
            'Save Changes',
            style: TextStyle(fontSize: TextSizing.medium),
          ),
        ),
      ],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              children: [
                TableRow(
                  children: [
                    cell(
                      const Text(
                        'Name',
                        style: TextStyle(fontSize: TextSizing.medium),
                      ),
                    ),
                    cell(
                      TextField(
                        controller: nameController,
                        // autofocus: true,
                        style: TextStyle(fontSize: TextSizing.medium),
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration(hintText: 'Name:'),
                        // focusNode: focusNodeName,
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    cell(
                      const Text(
                        'Are you male or female?',
                        style: TextStyle(fontSize: TextSizing.medium),
                      ),
                    ),
                    cell(
                      RadioGroup<bool>(
                        onChanged: (bool? value) {
                          setState(() => isFemale = value!);
                        },
                        groupValue: isFemale,
                        child: const Column(
                          children: [
                            RadioListTile(
                              value: true,
                              title: Text(
                                'Female',
                                style: TextStyle(fontSize: TextSizing.medium),
                              ),
                            ),
                            RadioListTile(
                              value: false,
                              title: Text(
                                'Male',
                                style: TextStyle(fontSize: TextSizing.medium),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // TableRow(
                //   children: [
                //     cell(
                //       const Text(
                //         'When were you born?',
                //         style: TextStyle(fontSize: TextSizing.medium),
                //       ),
                //     ),
                //     cell(
                //       ElevatedButton(
                //         onPressed: () async {
                //           final DateTime? dateTime = await showDatePicker(
                //             context: context,
                //             initialDate: selectedDate,
                //             firstDate: DateTime(2000),
                //             lastDate: DateTime(3000),
                //           );
                //           if (dateTime != null) {
                //             setState(() {
                //               selectedDate = dateTime;
                //             });
                //           }
                //         },
                //         child: const Text(
                //           'Select Birthday',
                //           style: TextStyle(fontSize: TextSizing.medium),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                TableRow(
                  children: [
                    cell(
                      const Text(
                        'How tall are you?',
                        style: TextStyle(fontSize: TextSizing.medium),
                      ),
                    ),
                    cell(
                      TextField(
                        controller: heightController,
                        focusNode: focusNodeHeight,
                        keyboardType: TextInputType.numberWithOptions(
                          decimal: false,
                        ),
                        decoration: InputDecoration(suffixText: 'cm'),
                        style: TextStyle(fontSize: TextSizing.medium),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> handleFinished() async {
    setState(() => isSaving = true);
    if (heightController.text.isEmpty || weightController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'You need to fill in your height, weight and name to proceed',
          ),
        ),
      );
    } else {
      try {
        if (!mounted) return;
        ref
            .read(userSessionProvider.notifier)
            .updateDetails(
              nameController.text,
              double.parse(heightController.text),
              selectedDate,
            );
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Could not save user: $e')));
      } finally {
        if (mounted) setState(() => isSaving = false);
      }
    }
  }

  Padding cell(Widget child) {
    return Padding(padding: const EdgeInsets.only(bottom: 15), child: child);
  }
}
