import 'package:drift/drift.dart';
import 'package:testrun/database/tables/reinforcement_tables.dart';
import 'package:testrun/models/goals_model.dart';
// import 'package:testrun/main.dart';
import '../database.dart';

part 'reinforcement_dao.g.dart';

@DriftAccessor(tables: [Reinforcements, Achievements])
class ReinforcementDao extends DatabaseAccessor<AppDatabase>
    with _$ReinforcementDaoMixin {
  ReinforcementDao(super.db);

  Future<List<Reinforcement>> getHealthConcerns() {
    final healths = (select(
      reinforcements,
    )..where((r) => r.cType.equals(ConcernType.health.name))).get();
    return healths;
  }

  Future<List<Reinforcement>> getPRConcerns() {
    final prs = (select(
      reinforcements,
    )..where((r) => r.cType.equals(ConcernType.pr.name))).get();
    return prs;
  }

  Future<void> changeEvalDate(int id, DateTime eval) {
    return (update(reinforcements)..where((r) => r.id.equals(id))).write(
      ReinforcementsCompanion(nextEval: Value(eval)),
    );
  }

  Future<void> dummyData() {
    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.health,
        type: Value(GoalType.fasting),
        title: 'Your fasting plan may need adjusting',
        displayContext:
            'You\'ve had difficulty maintaining your fasting schedule recently. Your routine may not fit your current lifestyle as well as it could. Consider adjusting your fasting schedule to something you can maintain more consistently.',
        citation: 'O\'Connor et al. (2022)',
        threshold: 2,
        window: 28,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.pr,
        type: Value(GoalType.fasting),
        title: 'You\'re building a consistent fasting routine',
        displayContext:
            'Your recent fasting history shows that you\'ve been consistently following your plan. Keeping a routine that fits your lifestyle can make it easier to maintain your progress.',
        citation: 'Torres/Salisbury et al. (2022)',
        threshold: 3,
        window: 21,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.pr,
        type: Value(GoalType.fasting),
        title: 'Your current routine is working for you',
        displayContext:
            'You\'ve been consistently following your fasting plan. Keep focusing on maintaining a routine that works for your lifestyle rather than feeling pressured to fast for longer.',
        citation: 'O\'Connor et al. (2022); O\'Neal et al. (2023)',
        threshold: 3,
        window: 28,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.health,
        type: Value(GoalType.hydration),
        title: 'Your hydration goal has been difficult to maintain',
        displayContext:
            'You haven\'t been consistently reaching your daily water goal. Consider whether changing when or how you drink water could make your goal easier to maintain.',
        citation: 'Aguiar et al. (2022)',
        threshold: 3,
        window: 7,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.pr,
        type: Value(GoalType.hydration),
        title: 'You\'re staying consistent with your hydration goal',
        displayContext:
            'You\'ve been regularly meeting your daily water target. Keep the routine going.',
        citation: 'Aguiar et al. (2022)',
        threshold: 5,
        window: 7,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.pr,
        type: Value(GoalType.hydration),
        title: 'Your hydration routine is becoming more consistent',
        displayContext:
            'You\'ve maintained your hydration goal across several days. Keeping the behaviour consistent can help turn it into part of your normal routine.',
        citation: 'Zhu/Wang et al. (2024)',
        threshold: 5,
        window: 14,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.health,
        type: Value(GoalType.nutrition),
        title: 'Your meal goal has been difficult to maintain',
        displayContext:
            'Your recent history shows that you haven\'t consistently reached your meal goal. Consider whether your current goal is realistic for your routine or whether it needs adjusting.',
        citation: 'Payne et al. (2022)',
        threshold: 3,
        window: 28,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.health,
        type: Value(GoalType.nutrition),
        title: 'A simpler approach may work better',
        displayContext:
            'You\'ve struggled to maintain your meal goal recently. Instead of adding more tracking consider whether your goal or logging routine could be simplified.',
        citation: 'Payne et al. (2022)',
        threshold: 3,
        window: 42,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.pr,
        type: Value(GoalType.nutrition),
        title: 'You\'re keeping up with your meal goal',
        displayContext:
            'You\'ve consistently reached your meal goal recently. Your regular tracking gives you useful information about your eating habits and progress.',
        citation: 'Payne et al. (2022)',
        threshold: 1,
        window: 28,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.pr,
        type: Value(GoalType.nutrition),
        title: 'Consistency matters',
        displayContext:
            'You\'ve been consistently keeping track of your meal goal. You don\'t need to record everything in detail for your progress history to be useful.',
        citation: 'Payne et al. (2022)',
        threshold: 0,
        window: 28,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.pr,
        type: Value(GoalType.weight),
        title: 'You\'re keeping track of your progress',
        displayContext:
            'Regularly recording your weight gives you feedback about how your habits are affecting your progress toward your goal.',
        citation: 'Hallock et al. (2024)',
        threshold: 4,
        window: 28,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.pr,
        type: Value(GoalType.fasting),
        title: 'Fast completed',
        displayContext:
            'You completed your planned fast. Take a moment to recognise the progress you\'ve made.',
        citation: 'Torres/Salisbury et al. (2022)',
        threshold: 0,
        window: 0,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.pr,
        type: Value(GoalType.fasting),
        title: 'Fast completed as planned',
        displayContext:
            'You followed your fasting plan as intended. Keeping a routine that works for you is an important part of making fasting sustainable.',
        citation: 'O\'Connor et al. (2022)',
        threshold: 0,
        window: 0,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.pr,
        type: Value(GoalType.fasting),
        title: 'Goal reached',
        displayContext:
            'You reached your fasting goal. Your progress shows what you can achieve when your plan fits your routine.',
        citation: 'Milne-Ives et al. (2023)',
        threshold: 0,
        window: 0,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.pr,
        type: Value(GoalType.hydration),
        title: 'Hydration goal reached',
        displayContext:
            'You reached your water goal today. Keep building on the routine that helped you get there.',
        citation: 'Aguiar et al. (2022)',
        threshold: 0,
        window: 0,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.pr,
        type: Value(GoalType.hydration),
        title: 'Great job staying hydrated',
        displayContext:
            'You\'ve reached your hydration target. Regular feedback like this can help reinforce the behaviours you\'re working on.',
        citation: 'Aguiar et al. (2022)',
        threshold: 0,
        window: 0,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.pr,
        type: Value(GoalType.hydration),
        title: 'Water logged',
        displayContext:
            'You logged your water intake. Keeping track of your behaviour gives you useful feedback on your progress.',
        citation: 'Milne-Ives et al. (2023)',
        threshold: 0,
        window: 0,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.pr,
        type: Value(GoalType.nutrition),
        title: 'Meal goal reached',
        displayContext:
            'You reached your meal goal. Keeping track of your meals gives you useful feedback about your eating habits.',
        citation: 'Payne et al. (2022)',
        threshold: 0,
        window: 0,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.pr,
        type: Value(GoalType.nutrition),
        title: 'Meal logged',
        displayContext:
            'You logged a meal. Keeping track of your eating behaviour can help you stay aware of your progress.',
        citation: 'Payne et al. (2022)',
        threshold: 0,
        window: 0,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.pr,
        type: Value(GoalType.nutrition),
        title: 'Goal reached',
        displayContext:
            'You reached your meal goal for today. Recognising your progress can help reinforce the behaviour.',
        citation: 'Milne-Ives et al. (2023)',
        threshold: 0,
        window: 0,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.pr,
        type: Value(GoalType.weight),
        title: 'Progress recorded',
        displayContext:
            'You\'ve recorded your weight. Keeping track of your progress gives you useful feedback about your journey toward your goal.',
        citation: 'Hallock et al. (2024)',
        threshold: 0,
        window: 0,
      ),
    );

    into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.pr,
        type: Value(GoalType.weight),
        title: 'Progress toward your goal',
        displayContext:
            'Your latest measurement shows you\'re moving toward your weight goal. Use this progress as feedback on how your current routine is working.',
        citation: 'Hallock et al. (2024)',
        threshold: 0,
        window: 0,
      ),
    );

    return into(reinforcements).insert(
      ReinforcementsCompanion.insert(
        cType: ConcernType.pr,
        type: Value(GoalType.weight),
        title: 'Goal reached',
        displayContext:
            'You\'ve reached your weight goal. Take a moment to recognise the progress you\'ve made.',
        citation: 'Hallock et al. (2024)',
        threshold: 0,
        window: 0,
      ),
    );
  }
}
