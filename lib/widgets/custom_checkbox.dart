// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:testrun/utils/text_sizing.dart';

class CustomCheckbox extends StatelessWidget {
  bool isSelected;
  final String dayOfWeek;
  final void Function()? onTap;

  CustomCheckbox({
    super.key,
    required this.isSelected,
    required this.dayOfWeek,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: () {
        isSelected = !isSelected;
      },
      onSecondaryTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.amber
              : const Color.fromARGB(255, 203, 184, 255),
          borderRadius: BorderRadius.circular(40),
        ),
        child: const Text(
          'M',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: TextSizing.large),
        ),
      ),
    );
  
}
