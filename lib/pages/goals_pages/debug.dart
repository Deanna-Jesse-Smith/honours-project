import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/main.dart';
import 'package:testrun/pages/start_page.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/widgets/navigation_drawer.dart';

class DebugPage extends ConsumerWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Debug', style: TextStyle(fontSize: TextSizing.large)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
      ),
      drawer: MyNavigationDrawer(),
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      persistentFooterButtons: [
        OutlinedButton(onPressed: () async {
          await ref.read(databaseProvider).wipeData();
          if (!context.mounted) return;
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => const StartPage()));
        }, child: const Text('Reset', style: TextStyle(fontSize: TextSizing.large),)),
        OutlinedButton(onPressed: () async {
          await ref.read(databaseProvider).seedDatabase();
        }, child: const Text('Seed', style: TextStyle(fontSize: TextSizing.large),))
      ],
    );
  }
}