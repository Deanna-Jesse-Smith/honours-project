import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/fasting_model.dart';
import 'package:testrun/models/fasting_schedule.dart';
import 'package:testrun/utils/text_sizing.dart';

class AnimatedCircularPercent extends ConsumerStatefulWidget {
  final FastingProgress progress;
  const AnimatedCircularPercent({super.key, required this.progress});

  @override
  ConsumerState<AnimatedCircularPercent> createState() =>
      _AnimatedCircularPercentState();
}

class _AnimatedCircularPercentState
    extends ConsumerState<AnimatedCircularPercent>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    animation = Tween<double>(
      begin: 0.0,
      end: widget.progress.percentage,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    controller.forward();
  }

  @override
  void didUpdateWidget(covariant AnimatedCircularPercent oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.progress != widget.progress) {
      animation = Tween<double>(
        begin: animation.value,
        end: widget.progress.percentage,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

      controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final checkStatus = ref.watch(checkFastingStatusProvider);
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.all(30),
          child: CircularPercentIndicator(
            radius: 130,
            percent: animation.value,
            lineWidth: 45,
            header: Padding(
              padding: EdgeInsets.only(bottom: 45),
              child: checkStatus.when(
                data: (status) {
                  return Text(
                    status.homeReminder,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: TextSizing.medium),
                  );
                },
                error: (e, _) => Text(e.toString()),
                loading: () => SizedBox.shrink(),
              ),
            ),
            center: Text(
              '${widget.progress.remaining.inHours}h ${widget.progress.remaining.inMinutes % 60}m',
              style: TextStyle(fontSize: TextSizing.medium),
            ),
            progressColor: Colors.lightBlueAccent,
            backgroundColor: Colors.cyan,
            circularStrokeCap: CircularStrokeCap.round,
            animationDuration: 500,
          ),
        );
      },
    );
  }
}
