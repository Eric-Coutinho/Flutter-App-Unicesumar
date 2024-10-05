import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/config/custom_colors.dart';
import 'package:flutter_application_1/src/pages/auth/login_screen.dart';
import 'package:flutter_application_1/src/pages/widgets/app_title.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 1), // ALTERAR TEMPO
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (c) {
              return const LoginScreen();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              CustomColors.customizedAppColor,
              CustomColors.customizedAppColor.shade600,
            ],
          ),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTitle(
              titleColor: Colors.white,
              fontSize: 35,
            ),
            SizedBox(
              height: 12,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
