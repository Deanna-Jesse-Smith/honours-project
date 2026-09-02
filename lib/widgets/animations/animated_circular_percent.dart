import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:testrun/main.dart';
import 'package:testrun/models/fasting_model.dart';
import 'package:testrun/models/fasting_schedule.dart';
import 'package:testrun/utils/text_sizing.dart';

class AnimatedCircularPercent extends ConsumerStatefulWidget {
  final FastingProgress progress;
  const AnimatedCircularPercent({super.key, required this.progress});

  @override
  ConsumerState<AnimatedCircularPercent> createState() => _AnimatedCircularPercentState();
}

class _AnimatedCircularPercentState extends ConsumerState<AnimatedCircularPercent>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
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
                    radius: 100,
                    percent: animation.value,
                    lineWidth: 40,
                    header: Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: checkStatus.when(data: (status) {
                          return Text(
                            status.homeReminder,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: TextSizing.small),
                          );
                      }, error: (e, _) => Text(e.toString()), loading: () => SizedBox.shrink()),
                      // child: FutureBuilder(
                      //   future: ref
                      //       .read(asyncFatingNotifier.notifier)
                      //       .refreshFastingStatus(),
                      //   builder: (context, asyncSnapshot) {
                      //     if (!asyncSnapshot.hasData) {
                      //       return const CircularProgressIndicator();
                      //     }
                      //     final status = asyncSnapshot.data!;
                      //     return Text(
                      //       status.homeReminder,
                      //       // "You're only an hour away from the end",
                      //       maxLines: 2,
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(fontSize: TextSizing.small),
                      //     );
                      //   },
                      // ),
                    ),
                    center: Text('${widget.progress.remaining.inHours}h ${widget.progress.remaining.inMinutes % 60}m', style: TextStyle(fontSize: TextSizing.small),),
                    progressColor: Colors.lightBlueAccent,
                    backgroundColor: Colors.cyan,
                    circularStrokeCap: CircularStrokeCap.round,
                    animationDuration: 500,
                  ),);
      },
    );
  }
}
