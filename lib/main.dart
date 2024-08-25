import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/auth/login_screen.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: CustomColors.customizedAppColor,
        useMaterial3: true,
        brightness: Brightness.dark
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
