import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:testrun/models/fasting_model.dart';
import 'package:testrun/models/meals_model.dart';

enum FastingForm {tre, fiveTwo, adf}

extension FastingFormExt on FastingForm {
  Color get colour => switch (this) {
        FastingForm.tre => Colors.deepPurple,
        FastingForm.adf => Colors.deepOrange,
        FastingForm.fiveTwo => Colors.green,
      };

  Icon get icon => switch (this) {
    FastingForm.tre => Icon(Icons.timer),
    FastingForm.fiveTwo => Icon(Icons.date_range),
    FastingForm.adf => Icon(Icons.sync_alt),
  };

  String get label => switch (this) {
    FastingForm.tre => 'TRE',
    FastingForm.fiveTwo => '5:2/Modified Fasting',
    FastingForm.adf => 'ADF',
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

class FastResultConverter extends TypeConverter<FastResult, String> {
  const FastResultConverter();

  @override
  FastResult fromSql(String fromDb) {
    return FastResult.values.firstWhere((r) => r.name == fromDb,
    orElse: () => FastResult.asPlanned);
  }

  @override
  String toSql(FastResult value) => value.name;
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

class DayOfWeekConverter {
  const DayOfWeekConverter();

  List<int> fromSQL(String fromDB) {
    if (fromDB.trim().isEmpty) return [];
    List<int> days = fromDB.split(',').map((d) => int.parse(d)).toList();
    return days;
  }

  String toSQL(List<int> days) {
    String selected = days.join(',');
    return selected;
  }
}