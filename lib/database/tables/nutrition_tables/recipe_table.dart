//Recipe PK recipeID recipeName isFavourite

import 'package:drift/drift.dart';

class Recipe extends Table {
  IntColumn get recipeID => integer().autoIncrement()();
  TextColumn get recipeName => text()();
  BoolColumn get isFavourite => boolean().withDefault(const Constant(false))();
}