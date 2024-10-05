import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';
import 'package:flutter_application_1/src/pages/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hortifruti Comunitária',
      theme: ThemeData(
          colorSchemeSeed: CustomColors.customizedAppColor,
          useMaterial3: true,
          brightness: Brightness.light,
          scaffoldBackgroundColor: const Color.fromARGB(255, 224, 224, 224),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: CustomColors.customizedAppColor),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 224, 224, 224),
            ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: CustomColors.customizedAppColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18))))),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
