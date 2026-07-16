import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/main.dart';
import 'package:testrun/utils/text_sizing.dart';

class FinalSetup extends ConsumerWidget {
  const FinalSetup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(children: [
        Text('Temporary heading', style: TextStyle(fontSize: TextSizing.large),),
        
      ],)
    );
  }
}