import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/main.dart';
import 'package:testrun/pages/start_page.dart';
import 'package:testrun/utils/Notifiers/concerns_notifier.dart';
import 'package:testrun/utils/Notifiers/fasting_notifier.dart';
import 'package:testrun/utils/Notifiers/goal_notifier.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/navigation_drawer.dart';

class DebugPage extends ConsumerWidget {
  const DebugPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Debug',
          style: TextStyle(fontSize: TextSizing.large),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
      ),
      drawer: MyNavigationDrawer(),
      persistentFooterAlignment: AlignmentDirectional.bottomCenter,
      persistentFooterButtons: [
        OutlinedButton(
          onPressed: () async {
            try {
              await ref.read(databaseProvider).wipeData();
              ref.invalidate(userSessionProvider);
              ref.invalidate(asyncConcernsProvider);
              ref.invalidate(asyncGoalsProvider);
              ref.invalidate(asyncFatingNotifier);
              if (!context.mounted) return;
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const StartPage()),
                (route) => false,
              );
            } catch (error) {
              if (!context.mounted) return;
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Reset failed: $error')));
            }
          },
          child: const Text(
            'Reset',
            style: TextStyle(fontSize: TextSizing.large),
          ),
        ),
        OutlinedButton(
          onPressed: () async {
            int newID = await ref
                .read(databaseProvider)
                .seedReinforcementUsabilityData();
            await ref
                .read(databaseProvider)
                .seedRelativeTreFasts(userID: newID);
            await ref.read(databaseProvider).seedExampleFastLogs(userID: newID);
            ref.invalidate(userSessionProvider);
            ref.invalidate(asyncConcernsProvider);
            ref.invalidate(asyncGoalsProvider);
            ref.invalidate(asyncFatingNotifier);
          },
          child: const Text(
            'Seed',
            style: TextStyle(fontSize: TextSizing.large),
          ),
        ),
      ],
    );
  }
}
