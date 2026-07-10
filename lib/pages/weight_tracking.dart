import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:testrun/custom_widgets.dart';
import 'package:testrun/database/daos/hydration_dao.dart';
import 'package:testrun/database/daos/weight_dao.dart';
import 'package:testrun/main.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/dialogs.dart';
import 'package:testrun/widgets/main_app_bar.dart';
// import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class WeightTracking extends ConsumerWidget {
  const WeightTracking({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double amount = 0;
    final session = ref.watch(userSessionProvider).value;

    CustomWidgets customWidgets = CustomWidgets();
    return Scaffold(
      appBar: MainAppBar.appBar('Weight Tracking', session!.userName),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Weight Motivation',
              style: TextStyle(fontSize: TextSizing.medium),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: LinearPercentIndicator(
                percent: 0.7,
                lineHeight: 10,
                width: MediaQuery.of(context).size.width - 80,
                animation: true,
                animationDuration: 2000,
                progressColor: Colors.amber,
                backgroundColor: Colors.black,
              ),
            ),
            SizedBox(
              width: 100,
              height: 100,
            ),
            ElevatedButton(onPressed: () async {
              double? curWeight = await ref.read(wDaoProvider).latestWeight(session.userId);
              final newAmount = await Dialogs.getNewInput(context, initialVal: curWeight, title: 'Log Weight');
              if (newAmount != null) ref.read(wDaoProvider).insertWeight(session.userId, newAmount.toDouble(), DateTime.now());
            }, child: Text('Log Weight'))
          ],
        ),
      ),
      drawer: customWidgets.getDrawer(context),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: customWidgets.getFAB(ref, session, 4),
    );
  }

  // Future<double> getLatestWeight() async {
  //   final latest = await getIt<WeightDao>().latestWeight(userState.userID);

  //   return latest ?? 0;
  // }

  // Future<double> getTodayHydration() async {
  //   final todays = await getIt<HydrationDao>().getTodayHydration(userState.userID, DateTime.now());

  //   double sum = 0;

  //   for (var log in todays) {
  //     sum += log.amount;
  //   }

  //   return sum;
  // }
}
