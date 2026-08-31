import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class AnimatedLiquidProgress extends StatefulWidget {
  final double progress;
  const AnimatedLiquidProgress({super.key, required this.progress});

  @override
  State<AnimatedLiquidProgress> createState() => _AnimatedLiquidProgressState();
}

class _AnimatedLiquidProgressState extends State<AnimatedLiquidProgress>
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
      end: widget.progress,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    controller.forward();
  }

  @override
  void didUpdateWidget(covariant AnimatedLiquidProgress oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.progress != widget.progress) {
      animation = Tween<double>(
        begin: animation.value,
        end: widget.progress,
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
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SizedBox(
          width: 150,
          height: 150,
          child: LiquidCircularProgressIndicator(
            value: animation.value,
            valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
            backgroundColor: Colors.white,
            // borderColor: Colors.red,
            // borderWidth: 5.0,
            direction: Axis.vertical,
            // shapePath: buildBottlePath(const Size(100, 180)),
          ),
        );
      },
    );
  }
}
