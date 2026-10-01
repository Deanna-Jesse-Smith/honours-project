import 'package:testrun/models/fasting_model.dart';

/// Represents the progress of a user's fasting schedule, including the remaining time and the percentage of the fast that has been completed.
class FastingProgress {
  final Duration remaining;
  final double percentage;

  const FastingProgress({required this.remaining, required this.percentage});
}

 /// Calculates the fasting progress for a user based on the current time, the user's fasting form, and the start time of the active fast (if any).
FastingProgress calculateFastingProgress({
  required DateTime now,
  required DummyUser user,
  required DateTime? activeStart,
}) {
  final calculator = calculatorFor(user.form);

  if (activeStart != null) {
    final scheduledFast = findRelevantInterval(now, user);
    if (scheduledFast == null) {
      return const FastingProgress(remaining: Duration.zero, percentage: 0);
    }

    final total = scheduledFast.duration;
    final elapsed = now.difference(activeStart);
    final remaining = scheduledFast.end.difference(now);
    final percentage = total.inSeconds <= 0
        ? 0.0
        : (elapsed.inSeconds / total.inSeconds).clamp(0.0, 1.0);

    return FastingProgress(
      remaining: remaining.isNegative ? Duration.zero : remaining,
      percentage: percentage,
    );
  }

  FastingInterval? nextFast;
  FastingInterval? previousFast;
  var candidate = DateTime(now.year, now.month, now.day).subtract(
    const Duration(days: 2),
  );

  for (var i = 0; i < 7; i++) {
    final interval = calculator.intervalFor(candidate, user);
    if (interval != null) {
      if (interval.end.isBefore(now) || interval.end.isAtSameMomentAs(now)) {
        previousFast = interval;
      } else {
        nextFast ??= interval;
      }
    }
    candidate = candidate.add(const Duration(days: 1));
  }

  if (nextFast == null) {
    return const FastingProgress(remaining: Duration.zero, percentage: 1);
  }

  final eatingStart = previousFast?.end ?? now;
  final eatingDuration = nextFast.start.difference(eatingStart);
  final elapsed = now.difference(eatingStart);
  final remaining = nextFast.start.difference(now);

  return FastingProgress(
    remaining: remaining.isNegative ? Duration.zero : remaining,
    percentage: eatingDuration.inSeconds <= 0
        ? 1.0
        : (elapsed.inSeconds / eatingDuration.inSeconds).clamp(0.0, 1.0),
  );
}
