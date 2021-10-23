import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // this basically makes it so you can't instantiate this class

  static const Map<int, Color> mainColor = const <int, Color>{
    50: Color(0xFFFCF2E7),
    100: Color(0xFFEFCFB0),
    200: Color(0xFFF3C89C),
    300: Color(0xFFEEB274),
    400: Color(0xFFEAA256),
    500: Color(0xFFE69138),
    600: Color(0xFFE38932),
    700: Color(0xFFDF7E2B),
    800: Color(0xFFAC591B),
    900: Color(0xFFAA4D13)
  };

  static const Map<int, Color> accentColor = const <int, Color>{
    50: const Color(0xFFF1E6FF),
    100: const Color(0xFFF8DEC3),
    200: const Color(0xFFF3C89C),
    300: const Color(0xFF6F35A5),
    400: const Color(0xFFEAA256),
    500: const Color(0xFF6F35A5),
    600: const Color(0xFFE38932),
    700: const Color(0xFFDF7E2B),
    800: const Color(0xFFDB7424),
    900: const Color(0xFFD56217)
  };

  static const Map<String, Color> palete = const <String, Color>{
    'yellow': const Color(0xFFFCFFA6),
    'green': const Color(0xFFC1FFD7),
    'blue': const Color(0xFFB5DEFF),
    'purple': const Color(0xFFCAB8FF),
    'orange': const Color(0xFFE69138),
  };
}
