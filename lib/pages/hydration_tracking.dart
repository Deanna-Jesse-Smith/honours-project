import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:testrun/custom_widgets.dart';
import 'package:testrun/database/daos/hydration_dao.dart';
import 'package:testrun/database/tables/user_table.dart';
import 'package:testrun/main.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:testrun/widgets/dialogs.dart';
import 'package:testrun/widgets/main_app_bar.dart';
// import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class HydrationTracking extends ConsumerWidget {
  const HydrationTracking({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(userSessionProvider).value;
    double amount = 0;

    CustomWidgets customWidgets = CustomWidgets();
    return Scaffold(
      appBar: MainAppBar.appBar('Hydration Tracking', session!.userName),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Hydration Motivation',
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
              child: FutureBuilder<double>(future: getTodayHydration(ref, session.userId), builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  debugPrint('No hydr data');
                }
                if (snapshot.hasData) {
                  amount = snapshot.data!;
                }
                return LiquidCircularProgressIndicator(
                value: amount,
                valueColor: AlwaysStoppedAnimation( Colors.pink),
                backgroundColor: Colors.white,
                // borderColor: Colors.red,
                // borderWidth: 5.0,
                direction: Axis.vertical,
                center: Text("Get drinking!"),
                // shapePath: buildBottlePath(const Size(100, 180)),
              );}),
              // child: LiquidCircularProgressIndicator(
              //   value: amount, // Defaults to 0.5.
              //   valueColor: AlwaysStoppedAnimation(
              //     Colors.pink,
              //   ), // Defaults to the current Theme's accentColor.
              //   backgroundColor: Colors
              //       .white, // Defaults to the current Theme's backgroundColor.
              //   borderColor: Colors.red,
              //   borderWidth: 5.0,
              //   direction: Axis.vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
              //   center: Text("Loading..."),
              // ),
            ),
            ElevatedButton(onPressed: () async {
              final newAmount = await Dialogs.getSpinnerWaterInput(context, title: 'How many cups have you drank?');
              if (newAmount != null) ref.read(hDaoProvider).addHydration(session.userId, DateTime.now(), newAmount);
            }, child: Text('Log Hydration'))
          ],
        ),
      ),
      drawer: customWidgets.getDrawer(context),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: customWidgets.getFAB(ref, session, 4),
    );
  }

  Future<double> getTodayHydration(WidgetRef ref, int userID) async {
    // final todays = await getIt<HydrationDao>().getTodayHydration(userState.userID, DateTime.now());
    debugPrint('getTodayHydration');
    final curHydr = await ref.watch(hDaoProvider).getTodayHydration(userID, DateTime.now());

    double sum = 0;

    for (var log in curHydr) {
      sum += log.amount;
    }

    return sum;

    // return todays.fold(0, (sum, log) => sum + log.amount);
  }
}

Path buildBottlePath(Size size) {
  final w = size.width;
  final h = size.height;
  final path = Path();

  final neckWidth = w * 0.35;
  final neckLeft = (w - neckWidth) / 2;
  final neckHeight = h * 0.15;

  path.moveTo(neckLeft, 0);
  path.lineTo(neckLeft + neckWidth, 0);
  path.lineTo(neckLeft + neckWidth, neckHeight);

  // Shoulder curve out to full body width
  path.quadraticBezierTo(
    neckLeft + neckWidth, neckHeight + h * 0.05,
    w, neckHeight + h * 0.12,
  );

  // Body down to base
  path.lineTo(w, h - h * 0.05);
  path.quadraticBezierTo(w, h, w - w * 0.05, h);
  path.lineTo(w * 0.05, h);
  path.quadraticBezierTo(0, h, 0, h - h * 0.05);

  // Body up to shoulder
  path.lineTo(0, neckHeight + h * 0.12);
  path.quadraticBezierTo(
    0, neckHeight + h * 0.05,
    neckLeft, neckHeight,
  );

  path.close();
  return path;
}