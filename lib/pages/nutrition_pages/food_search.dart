import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/database/tables/nutrition_tables/food_table.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/meals_model.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/dialogs.dart';

class FoodSearch extends ConsumerStatefulWidget {
  final int mealID;
  const FoodSearch({super.key, required this.mealID});

  @override
  ConsumerState<FoodSearch> createState() => _FoodSearchState();
}

class _FoodSearchState extends ConsumerState<FoodSearch> {
  // final foodSearchProvider = FutureProvider.family<List<Food>, String>((ref, query) {
  //   // final repo = ref.watch(listenable)
  // });
  final TextEditingController controller = TextEditingController();
  String curFood = '';
  late Future<List<FoodData>> foods;
  double initialVal = 0, maxVal = 10;
  Map<int, double> selectedFoods = {};
    Map<int, double> selectedRecipes = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search Food',
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
          onTap: () async {
            if (selectedFoods.isEmpty) Navigator.of(context).pop();

            bool choice = await Dialogs.dangerDialog(context, title: 'Are you sure?', message: 'If you leave now, all your selections will be discarded');

            if (choice) Navigator.of(context).pop();

            },
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              TextField(
                controller: controller,
                autofocus: true,
                decoration: InputDecoration(hintText: 'e.g. rice'),
              ),
              IconButton(onPressed: changeFood, icon: Icon(Icons.search)),
            ],
          ),
          SizedBox(height: 30),
          FutureBuilder(
            future: foods,
            builder: (context, asyncSnapshot) {
              if (asyncSnapshot.connectionState == ConnectionState.waiting)
                return CircularProgressIndicator();
              if (!asyncSnapshot.hasData) {
                return const Text('Sorry, nothing matches your search');
              }
              final searchResults = asyncSnapshot.data;
              if (searchResults!.isEmpty)
                return const Text('Sorry, nothing matches your search');

              return ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Text(searchResults[index].name);
                },
              );
            },
          ),
        ],
      ),
      persistentFooterButtons: [
        ElevatedButton(onPressed: () {
          final session = ref.watch(userSessionProvider).value;
          DateTime today = DateTime.now();

          selectedFoods.forEach((key, value) {
            ref.read(nDaoProvider).addMealFoodContent(session!.userId, widget.mealID, key, value, today, LogMethod.full);
          });

          Navigator.of(context).pop();
        }, child: const Text('Save', style: TextStyle(fontSize: TextSizing.medium),))
      ],
    );
  }

  void changeFood() {
    setState(() {
      curFood = controller.text;
      //TODO Provider/Stream getting code here
      foods = ref.read(nDaoProvider).getFoodForSearch(curFood);
    });
  }

  Row displayFood(FoodData item) {
    late double val;
    if (selectedFoods.containsKey(item.foodID)) {
      val = selectedFoods[item.foodID]!;
    } else {
      val = initialVal;
    }
    return .new(
      children: [
        Text('${item.name} (${item.servingDescription})'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: val > initialVal
                  ? () => setState(() {
                      val--;

                      if (val == 0) selectedFoods.remove(item.foodID);

                      selectedFoods.update(item.foodID, (cur) => val);
                    })
                  : null,
              icon: Icon(Icons.remove_circle_outline),
            ),
            Text(
              '${val.toInt()}',
              style: const TextStyle(fontSize: TextSizing.medium),
            ),
            IconButton(
              onPressed: val < maxVal
                  ? () => setState(() {
                      val++;

                      selectedFoods.update(
                        item.foodID,
                        (cur) => val,
                        ifAbsent: () => val,
                      );
                    })
                  : null,
              icon: Icon(Icons.add_circle_outline),
            ),
          ],
        ),
      ],
    );
  }
}
