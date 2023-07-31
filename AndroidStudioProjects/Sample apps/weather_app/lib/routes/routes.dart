import 'package:flutter/material.dart';
import 'package:test/features/weather/presentation/weather_screen.dart';

class ScreenRoutes {
  static const String toSplashScreen = 'toSplashScreen';
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // var args = settings.arguments;
    switch (settings.name) {
      case ScreenRoutes.toSplashScreen:
        return MaterialPageRoute(builder: (_) => const WeatherScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const WeatherScreen(),
        );
    }
  }
}