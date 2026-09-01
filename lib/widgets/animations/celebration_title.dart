import 'package:flutter/material.dart';

class DialogTitle extends StatefulWidget {
  const DialogTitle({super.key});

  @override
  State<DialogTitle> createState() => _DialogTitleState();
}

class _DialogTitleState extends State<DialogTitle> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late final Animation<Offset> textSlide;
  late final Animation<double> textFade;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    textSlide = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(CurvedAnimation(parent: controller, 
    curve: const Interval(0.25, 0.65, curve: Curves.easeOut)));

    textFade = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: controller, 
    curve: const Interval(0.25, 0.65, curve: Curves.easeOut)));

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: CurvedAnimation(parent: controller, curve: Curves.easeOutBack),
    child: AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const Icon(Icons.emoji_events, size: 80),
              Positioned(top: 0, left: 30, child: star()),
              Positioned(top: 20, right: 20, child: star()),
              Positioned(bottom: 5, left: 20, child: star()),
            ],
          ),

          const SizedBox(height: 20,),

          FadeTransition(opacity: textFade, child: SlideTransition(position: textSlide,
          child: const Column(children: [
            Text(''), SizedBox(height: 8,), Text(''),
          ],)))
        ],
      ),
    ));
  }

  AnimatedBuilder sparkles() {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final animation = CurvedAnimation(parent: controller, curve: const Interval(0.25, 0.7, curve: Curves.easeOut),);

        return Opacity(opacity: animation.value,
        child: Transform.scale(scale: 0.5 + animation.value * 0.5, child: child,),);
      }, child: const Icon(Icons.auto_awesome),
    );
  }

  Icon star() {
    return Icon(Icons.star_border, color: Colors.yellow,);
  }
}