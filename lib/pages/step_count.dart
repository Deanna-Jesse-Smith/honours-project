import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_logs/flutter_logs.dart';
import 'package:testrun/database/daos/steps_dao.dart';
import 'package:testrun/main.dart';
import 'package:testrun/widgets/navigation_drawer.dart';

class StepCounts extends ConsumerStatefulWidget {
  const StepCounts({super.key});

  @override
  ConsumerState<StepCounts> createState() => _StepCountState();
}

class _StepCountState extends ConsumerState<StepCounts> {

  int? startSteps;
  int todaySteps = 0;
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';
  final today = DateTime.now();
  late StepsDao sDao;

  @override
  void initState() {
    super.initState();
    initPlatformState();

    sDao = ref.watch(sDaoProvider);
  }

  // void stepListener() {
  //   Pedometer.stepCountStream.listen((StepCount event) {
  //     startSteps ??= event.steps;
  //     todaySteps = event.steps - startSteps!;
  //   });
  // }

  void onStepCount(StepCount event) async {
    startSteps ??= event.steps;

    todaySteps = await sDao.logSteps(today, startSteps ?? 0);

    FlutterLogs.logInfo("Event", "StepCount", todaySteps.toString());
    setState(() {
      _steps = todaySteps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    FlutterLogs.logInfo("Event", "PedistrianStatus", event.toString());
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(String error) {
    FlutterLogs.logError("Error", "PedestrianStatus", 'onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    FlutterLogs.logInfo("Error", "PedestrianStatus", _status);
  }

  void onStepCountError(String error) {
    FlutterLogs.logError("Error", "StepCounts", 'onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  Future<bool> _checkActivityRecognitionPermission() async {
    bool granted = await Permission.activityRecognition.isGranted;

    if (!granted) {
      granted =
          await Permission.activityRecognition.request() ==
          PermissionStatus.granted;
    }

    return granted;
  }

  Future<void> initPlatformState() async {
    bool granted = await _checkActivityRecognitionPermission();
    if (!granted) {
      // tell user, the app will not work
    }

    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    (_pedestrianStatusStream.listen(
      onPedestrianStatusChanged,
    )).onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Pedometer Example')),
        drawer: MyNavigationDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Steps Taken', style: TextStyle(fontSize: 30)),
              Text(_steps, style: TextStyle(fontSize: 60)),
              Divider(height: 100, thickness: 0, color: Colors.white),
              Text('Pedestrian Status', style: TextStyle(fontSize: 30)),
              Icon(
                _status == 'walking'
                    ? Icons.directions_walk
                    : _status == 'stopped'
                    ? Icons.accessibility_new
                    : Icons.error,
                size: 100,
              ),
              Center(
                child: Text(
                  _status,
                  style: _status == 'walking' || _status == 'stopped'
                      ? TextStyle(fontSize: 30)
                      : TextStyle(fontSize: 20, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
