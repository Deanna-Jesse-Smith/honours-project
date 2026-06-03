import 'package:flutter/material.dart';
import 'package:testrun/pages/FastingPlan.dart';
import 'package:testrun/pages/home.dart';
import 'package:testrun/pages/meal_tracking.dart';
import 'package:testrun/pages/step_count.dart';
import 'package:testrun/pages/setup_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const HomePage(),
      routes: {
        '/' : (context) => const HomePage(),
        '/FastingPlan' : (context) => FastingPlan(),
        '/MealTracking' : (context) => MealTracking(),
        '/StepCount' : (context) => StepCounts(),
        '/SetupUser' : (context) => SetupUser()
      },
      theme:ThemeData(
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
          displayLarge: const TextStyle(
            fontSize: 24
          ),
          titleLarge: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
          displayMedium: const TextStyle(
            fontSize: 16
          )
        )
      )
    );
  }
}