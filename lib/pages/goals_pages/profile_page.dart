import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/widgets/dialogs.dart';
import 'package:testrun/widgets/navigation_drawer.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  DateTime selectedDate = DateTime(2008);
  final TextEditingController heightController = TextEditingController(
    text: '0',
  );
  final TextEditingController weightController = TextEditingController(
    text: '0',
  );
  final TextEditingController durationController = TextEditingController(
    text: '1',
  );
  TextEditingController nameController = TextEditingController(text: '');

  final focusNodeHeight = FocusNode(), focusNodeWeight = FocusNode(), focusNodeDuration = FocusNode(), focusNodeName = FocusNode();

  bool isSaving = false;

  @override 
  void initState() {
    super.initState();

    focusNodeName.addListener(() {
      if (focusNodeName.hasFocus) {
        nameController.selection = TextSelection(baseOffset: 0, extentOffset: nameController.text.length);
      }
    });


    focusNodeHeight.addListener(() {
      if (focusNodeHeight.hasFocus) {
        heightController.selection = TextSelection(baseOffset: 0, extentOffset: heightController.text.length);
      }
    });

    focusNodeWeight.addListener(() {
      if (focusNodeWeight.hasFocus) {
        weightController.selection = TextSelection(baseOffset: 0, extentOffset: weightController.text.length);
      }
    });

    focusNodeDuration.addListener(() {
      if (focusNodeDuration.hasFocus) {
        durationController.selection = TextSelection(baseOffset: 0, extentOffset: durationController.text.length);
      }
    });
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    durationController.dispose();
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
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: TextField(
                // controller: nameController,
                // autofocus: true,
                style: TextStyle(fontSize: TextSizing.medium),
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(hintText: 'Name:'),
                // focusNode: focusNodeName,
              ),
            ),
          //         const Text(
          //           'When were you born?',
          //           style: TextStyle(fontSize: TextSizing.medium),
          //         ),
          //         ElevatedButton(
          //           onPressed: () async {
          //             final DateTime? dateTime = await showDatePicker(
          //               context: context,
          //               initialDate: selectedDate,
          //               firstDate: DateTime(2000),
          //               lastDate: DateTime(3000),
          //             );
          //             if (dateTime != null) {
          //               setState(() {
          //                 selectedDate = dateTime;
          //               });
          //             }
          //           },
          //           child: const Text('Select Birthday'),
          //         ),
          //       ],
          //     ),
          //   ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     // textBaseline: TextBaseline.alphabetic,
            //     children: [
            //       const Text(
            //         'How tall are you?',
            //         style: TextStyle(fontSize: TextSizing.medium),
            //       ),
            //       SizedBox(
            //         width: 80,
            //         child: TextField(
            //           controller: heightController,
            //           focusNode: focusNodeHeight,
            //           keyboardType: TextInputType.numberWithOptions(
            //             decimal: false,
            //           ),
            //           decoration: InputDecoration(suffixText: 'cm'),
            //           style: TextStyle(fontSize: TextSizing.medium),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       const Text(
            //         'How much do you weigh?',
            //         style: TextStyle(fontSize: TextSizing.medium),
            //       ),
            //       SizedBox(
            //         width: 80,
            //         child: TextField(
            //           controller: weightController,
            //           focusNode: focusNodeWeight,
            //           keyboardType: TextInputType.numberWithOptions(
            //             decimal: true,
            //           ),
            //           decoration: InputDecoration(suffixText: 'kg'),
            //           style: TextStyle(fontSize: TextSizing.medium),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // ElevatedButton(
            //   onPressed: () async {
            //     if (nameController.text.isNotEmpty) {
                  
            //     } else {
            //       await Dialogs.dangerDialog(
            //         context,
            //         title: 'WARNING',
            //         message: 'You need to input your name to proceed',
            //       );
            //     }
            //   },
            //   child: const Text('Sign Up'),
            // ),
        ],
      ),
          )])  
    );
  }
}