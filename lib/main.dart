import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testrun/database/daos/goals_dao.dart';
import 'package:testrun/database/daos/nutrition_dao.dart';
import 'package:testrun/database/daos/reinforcement_dao.dart';
import 'package:testrun/database/daos/reminder_dao.dart';
import 'package:testrun/database/daos/steps_dao.dart';
import 'package:testrun/models/converters.dart';
import 'package:testrun/database/daos/fasting_dao.dart';
import 'package:testrun/database/daos/hydration_dao.dart';
import 'package:testrun/database/daos/user_dao.dart';
import 'package:testrun/database/daos/weight_dao.dart';
import 'package:testrun/database/database.dart';
import 'package:testrun/models/fasting_model.dart';
import 'package:testrun/models/fasting_schedule.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/models/meals_model.dart';
import 'package:testrun/models/reminder_model.dart';
import 'package:testrun/pages/FastingPlan.dart';
import 'package:testrun/pages/fasting_info.dart';
import 'package:testrun/pages/goals_pages/profile_page.dart';
import 'package:testrun/pages/goals_pages/error_page.dart';
import 'package:testrun/pages/home.dart';
import 'package:testrun/pages/hydration_tracking.dart';
import 'package:testrun/pages/loading.dart';
import 'package:testrun/pages/nutrition_pages/meal_tracking.dart';
import 'package:testrun/pages/reminder_page.dart';
import 'package:testrun/pages/start_page.dart';
import 'package:testrun/pages/step_count.dart';
import 'package:testrun/pages/setup_user.dart';
import 'package:testrun/pages/weight_tracking.dart';
import 'package:testrun/utils/Notifiers/concerns_notifier.dart';
import 'package:testrun/utils/Notifiers/fasting_notifier.dart';
import 'package:testrun/utils/Notifiers/goal_notifier.dart';
import 'package:testrun/utils/suggestions.dart';
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
final gDaoProvider = Provider<GoalsDao>(
  (ref) => GoalsDao(ref.watch(databaseProvider)),
);
final rDaoProvider = Provider<ReminderDao>(
  (ref) => ReminderDao(ref.watch(databaseProvider)),
);
final cDaoProvider = Provider<ReinforcementDao>(
  (ref) => ReinforcementDao(ref.watch(databaseProvider)),
);
final sDaoProvider = Provider<StepsDao>(
  (ref) => StepsDao(ref.watch(databaseProvider)),
);
final mealRangeProvider = FutureProvider.autoDispose.family<List<DayMeals>, (DateTime, DateTime)>(
  (ref, days) {
    final repo = ref.watch(nDaoProvider);
    return repo.getMealsInRange(days.$1, days.$2);
  },
);
final foodRangeProvider = FutureProvider.autoDispose.family<Map<DateTime, DayFoods>, List<DateTime>>(
  (ref, days) {
    final repo = ref.watch(nDaoProvider);
    return repo.getFoodInRange(days);
  },
);
final isFastingProvider = StreamProvider<bool>((ref) {
  final dao = ref.watch(fDaoProvider);
  return dao.checkFastingStatus();
});

final checkWeightGoalProvider = FutureProvider.autoDispose<(double, double, double)>((ref) {
  return ref.watch(asyncGoalsProvider.notifier).checkWeightGoal();
});

final checkHydrationGoalProvider = FutureProvider.autoDispose<(double, double, double)>((ref) {
  return ref.watch(asyncGoalsProvider.notifier).checkHydrationGoalProgress();
});

final checkHydrationStreakProvider = StreamProvider.autoDispose<int?>((ref) {
  return ref.watch(gDaoProvider).getActiveHydrationStreak();
});

final checkFastingGoalProvider = FutureProvider<(double, int, int)>((ref) {
  return ref.watch(asyncGoalsProvider.notifier).checkFastingGoalProgress();
});

final checkFastingStatusProvider = FutureProvider.autoDispose<FastingStatus>((ref) {
  return ref.watch(asyncFatingNotifier.notifier).refreshFastingStatus();
});

final checkFastingStreakProvider = StreamProvider<int?>((ref) {
  return ref.watch(gDaoProvider).getActiveFastingStreak();
});

final checkNutritionGoalProvider = FutureProvider.autoDispose<(double, double)>((ref) {
  return ref.watch(asyncGoalsProvider.notifier).checkNutritionGoalPercent();
});

final checkNutritionStreakProvider = StreamProvider<int?>((ref) {
  return ref.watch(gDaoProvider).getActiveFoodStreak();
});

final checkFastingProgressProvider = FutureProvider.autoDispose<FastingProgress>((ref) {
  return ref.watch(asyncFatingNotifier.notifier).refreshProgress();
});

final bestStreakProvider = FutureProvider.autoDispose.family<int?, GoalType>(
  (ref, type) async {
    return await ref.read(gDaoProvider).findBestStreak(type);
  },
);

final fastsInRangProvider = StreamProvider.autoDispose.family<List<FastLogData>, (DateTime, DateTime)>(
  (ref, dates) {
    return ref
        .watch(fDaoProvider)
        .findFastsInRange(dates.$1, dates.$2);
  },
);

final watchHydrationProvider = StreamProvider.autoDispose.family<double, DateTime>(
  (ref, day) {
    final repo = ref.watch(hDaoProvider);
    return repo.watchTodayHydration(day);
  },
);

final watchHydrationGraphProvider = StreamProvider.autoDispose.family<List<(DateTime, double)>, DateTime>(
  (ref, day) {
    final repo = ref.watch(hDaoProvider);
    return repo.getAllHydrationLogs(day);
  },
);

final watchWeightGraphProvider = StreamProvider.autoDispose.family<List<(DateTime, double)>, DateTime>(
  (ref, day) {
    final repo = ref.watch(wDaoProvider);
    return repo.getAllWeightLogs(day);
  },
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationSystem.initialize();
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
        true,
      );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(userSessionProvider);
    ref.read(asyncConcernsProvider);
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
        '/Profile' : (context) => ProfilePage(),
        '/FastingInfo' : (context) => const FastingInformation(),
      },
      home: session.when(
        data: (data) => data == null ? const StartPage() : HomePage(),
        loading: () => const LoadingPage(),
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
