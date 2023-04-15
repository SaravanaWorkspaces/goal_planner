import 'package:flutter/material.dart';
import 'package:skc_goal_planner/route_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Goal Planner',
      theme: ThemeData(
        fontFamily: 'Arsenal',
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteHelper.splashScreen,
      onGenerateRoute: RouteHelper().generateRoute,
    );
  }
}
