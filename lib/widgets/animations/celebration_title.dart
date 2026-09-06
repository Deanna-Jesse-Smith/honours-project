import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:testrun/models/goals_model.dart';
import 'package:testrun/utils/text_sizing.dart';

class DialogTitle extends StatefulWidget {
  final GoalType type;
  const DialogTitle({super.key, required this.type});

  @override
  State<DialogTitle> createState() => _DialogTitleState();
}

class _DialogTitleState extends State<DialogTitle>
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

  @override
  void initState() {
    super.initState();

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

    switch (widget.type) {
      case GoalType.fasting:
        title = 'Fasting Goal Complete!';
        text = 'You have completed your weekly fasting goal\n\nWell done!';
      case GoalType.weight:
        title = 'Weight Goal Complete!';
        text = 'You have completed target weight\n\nWell done!';
      case GoalType.hydration:
        title = 'Hydration Goal Complete!';
        text = 'You have completed your daily hydration goal\n\nWell done!';
      case GoalType.nutrition:
        title = 'Meal Goal Complete!';
        text = 'You have completed your weekly meal goal\n\nWell done!';
    }
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
                  child: const Icon(
                    Icons.emoji_events,
                    size: 100,
                    color: Color.fromRGBO(255, 215, 0, 1),
                  ),
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
                Positioned(top: 0, left: 30, child: sparkles()),
                Positioned(top: 20, right: 20, child: sparkles()),
                Positioned(bottom: 5, left: 20, child: sparkles()),
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
                      title,
                      style: TextStyle(fontSize: TextSizing.large),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12),
                    Text(
                      text,
                      style: TextStyle(fontSize: TextSizing.medium),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 250,
              height: 80,
              child: Align(
                alignment: Alignment.topCenter,
                child: ConfettiWidget(
                  confettiController: confettiController,
                  blastDirectionality: BlastDirectionality.explosive,
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.purple,
                  ],
                ),
              ),
            ),

            FadeTransition(
              opacity: textFade,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Close',
                  style: TextStyle(fontSize: TextSizing.medium),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedBuilder sparkles() {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        Random ran = Random();
        double start = ran.nextDouble().clamp(0.1, 0.35);
        final animation = CurvedAnimation(
          parent: controller,
          // curve: const Interval(0.25, 0.7, curve: Curves.easeOut),
          curve: Interval(start, ran.nextDouble().clamp(start, 0.75), curve: Curves.easeOut),
        );

        return Opacity(
          opacity: animation.value,
          child: Transform.scale(
            scale: 0.5 + animation.value * 0.5,
            child: child,
          ),
        );
      },
      child: const Icon(Icons.auto_awesome),
    );
  }
}
