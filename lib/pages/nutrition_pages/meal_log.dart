import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/custom_widgets.dart';
import 'package:testrun/database/daos/nutrition_dao.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/fasting_model.dart';
import 'package:testrun/models/meals_model.dart';
import 'package:testrun/pages/nutrition_pages/food_search.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/dialogs.dart';
import 'package:testrun/widgets/main_app_bar.dart';

class MealLog extends ConsumerStatefulWidget {
  const MealLog({super.key});

  @override
  ConsumerState<MealLog> createState() => _MealLogState();
}

class _MealLogState extends ConsumerState<MealLog> {
  late NutritionDao nDao;
  late int mealID;
  late MealItem curMeal;
  DateTime mealTime = DateTime.now();
  String strMealTime = '';
  @override
  void initState() {
    super.initState();

    nDao = ref.watch(nDaoProvider);
    makeMeal();
  }

  void makeMeal() async {
    mealID = await nDao.insertMeal(0, DateTime.now(), LogMethod.full);
    curMeal = MealItem(mealID, [], mealTime, false, LogMethod.full);
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(userSessionProvider).value;
    CustomWidgets customWidgets = CustomWidgets();

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
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(children: [Text('Time of Meal: '), ElevatedButton(onPressed: selectMealTime, child: Text(strMealTime))]),
            IconButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FoodSearch(mealID: 0)),
              ),
              icon: Icon(Icons.add),
            ),
            
          ],
        ),
      ),
    );
  }

  Future<void> selectMealTime() async {
    final time = await Dialogs.showTimeInput(context);
    if (time != null) {
      setState(() {
        mealTime = DateUtils.dateOnly(DateTime.now());
        mealTime.add(timeOfDayToDuration(time));
        strMealTime = time.format(context);
      });
    }
  }
}
