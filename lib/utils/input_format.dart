import 'package:flutter/services.dart';

class MyInputFormatter extends TextInputFormatter {
  final double max;
  final double min;

  MyInputFormatter(this.max, this.min);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final value = double.tryParse(newValue.text);

    if (value == null || value > max || value < min) {
      return oldValue;
    }

    return newValue;
  }

}