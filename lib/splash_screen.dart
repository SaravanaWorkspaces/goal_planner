import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skc_goal_planner/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _launchMainScreenDelayed(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Goal Planner"),
        ),
      ),
    );
  }
}

void _launchMainScreenDelayed(BuildContext context) {
  Timer(
    const Duration(seconds: 3),
    () {
      Navigator.pushReplacementNamed(context, RouteHelper.homeScreen);
    },
  );
}
