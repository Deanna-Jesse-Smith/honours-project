import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart';
import 'package:get_it/get_it.dart';
import 'package:testrun/database/daos/nutrition_dao.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/database/daos/fasting_dao.dart';
import 'package:testrun/database/daos/hydration_dao.dart';
import 'package:testrun/database/daos/user_dao.dart';
import 'package:testrun/database/daos/weight_dao.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/models/fasting_model.dart';
import 'package:testrun/models/meals_model.dart';
import 'package:testrun/pages/FastingPlan.dart';
import 'package:testrun/pages/home.dart';
import 'package:testrun/pages/hydration_tracking.dart';
import 'package:testrun/pages/nutrition_pages/meal_tracking.dart';
import 'package:testrun/pages/step_count.dart';
import 'package:testrun/pages/setup_user.dart';
import 'package:testrun/pages/weight_tracking.dart';
import 'package:testrun/utils/user_state.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

final uDaoProvider = Provider<UserDao>((ref) => UserDao(ref.watch(databaseProvider)));
final fDaoProvider = Provider<FastingDao>((ref) => FastingDao(ref.watch(databaseProvider)));
final hDaoProvider = Provider<HydrationDao>((ref) => HydrationDao(ref.watch(databaseProvider)));
final wDaoProvider = Provider<WeightDao>((ref) => WeightDao(ref.watch(databaseProvider)));
final nDaoProvider = Provider<NutritionDao>((ref) => NutritionDao(ref.watch(databaseProvider)));
final mealRangeProvider = FutureProvider.family<List<MealItem>, List<DateTime>>((ref, days) {
  final repo = ref.watch(nDaoProvider);
  return repo.getMealsInRange(days);
});
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('opening');
  runApp(const ProviderScope(child: MyApp()));
}

// final getIt = GetIt.instance;
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   final db = AppDatabase();
//   // insert(db);
//   getIt.registerSingleton<AppDatabase>(db);
//   getIt.registerSingleton<UserDao>(UserDao(db));
//   getIt.registerSingleton<FastingDao>(FastingDao(db));
//   getIt.registerSingleton<HydrationDao>(HydrationDao(db));
//   getIt.registerSingleton<WeightDao>(WeightDao(db));
//   await AppInitializer(
//     uDao: getIt<UserDao>(),
//     fDao: getIt<FastingDao>(),
//     hDao: getIt<HydrationDao>(),
//   ).initialize();
//   runApp(const ProviderScope(child: MyApp()));
// }

  // Future<void> main() async {
  //   WidgetsFlutterBinding.ensureInitialized();

  //   final db = AppDatabase();
  //   final userDao = UserDao(db);
  //   final fastingDao = FastingDao(db);

  //   final initializer = AppInitializer(uDao: userDao, fDao: fastingDao);
  //   await initializer.initialize(); // this must call your findName logic internally

  //   runApp(MyApp(database: db, uDao: userDao, fDao: fastingDao));
  // }

  void insert(WidgetRef ref) {
    DateTime start = DateTime(2026, 1, 1, 12, 30);
    DateTime end = DateTime(2026, 1, 1, 18);

    ref.watch(uDaoProvider).addUser('Deanna', true, FastingForm.tre, 'Beginner', start, end, '1,3,5', '2,4,6');
  }

class MyApp extends ConsumerWidget {
  // final AppDatabase database;
  const MyApp({super.key});

  // const MyApp({
  //   super.key,
  //   required this.database,
  //   required this.uDao,
  //   required this.fDao,
  // });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // insert(ref);
      final session = ref.watch(userSessionProvider);
    // final db = AppDatabase();
    // FastingDao fDao = FastingDao(db);
    // UserDao uDao = UserDao(db);

    // findName(uDao, fDao);
    
    debugPrint('building');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const HomePage(),
      routes: {
        // '/': (context) => HomePage(),
        '/FastingPlan': (context) => FastingPlan(),
        '/MealTracking': (context) => MealTracking(),
        '/StepCount': (context) => StepCounts(),
        '/SetupUser': (context) => SetupUser(),
        '/HydrationTracking': (context) => HydrationTracking(),
        '/WeightTracking': (context) => WeightTracking(),
      },
      home: session.when(
        data: (data) => data == null ? const SetupUser() : HomePage(),
        loading: () => const SetupUser(),
        error: (e, st) => SetupUser(),
        ),
      theme: ThemeData(
        // colorScheme: ColorScheme(brightness: Brightness.light,
        // primary: primary,
        // onPrimary: onPrimary,
        // secondary: secondary,
        // onSecondary: onSecondary,
        // error: error,
        // onError: onError,
        // surface: surface,
        // onSurface: onSurface),
        textTheme: TextTheme(
          displayLarge: const TextStyle(fontSize: 24),
          titleLarge: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          displayMedium: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

// Future<void> findName(UserDao uDao, FastingDao fDao) async {
//   try {
//     final user = await uDao.getUser();

//     if (user != null) {
//       debugPrint("findName: user found - ${user.userID}");
//       debugPrint("findName: typicalEatingStart raw = ${user.typicalEatingStart}",);
//       debugPrint("findName: typicalEatingEnd raw = ${user.typicalEatingEnd}");

//       userState.userName.value = user.name;
//       userState.startTime.value = user.typicalEatingStart!;
//       userState.endTime.value = user.typicalEatingEnd!;

//       debugPrint("findName: past the null checks");

//       FastingFormConverter formConverter = FastingFormConverter();
//       userState.fastingForm.value = formConverter.fromSql(user.formIF);
//       final isFasting = await fDao.isFasting(user.userID);
//       final start = isFasting?.startDateTime;
//       userState.isFasting.value = start == null ? true : false;

//       debugPrint("findName: isFasting = ${userState.isFasting.value}");
//     } else {
//       debugPrint("findName: user is null");
//     }
//   } catch (e, stack) {
//     debugPrint("findName: EXCEPTION - $e");
//     debugPrint(stack.toString());
//   }

  // final user = await uDao.getUser();

  // if (user != null) {
  //     userState.userName.value = user.name;
  //     userState.startTime.value = user.typicalEatingStart!;
  //     print("Reached");
  //     print(user);
  //     print("Reached");
  //     print(user.typicalEatingStart);
  //     userState.endTime.value = user.typicalEatingEnd!;
  //     FastingFormConverter formConverter = FastingFormConverter();
  //     userState.fastingForm.value = formConverter.fromSql(user.formIF);
  //     final isFasting = await fDao.isFasting(user.userID);
  //     final start = isFasting?.startDateTime;
  //     userState.isFasting.value = start == null ? true : false;
  //     print(userState.isFasting.value);
  //     print("Reached");
  // } else {
  //   // TODO Go to Sign Up instead
  // }
// }

// class AppInitializer {
//   final UserDao uDao;
//   final FastingDao fDao;
//   final HydrationDao hDao;

//   AppInitializer({required this.uDao, required this.fDao, required this.hDao});

//   Future<void> initialize() async {
//     try {
//       final user = await uDao.getUser();

//       if (user == null) {
//         return;
//       }

//       debugPrint(user.toString());

//       userState.userID = user.userID;
//       userState.userName.value = user.name;
//       userState.startTime.value = user.typicalEatingStart!;
//       userState.endTime.value = user.typicalEatingEnd!;
//       userState.fastingForm.value = FastingFormConverter().fromSql(user.formIF);
//       userState.adfDaysSelected.value = user.adfDaysSelected;
//       userState.fiveTwoDaysSelected.value = user.fiveTwoDaysSelected;

//       final fast = await fDao.isFasting(user.userID);

//       FastingStatus test = determineFastingStatus(now: DateTime.now(), calculator: TRECalculator(), user: user, activeLog: fast);
//       userState.status.value = test;

//       if (fast == null) {
//         userState.isFasting.value = false;
//       } else {
//         userState.isFasting.value = !fast.endDateTime!.isAtSameMomentAs(fast.startDateTime);
//       }
//     } catch (e, stack) {
//       debugPrint("AppInitializer failed: $e");
//       debugPrint(stack.toString());
//     }
//   }
// }
