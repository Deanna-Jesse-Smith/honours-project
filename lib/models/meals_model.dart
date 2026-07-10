// ignore_for_file: public_member_api_docs, sort_constructors_first
class Ingredient {
  final int id;
  final String name;
  final double quantity;
  final IngredientType type;

  Ingredient(this.id, this.name, this.quantity, this.type);
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
}

enum LogMethod {
  quick,
  full,
  repeat,
  none
}