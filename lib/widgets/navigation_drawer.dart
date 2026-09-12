import 'package:flutter/material.dart';

class MyNavigationDrawer extends StatelessWidget {
  const MyNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          // ListTile(),
          ListTile(
            title: const Text('Home'),
            onTap: () => Navigator.pushNamed(context, '/'),
          ),
          ListTile(
            title: const Text('Fasting Plan'),
            onTap: () => Navigator.pushNamed(context, '/FastingPlan'),
          ),
          ListTile(
            title: const Text('Track Meals'),
            onTap: () => Navigator.pushNamed(context, '/MealTracking'),
          ),
          ListTile(
            title: const Text('Step Tracking'),
            onTap: () => Navigator.pushNamed(context, '/StepCount'),
          ),
          ListTile(
            title: const Text('Hydration Tracking'),
            onTap: () => Navigator.pushNamed(context, '/HydrationTracking'),
          ),
          ListTile(
            title: const Text('Weight Tracking'),
            onTap: () => Navigator.pushNamed(context, '/WeightTracking'),
          ),
          ListTile(
            title: const Text('Set Reminders'),
            onTap: () => Navigator.pushNamed(context, '/Reminder'),
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () => Navigator.pushNamed(context, '/Profile'),
          ),
        ],
      ),
    );
  }
}