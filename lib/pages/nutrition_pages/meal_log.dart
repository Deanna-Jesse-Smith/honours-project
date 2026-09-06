import 'dart:collection';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:testrun/database/daos/nutrition_dao.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/meals_model.dart';
import 'package:testrun/utils/Notifiers/fasting_notifier.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/widgets/dialogs.dart';
import 'package:path/path.dart' as p;

class MealLog extends ConsumerStatefulWidget {
  const MealLog({super.key});

  @override
  ConsumerState<MealLog> createState() => _MealLogState();
}

class _MealLogState extends ConsumerState<MealLog> {
  late NutritionDao nDao;
  // late int mealID;
  // late MealItem curMeal;
  DateTime mealTime = DateTime.now();
  String strMealTime = '';

  static final List<DropdownMenuEntry<MealCategory>> entriess =
      UnmodifiableListView<DropdownMenuEntry<MealCategory>>(
        MealCategory.values.map<DropdownMenuEntry<MealCategory>>(
          (MealCategory cate) =>
              DropdownMenuEntry(value: cate, label: cate.cardName),
        ),
      );
  late MealCategory dropDownValuee;

  final TextEditingController controller = TextEditingController(text: '');
  String imagePath = '';

  @override
  void initState() {
    super.initState();

    dropDownValuee = MealCategory.snack;

    nDao = ref.watch(nDaoProvider);
    // makeMeal();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    strMealTime = TimeOfDay.fromDateTime(mealTime).format(context);
  }

  // void makeMeal() async {
  //   mealID = await nDao.insertMeal(0, DateTime.now(), LogMethod.full);
  //   curMeal = MealItem(mealID, [], mealTime, false, LogMethod.full);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Log a Meal',
          style: TextStyle(
            color: Colors.black,
            fontSize: TextSizing.large,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () => {Navigator.of(context).pop()},
        ),
      ),
      body: Column(
        spacing: 20.0,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'What meal is this?',
                  style: TextStyle(fontSize: TextSizing.medium),
                ),
                DropdownMenu<MealCategory>(
                  initialSelection: dropDownValuee,
                  dropdownMenuEntries: entriess,
                  textStyle: TextStyle(fontSize: TextSizing.medium),
                  onSelected: (MealCategory? value) {
                    setState(() {
                      dropDownValuee = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'What time did you eat?',
                  style: TextStyle(fontSize: TextSizing.medium),
                ),
                ElevatedButton(
                  onPressed: selectMealTime,
                  child: Text(
                    strMealTime,
                    style: TextStyle(fontSize: TextSizing.medium),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Comments on meal (optional):',
                  style: TextStyle(fontSize: TextSizing.medium),
                ),
                TextField(
                  controller: controller,
                  decoration: InputDecoration(hintText: 'e.g. Hawaii pizza'),
                  style: TextStyle(fontSize: TextSizing.medium),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Picture (optional):',
                  style: TextStyle(fontSize: TextSizing.medium),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () => selectImage(ImageSource.gallery),
                      icon: Icon(Icons.image),
                    ),
                    IconButton(
                      onPressed: () => selectImage(ImageSource.camera),
                      icon: Icon(Icons.camera_alt),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (imagePath.isNotEmpty)
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    File(imagePath),
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox.shrink(),
              ],
            ),
          // Table(
          //   defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          //   border: TableBorder.all(width: 10),
          //   children: [
          //     TableRow(
          //       children: [
          //         const Text('What meal is this?', style: TextStyle(fontSize: TextSizing.medium),),
          //         DropdownMenu<MealCategory>(
          //           initialSelection: dropDownValuee,
          //           dropdownMenuEntries: entriess,
          //           textStyle: TextStyle(fontSize: TextSizing.medium),
          //           onSelected: (MealCategory? value) {
          //             setState(() {
          //               dropDownValuee = value!;
          //             });
          //           },
          //         ),
          //       ],
          //     ),
          //     TableRow(children: [
          //       const Text('What time did you eat?', style: TextStyle(fontSize: TextSizing.medium),),
          //       ElevatedButton(onPressed: selectMealTime, child: Text(strMealTime, style: TextStyle(fontSize: TextSizing.medium),))
          //     ]),
          //     TableRow(
          //       children: [
          //         const Text('Comments on meal (optional):', style: TextStyle(fontSize: TextSizing.medium),),
          //         TextField(
          //           controller: controller,
          //           decoration: InputDecoration(hintText: 'e.g. Hawaii pizza'),
          //           style: TextStyle(fontSize: TextSizing.medium),
          //         ),
          //       ],
          //     ),
          //     TableRow(
          //       children: [
          //         const Text('Picture (optional):', style: TextStyle(fontSize: TextSizing.medium),),
          //         Row(
          //           children: [
          //             IconButton(
          //               onPressed: () => selectImage(ImageSource.gallery),
          //               icon: Icon(Icons.image),
          //             ),
          //             IconButton(
          //               onPressed: () => selectImage(ImageSource.camera),
          //               icon: Icon(Icons.camera_alt),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //     if (imagePath.isNotEmpty)
          //       TableRow(
          //         children: [
          //           ClipRRect(
          //             borderRadius: BorderRadius.circular(10),
          //             child: Image.file(
          //               File(imagePath),
          //               width: 120,
          //               height: 120,
          //               fit: BoxFit.cover,
          //             ),
          //           ),
          //           SizedBox.shrink(),
          //         ],
          //       ),
          //   ],
          // ),
          ElevatedButton(
            onPressed: () async {
              final decision = await ref
                  .read(asyncFatingNotifier.notifier)
                  .isInEatingWindow(context);
              if (decision) {
                if (!mounted) return;
                bool decision2 = await Dialogs.dangerDialog(
                  context,
                  title: 'Done everything you need?',
                  message:
                      'You won\'t be able to edit this meal after you leave',
                );
                if (!decision2) {
                  return;
                }
                save();
              }
            },
            child: const Text(
              'Save meal',
              style: TextStyle(fontSize: TextSizing.medium),
            ),
          ),
        ],
      ),
    );
  }

  void save() async {
    await nDao
        .insertFoodLog(
          dropDownValuee,
          imagePath,
          controller.text,
          LogMethod.full,
          mealTime,
        )
        .whenComplete(() => ref.invalidate(checkNutritionGoalProvider));

    if (!mounted) return;
    Navigator.of(context).pop();
  }

  Future<void> selectImage(ImageSource source) async {
    final picture = ImagePicker();
    final XFile? temp = await picture.pickImage(source: source);

    if (temp == null) {
      return;
    }

    final Directory dir = await getApplicationDocumentsDirectory();
    final String fileName =
        '${DateTime.now().millisecondsSinceEpoch}${p.extension(temp.path)}';
    final String newPath = p.join(dir.path, fileName);

    final File image = await File(temp.path).copy(newPath);

    setState(() => imagePath = image.path);
    // imagePath = image.path;
    // final getPicture = await picture.retrieveLostData();
    // if (getPicture.isEmpty) {
    //   return;
    // }
    // final List<XFile>? files = getPicture.files;
    // if (files != null) {

    // }
  }

  Future<void> selectMealTime() async {
    final time = await Dialogs.showTimeInput(context);
    if (time != null) {
      setState(() {
        // mealTime = DateUtils.dateOnly(DateTime.now());
        // mealTime.add(timeOfDayToDuration(time));
        mealTime = mealTime.copyWith(hour: time.hour, minute: time.minute);
        strMealTime = time.format(context);
      });
    }
  }
}
