import 'package:flutter/material.dart';

abstract class CustomColors {
    static final Map<int, Color> _opacity = {
      50: const Color(0xFFE3F2FD),
      100: const Color(0XFFBBDEFB),
      200: const Color(0xFF90CAF9),
      300: const Color(0xFF64B5F6),
      400: const Color(0xFF42A5F5),
      500: const Color(0xFF2196F3),
      600: const Color(0xFF1E88E5),
      700: const Color(0xFF1976D2),
      800: const Color(0xFF1565C0),
      900: const Color(0xFF0D47A1),
    };

    static Color customizedContrastColor = const Color.fromARGB(255, 253, 35, 35);

    static MaterialColor customizedAppColor = MaterialColor(0xFF2196F3, _opacity);

    static Color inputTextColor = const Color.fromARGB(255, 99, 99, 99);
}