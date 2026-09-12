import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/models/meals_model.dart';
import 'package:testrun/utils/text_sizing.dart';

class MealCard extends StatelessWidget {
  final MealItem meal;

  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    if (meal.ingredients != null) {
      return Card.outlined(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text('${meal.cate.name} — ${DateFormat('HH:mm a').format(meal.date)}', style: TextStyle(fontSize: TextSizing.small),),
              const SizedBox(height: 10),
              Wrap(
                spacing: 20,
                runSpacing: 15,
                children: meal.ingredients != null ? meal.ingredients!.map((i) {
                  return Chip(label: Text('${i.quantity} ${i.name}', style: TextStyle(fontSize: TextSizing.small),));
                }).toList() : List.empty(),
              ),
              Text('${meal.getTotalCalories()} calories', style: TextStyle(fontSize: TextSizing.small),),
              Text('${meal.getTotalFibre().toStringAsFixed(2)}g fibre', style: TextStyle(fontSize: TextSizing.small),),
              Text('${meal.getTotalCarbs().toStringAsFixed(2)}g carbs', style: TextStyle(fontSize: TextSizing.small),),
              Text('${meal.getTotalProtein().toStringAsFixed(2)}g protein', style: TextStyle(fontSize: TextSizing.small),),
              Text('${meal.getTotalFat().toStringAsFixed(2)}g fat', style: TextStyle(fontSize: TextSizing.small),),
            ],
          ),
        ),
      );
    } else {
      return Card.outlined(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Text(DateFormat('HH:mm a').format(meal.date)),
        ),
      );
    }
  }
}

class FoodCard extends StatelessWidget {
  final FoodLogData food;
  const FoodCard({super.key, required this.food});
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text(food.category.cardName),
            Text(DateFormat('HH:mm a').format(food.logDate)),
          ],),
          if (food.comment != null) Text(food.comment!),
          if (food.path.isNotEmpty) ClipRRect(borderRadius: BorderRadius.circular(10),
          child: Image.file(File(food.path),
          width: 120,
          height: 120,
          fit: BoxFit.cover)),
        ],
      ),)
    );
  }
}

// class DaySection extends StatelessWidget {
//   final DayFoods dayMeal;
//   const DaySection({super.key, required this.dayMeal});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       spacing: 8,
//       children: [
//         Text(DateFormat('EEE, M/d/y').format(dayMeal.day)),
//         ...dayMeal.foods.map((meal) => FoodCard(food: meal)),
//       ],
//     );
//   }
// }

class DaySection extends StatelessWidget {
  final DayMeals dayMeal;
  const DaySection({super.key, required this.dayMeal});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text('${DateFormat('EEE, M/d/y').format(dayMeal.meals.first.date)} (${dayMeal.getTotalCalories()} calories)', style: TextStyle(fontSize: TextSizing.medium, fontWeight: FontWeight.bold),),
        ...dayMeal.meals.map((meal) => MealCard(meal: meal)),
      ],
    );
  }
}

class FoodRow extends StatelessWidget {
  final FoodData item;
  final double initialVal = 0, maxVal = 10;
  double curVal;
  final ValueChanged<double> increment, decrement;

  FoodRow({super.key, required this.item, required this.increment, required this.decrement, required this.curVal});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(item.name),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => decrement((curVal - 1) >= initialVal ? curVal - 1 : initialVal),
              icon: Icon(Icons.remove_circle_outline),
            ),
            Text(
              '${curVal.toInt()}',
              style: const TextStyle(fontSize: TextSizing.medium),
            ),
            IconButton(
              onPressed: () => increment((curVal + 1) <= maxVal ? curVal + 1 : maxVal),
              icon: Icon(Icons.add_circle_outline),
            ),
          ],
        ),
      ],
    );
  }
}

class IngredientRow extends StatelessWidget {
  final Ingredient item;
  final double initialVal = 0, maxVal = 10;
  double curVal;
  final ValueChanged<double> increment, decrement;

  IngredientRow({super.key, required this.item, required this.increment, required this.decrement, required this.curVal});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${item.name})'),  //? Maybe add serving description later?
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => decrement((curVal - 1) >= initialVal ? curVal - 1 : initialVal),
              icon: Icon(Icons.remove_circle_outline),
            ),
            Text(
              '${curVal.toInt()}',
              style: const TextStyle(fontSize: TextSizing.medium),
            ),
            IconButton(
              onPressed: () => increment((curVal + 1) <= maxVal ? curVal + 1 : maxVal),
              icon: Icon(Icons.add_circle_outline),
            ),
          ],
        ),
      ],
    );
  }
}

