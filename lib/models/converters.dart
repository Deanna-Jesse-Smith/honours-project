import 'package:flutter/material.dart';

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

/// A converter class that provides methods to convert between a list of integers representing days of the week and a comma-separated string representation for database storage. The class includes methods to convert from SQL string format to a list of integers and vice versa.
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