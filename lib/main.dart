import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/daos/goals_dao.dart';
import 'package:testrun/database/daos/nutrition_dao.dart';
import 'package:testrun/database/daos/reinforcement_dao.dart';
import 'package:testrun/database/daos/reminder_dao.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/database/daos/fasting_dao.dart';
import 'package:testrun/database/daos/hydration_dao.dart';
import 'package:testrun/database/daos/user_dao.dart';
import 'package:testrun/database/daos/weight_dao.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/models/meals_model.dart';
import 'package:testrun/pages/FastingPlan.dart';
import 'package:testrun/pages/goals_pages/reminder_page.dart';
import 'package:testrun/pages/home.dart';
import 'package:testrun/pages/hydration_tracking.dart';
import 'package:testrun/pages/nutrition_pages/meal_tracking.dart';
import 'package:testrun/pages/reminder_page.dart';
import 'package:testrun/pages/start_page.dart';
import 'package:testrun/pages/step_count.dart';
import 'package:testrun/pages/setup_user.dart';
import 'package:testrun/pages/weight_tracking.dart';
import 'package:testrun/utils/Notifiers/concerns_notifier.dart';
import 'package:testrun/utils/Notifiers/goal_notifier.dart';
import 'package:testrun/utils/suggestions.dart';
import 'package:testrun/utils/user_state.dart';
import 'package:timezone/data/latest_all.dart' as tz;

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
final gDaoProvider = Provider<GoalsDao>(
  (ref) => GoalsDao(ref.watch(databaseProvider)),
);
final rDaoProvider = Provider<ReminderDao>(
  (ref) => ReminderDao(ref.watch(databaseProvider)),
);
final cDaoProvider = Provider<ReinforcementDao>(
  (ref) => ReinforcementDao(ref.watch(databaseProvider)),
);
final mealRangeProvider = FutureProvider.family<Map<DateTime, DayMeals>, List<DateTime>>(
  (ref, days) {
    final repo = ref.watch(nDaoProvider);
    return repo.getMealsInRange(days);
  },
);
final foodRangeProvider = FutureProvider.family<Map<DateTime, DayFoods>, List<DateTime>>(
  (ref, days) {
    final repo = ref.watch(nDaoProvider);
    return repo.getFoodInRange(days);
  },
);
final isFastingProvider = StreamProvider<bool>((ref) {
  final dao = ref.watch(fDaoProvider);
  return dao.checkFastingStatus();
});

final checkWeightGoalProvider = FutureProvider<double>((ref) {
  return ref.watch(asyncGoalsProvider.notifier).checkWeightGoal();
});

final checkHydrationGoalProvider = FutureProvider<double>((ref) {
  return ref.watch(asyncGoalsProvider.notifier).checkHydrationGoal();
});

final checkFastingGoalProvider = FutureProvider<double>((ref) {
  return ref.watch(asyncGoalsProvider.notifier).checkFastingGoal();
});

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        Experience.beginner,
        start,
        end,
        '1,3,5',
        '2,4,6',
        1.62,
      );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // insert(ref);
    // ref.read(fDaoProvider).dummyData();
    final session = ref.watch(userSessionProvider);
    ref.read(asyncConcernsProvider);
    tz.initializeTimeZones();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/FastingPlan': (context) => FastingPlan(),
        '/MealTracking': (context) => MealTracking(),
        '/StepCount': (context) => StepCounts(),
        '/SetupUser': (context) => SetupUser(name: 'Deanna', experience: false),
        '/HydrationTracking': (context) => HydrationTracking(),
        '/WeightTracking': (context) => WeightTracking(),
        '/Reminder' : (context) => const ReminderPage(),
      },
      home: session.when(
        data: (data) => data == null ? const StartPage() : HomePage(),
        loading: () => const CircularProgressIndicator(),
        error: (e, st) {
          debugPrint('Error: ${e.toString()}');
          return ErrorPage(e.toString());
        },
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
