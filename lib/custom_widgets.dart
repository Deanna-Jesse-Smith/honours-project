import 'package:flutter/material.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator_circle/percent_indicator_circle.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/converters.dart';
// import 'package:testrun/de/converters.dart';
import 'package:testrun/database/daos/fasting_dao.dart';
import 'package:testrun/database/daos/user_dao.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/models/category_model.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:testrun/utils/text_sizing.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:wheel_picker/wheel_picker.dart';

class CustomWidgets {
  late String userName;

  late BuildFAB fabBuilder;

  late UserDao uDao;

  late FastingDao fDao;

  // String getUserName() {

  // }

  //   void insert() {
  //     UserDao uDao = UserDao(db);

  //     DateTime start = DateTime(2026, 1, 1, 12, 30);
  //     DateTime end = DateTime(2026, 1, 1, 18);

  //     uDao.addUser('Deanna', true, FastingForm.adf, 'Beginner', start, end);
  //   }

  //  // #region old
  //   Future<String> findUser() async {
  //     final curUser = await db.select(db.users).get();

  //     User thisUser = curUser.last;

  //     print(thisUser);

  //     return thisUser.name;
  //   }

  // Future<String> insertRow() async {
  //   final allUsers = await db.select(db.users).get();

  // //  FlutterLogs.logInfo("Value", "Name", oneUser.name);

  //  UserDao uDao = UserDao(db);
  // //  uDao.addUser('temp', true, FastingForm.tre, 'Intermediate');

  //     User oneUser = allUsers.last;
  // //  print(oneUser);
  // //  uDao.changeIsFasting(oneUser.userID, false);
  // // //  await uDao.updateTREtimes(oneUser.userID, test1(), test2());

  //  final updatedUser = await (db.select(db.users)..where((u) => u.userID.equals(oneUser.userID))).getSingle();
  // //      bool testing = updatedUser.typicalEatingStart == null;
  // //   print('This is printing: $testing');

  // //   print(updatedUser.typicalEatingEnd?.hour);

  //   // return name;

  //  return updatedUser.name;

  // }

  // Future<void> testTimes() async {
  //   final allUsers = await db.select(db.users).get();

  //   User oneUser = allUsers.last;
  //   print(oneUser);

  //   bool testing = oneUser.typicalEatingStart == null;
  //   print('This is printing: $testing');

  //   print(oneUser.typicalEatingEnd?.hour);
  // }

  // DateTime test1() {
  //   return DateTime(2026, 1, 1, 12, 30);
  // }

  //  DateTime test2() {
  //   return DateTime(2026, 0, 0, 18);
  // }
  // #endregion

  PercentCircleIndicator circleIndicator(
    double percent,
    progress,
    Color backgroundColor,
  ) {
    return PercentCircleIndicator(
      radius: 100,
      percent: percent,
      strokeWidth: 40,
      progress: progress,
      backgroundColor: backgroundColor,
      textStyle: TextStyle(fontSize: TextSizing.large, color: Colors.white),
    );
  }

  CircularPercentIndicator circularIndicator(
    double percent,
    Color backgroundColor,
    progress,
  ) {
    return CircularPercentIndicator(
      radius: 100,
      percent: percent,
      lineWidth: 40,
      header: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: const Text(
          "You're only an hour away from the end",
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: TextSizing.small),
        ),
      ),
      progressColor: progress,
      backgroundColor: backgroundColor,
      circularStrokeCap: CircularStrokeCap.round,
      animationDuration: 500,
    );
  }

  LinearPercentIndicator streakIndicator(
    String text,
    double percent,
    Color backgroundColor,
    progress,
    BuildContext context,
  ) {
    return LinearPercentIndicator(
      percent: percent,
      width: MediaQuery.of(context).size.width - 80,
      lineHeight: 12,
      progressColor: progress,
      backgroundColor: backgroundColor,
      barRadius: Radius.circular(10),
    );
  }

  // AppBar appBar(String title) {
  // initializeObjects();
  //   return AppBar(
  //     title: FutureBuilder<String>(future: findUser(), builder:(context, snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return Text('Welcome back', style: TextStyle(
  //         color: Colors.black,
  //         fontSize: TextSizing.large,
  //         fontWeight: FontWeight.bold,
  //       ));
  //         }
  //         if (snapshot.hasError) {
  //           return Text('Error', style: TextStyle(
  //         color: Colors.black,
  //         fontSize: TextSizing.large,
  //         fontWeight: FontWeight.bold,
  //       ));
  //         }
  //         return Text('Welcome back, ${snapshot.data}', style: TextStyle(
  //         color: Colors.black,
  //         fontSize: TextSizing.large,
  //         fontWeight: FontWeight.bold,
  //       ));
  //       },),
  //     // title: Text(title, style: TextStyle(fontSize: TextSizing.large),),
  //     backgroundColor: Colors.white,
  //     elevation: 0.0,
  //     centerTitle: true,
  //     // leading: GestureDetector(
  //     //   onTap: () {},
  //     //   child: Container(
  //     //     margin: EdgeInsets.all(5),
  //     //     alignment: Alignment.center,
  //     //     decoration: BoxDecoration(
  //     //       color: Colors.blueAccent,
  //     //       borderRadius: BorderRadius.circular(20),
  //     //     ),
  //     //     child: Icon(Icons.menu),
  //     //     // child: SvgPicture.asset('assets/icons/hamburger-menu.svg'),
  //     //     // child: SvgPicture.asset('assets/icons/LefArrow.svg'),
  //     //   ),
  //     // ),
  //   );
  // }

  Container encouragementContainer(String streakInfo) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          LinearProgressIndicator(),
          Text(streakInfo, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Drawer getDrawer(BuildContext context) {
    // insert();
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            title: const Text('Fasting Plan'),
            onTap: () {
              Navigator.pushNamed(context, '/FastingPlan');
            },
          ),
          ListTile(
            title: const Text('Track Meals'),
            onTap: () {
              Navigator.pushNamed(context, '/MealTracking');
            },
          ),
          ListTile(
            title: const Text('Step Tracking'),
            onTap: () {
              Navigator.pushNamed(context, '/StepCount');
            },
          ),
          ListTile(
            title: const Text('Hydration Tracking'),
            onTap: () {
              Navigator.pushNamed(context, '/HydrationTracking');
            },
          ),
          ListTile(
            title: const Text('Weight Tracking'),
            onTap: () {
              Navigator.pushNamed(context, '/WeightTracking');
            },
          ),
          ListTile(
            title: const Text('Setup'),
            onTap: () {
              Navigator.pushNamed(context, '/SetupUser');
            },
          ),
        ],
      ),
    );
  }

  ExpandableFab getFAB(
    WidgetRef ref,
    UserSessionData session,
    int index, {
    ExpandableFabPos posi = ExpandableFabPos.center,
  }) {
    // CategoryModel model = CategoryModel(index: index);

    final actions = BuildFAB.buildFab(
      session,
      index: index,
      onFastTapped: () {
        if (session.isFasting) {
          ref.read(fDaoProvider).breakFast(session.userId, DateTime.now());
        } else {
          ref.read(fDaoProvider).startFast(session.userId, session.fastingForm, DateTime.now());
        }
      },
      onHydrationTapped: () {},
      onMealTapped: () {},
      onWeightTapped: () {},
    );

    return ExpandableFab(
      type: ExpandableFabType.up,
      pos: posi,
      overlayStyle: ExpandableFabOverlayStyle(blur: 20),
      margin: const EdgeInsets.all(10),
      children: actions.reversed
          .map(
            (button) => ElevatedButton(
              onPressed: button.onPressed,
              child: Text(button.title),
            ),
          )
          .toList(),
    );

    // return ExpandableFab(
    //   type: ExpandableFabType.up,
    //   pos: posi,
    //   overlayStyle: ExpandableFabOverlayStyle(blur: 20),
    //   margin: const EdgeInsets.all(10),
    //   children: actions.reversed.map((buttons) {
    //     return ElevatedButton(
    //       onPressed: () {
    //         switch (buttons.title) {
    //           case 'Break my fast':
    //           // fDao.breakFast(userState.userID, DateTime.now());
    //           BuildFAB.isFasting = false;
    //           case 'Start my fast':
    //           BuildFAB.isFasting = true;
    //           case 'Log Weight':

    //           case 'Log Meal':
    //           break;
    //           case 'Log Hydration':
    //           break;
    //         }
    //       },
    //       style: ElevatedButton.styleFrom(
    //         foregroundColor: Colors.black,
    //         backgroundColor: buttons.colour,
    //         textStyle: const TextStyle(fontSize: TextSizing.small),
    //       ),
    //       child: Text(buttons.title),
    //     );
    //   }).toList(),
    // );
  }
}
