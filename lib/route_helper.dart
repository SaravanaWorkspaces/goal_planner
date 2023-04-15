import 'package:flutter/material.dart';
import 'package:skc_goal_planner/presentation/add_goal_screen.dart';
import 'package:skc_goal_planner/presentation/home_screen.dart';
import 'package:skc_goal_planner/splash_screen.dart';

class RouteHelper {
  static const String splashScreen = "splashScreen";
  static const String homeScreen = "homeScreen";
  static const String addGoalScreen = "addGoalScreen";

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case homeScreen:
        return _createRoute(const HomeScreen());
      case addGoalScreen:
        return _createRoute(const AddGoalScreen());
      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
          ),
          body: const Center(
            child: Text("ERROR"),
          ),
        );
      },
    );
  }

  Route _createRoute(Widget route) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => route,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeIn;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
