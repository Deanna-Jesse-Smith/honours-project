import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/daos/nutrition_dao.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/database/daos/fasting_dao.dart';
import 'package:testrun/database/daos/hydration_dao.dart';
import 'package:testrun/database/daos/user_dao.dart';
import 'package:testrun/database/daos/weight_dao.dart';
import 'package:testrun/database/database.dart';
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

final uDaoProvider = Provider<UserDao>(
  (ref) => UserDao(ref.watch(databaseProvider)),
);
final fDaoProvider = Provider<FastingDao>(
  (ref) => FastingDao(ref.watch(databaseProvider)),
);
final hDaoProvider = Provider<HydrationDao>(
  (ref) => HydrationDao(ref.watch(databaseProvider)),
);
final wDaoProvider = Provider<WeightDao>(
  (ref) => WeightDao(ref.watch(databaseProvider)),
);
final nDaoProvider = Provider<NutritionDao>(
  (ref) => NutritionDao(ref.watch(databaseProvider)),
);
final mealRangeProvider = FutureProvider.family<List<MealItem>, List<DateTime>>(
  (ref, days) {
    final repo = ref.watch(nDaoProvider);
    return repo.getMealsInRange(days);
  },
);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('opening');
  runApp(const ProviderScope(child: MyApp()));
}

void insert(WidgetRef ref) {
  DateTime start = DateTime(2026, 1, 1, 12, 30);
  DateTime end = DateTime(2026, 1, 1, 18);

  ref
      .watch(uDaoProvider)
      .addUser(
        'Deanna',
        true,
        FastingForm.tre,
        'Beginner',
        start,
        end,
        '1,3,5',
        '2,4,6',
      );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // insert(ref);
    final session = ref.watch(userSessionProvider);

    debugPrint('building');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
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