// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:testrun/database/database.dart';

class Ingredient {
  final int id;
  final String name;
  final double quantity;
  final IngredientType type;

  final double calories, fibre, fat, protein, carbs;

  Ingredient(this.id, this.name, this.quantity, this.type, this.calories, this.fibre, this.fat, this.protein, this.carbs);
}

enum IngredientType {
  food,
  recipe,
}

class MealItem {
  final int id;
  final List<Ingredient>? ingredients;
  final DateTime date;
  final bool isInEatingWindow;
  final LogMethod log;

  MealItem(this.id, this.ingredients, this.date, this.isInEatingWindow, this.log);

  double getTotalCalories() {
    return ingredients == null ? -1 : ingredients!.fold(0, (prev, cur) => prev += cur.calories);
  }

  double getTotalFibre() {
    return ingredients == null ? -1 : ingredients!.fold(0, (prev, cur) => prev += cur.fibre);
  }

  double getTotalFat() {
    return ingredients == null ? -1 : ingredients!.fold(0, (prev, cur) => prev += cur.fat);
  }

  double getTotalProtein() {
    return ingredients == null ? -1 : ingredients!.fold(0, (prev, cur) => prev += cur.protein);
  }

  double getTotalCarbs() {
    return ingredients == null ? -1 : ingredients!.fold(0, (prev, cur) => prev += cur.carbs);
  }
}

enum LogMethod {
  quick,
  full,
  repeat,
  none
}

class DayMeals {
  final List<MealItem> meals;
  final DateTime day;

  DayMeals(this.meals, this.day);

  void updateMeals(MealItem item) => meals.add(item);
}

class DayFoods {
  late List<FoodLogData> foods;
  final DateTime day;

  DayFoods(this.foods, this.day);

  DayFoods.range(FoodLogData food, this.day) {
    foods = [];
    foods.add(food);
  }
}