import 'package:flutter/material.dart';
import 'package:testrun/utils/text_sizing.dart';

class MyNavigationDrawer extends StatelessWidget {
  const MyNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 40),
        children: [
          // ListTile(),
          ListTile(
            title: const Text('Home', style: TextStyle(fontSize: TextSizing.large),),
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
          ListTile(
            title: const Text('Fasting Plan', style: TextStyle(fontSize: TextSizing.large),),
            onTap: () => Navigator.pushNamed(context, '/FastingPlan'),
          ),
          ListTile(
            title: const Text('Track Meals', style: TextStyle(fontSize: TextSizing.large),),
            onTap: () => Navigator.pushNamed(context, '/MealTracking'),
          ),
          ListTile(
            title: const Text('Step Tracking', style: TextStyle(fontSize: TextSizing.large),),
            onTap: () => Navigator.pushNamed(context, '/StepCount'),
          ),
          ListTile(
            title: const Text('Hydration Tracking', style: TextStyle(fontSize: TextSizing.large),),
            onTap: () => Navigator.pushNamed(context, '/HydrationTracking'),
          ),
          ListTile(
            title: const Text('Weight Tracking', style: TextStyle(fontSize: TextSizing.large),),
            onTap: () => Navigator.pushNamed(context, '/WeightTracking'),
          ),
          ListTile(
            title: const Text('Set Reminders', style: TextStyle(fontSize: TextSizing.large),),
            onTap: () => Navigator.pushNamed(context, '/Reminder'),
          ),
          ListTile(
            title: const Text('Profile', style: TextStyle(fontSize: TextSizing.large),),
            onTap: () => Navigator.pushNamed(context, '/Profile'),
          ),
        ],
      ),
    );
  }
}