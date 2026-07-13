import 'dart:ui';

import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:testrun/models/meals_model.dart';

enum FastingForm {tre, fiveTwo, adf}

extension FastingFormExt on FastingForm {
  Color get colour => switch (this) {
    FastingForm.tre => throw UnimplementedError(),
    FastingForm.fiveTwo => throw UnimplementedError(),
    FastingForm.adf => throw UnimplementedError(),
  };

  Icon get icon => switch (this) {
    FastingForm.tre => Icon(Icons.timer),
    FastingForm.fiveTwo => Icon(Icons.date_range),
    FastingForm.adf => Icon(Icons.sync_alt),
  };
}

class FastingFormConverter extends TypeConverter<FastingForm, String> {
  const FastingFormConverter();

  @override
  FastingForm fromSql(String fromDB) {
    return FastingForm.values.firstWhere(
      (f) => f.name == fromDB,
      orElse: () => FastingForm.tre
      );
  }
  
  @override
  String toSql(FastingForm value) => value.name;
}

class LogMethodConverter extends TypeConverter<LogMethod, String> {
  const LogMethodConverter();

  @override
  LogMethod fromSql(String fromDB) {
    return LogMethod.values.firstWhere(
      (f) => f.name == fromDB,
      orElse: () => LogMethod.quick
      );
  }
  
  @override
  String toSql(LogMethod value) => value.name;
}

// ignore: constant_identifier_names
enum DayOfWeek {M, T, W, TH, F, SAT, SUN}

// class DayOfWeekConverter extends TypeConverter<DayOfWeek, String> {
//   const DayOfWeekConverter();

//   @override
//   DayOfWeek fromSql(String fromDB) {
//     List<int> days = fromDB.split(',').map((d) => int.parse(d)).toList();
//     // List<DayOfWeek> formatted = List.empty();

//     // days.forEach((day) => {

//     // });
//     // final m = switch (fromDB) {

//     // }
//     return DayOfWeek.values.firstWhere((f) => f.name == fromDB);
//   }
  
//   @override
//   String toSql(DayOfWeek value) => value.name;
// }

class DayOfWeekConverter {
  const DayOfWeekConverter();

  List<int> fromSQL(String fromDB) {
    List<int> days = fromDB.split(',').map((d) => int.parse(d)).toList();
    return days;
  }

  String toSQL(List<int> days) {
    String selected = days.fold('', (prev, ele) => '$prev,$ele');
    return selected;
  }
}