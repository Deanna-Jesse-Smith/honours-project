import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:testrun/models/concerns_model.dart';
import 'package:testrun/utils/text_sizing.dart';

class ConcernDialog extends StatefulWidget {
  final BasicConcern concern;
  const ConcernDialog({super.key, required this.concern});

  @override
  State<ConcernDialog> createState() => _ConcernDialogState();
}

class _ConcernDialogState extends State<ConcernDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late ConfettiController confettiController;
  late Animation<double> animation;
  late final Animation<Offset> textSlide;
  late final Animation<double> textFade;

  late final Animation<double> trophyScale;
  late final Animation<double> trophyRotation;
  bool triggered = false;
  late String title, text;
  late Icon displayIcon;

  @override
  void initState() {
    super.initState();

    displayIcon = widget.concern is HealthConcern
        ? Icon(
            Icons.health_and_safety_rounded,
            size: 100,
            color: Color.fromRGBO(255, 132, 0, 1),
          )
        : Icon(
            Icons.celebration_rounded,
            size: 100,
            color: Color.fromRGBO(183, 0, 255, 1),
          );

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    confettiController = ConfettiController(
      duration: const Duration(seconds: 5),
    );

    trophyScale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.1, 0.5, curve: Curves.elasticOut),
      ),
    );
    trophyRotation = Tween<double>(begin: -0.55, end: 0.2).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.1, 0.5, curve: Curves.easeOutBack),
      ),
    );

    textSlide = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.25, 0.65, curve: Curves.easeOut),
          ),
        );

    textFade = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.25, 0.65, curve: Curves.easeOut),
      ),
    );

    controller.addListener(() {
      if (controller.value >= 0.4 && !triggered) {
        triggered = true;
        confettiController.play();
      }
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: CurvedAnimation(parent: controller, curve: Curves.easeOutBack),
      child: AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: controller,
                  child: displayIcon,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: trophyScale.value,
                      child: Transform.rotate(
                        angle: trophyRotation.value,
                        child: child,
                      ),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            FadeTransition(
              opacity: textFade,
              child: SlideTransition(
                position: textSlide,
                child: Column(
                  children: [
                    Text(
                      widget.concern.title,
                      style: TextStyle(fontSize: TextSizing.large),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12),
                    Text(
                      widget.concern.text,
                      style: TextStyle(fontSize: TextSizing.medium),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // FadeTransition(
            //   opacity: textFade,
            //   child: ElevatedButton(
            //     onPressed: () => Navigator.pop(context),
            //     child: const Text(
            //       'Close',
            //       style: TextStyle(fontSize: TextSizing.medium),
            //     ),
            //   ),
            // ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, 1),
              child: Text('Close'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 2),
              child: Text('Dismiss (1 week)'),
            ),
        ],
      ),
    );
  }
}
