import 'package:flutter_application_1/src/pages/auth/login_screen.dart';
import 'package:flutter_application_1/src/pages/base/base_screen.dart';
import 'package:flutter_application_1/src/pages/splash/splash_screen.dart';
import 'package:get/get.dart';

abstract class AppRoutes {
  static final pages = <GetPage>[
    GetPage(name: PageRoutes.splashRoute, page: () => const SplashScreen()),
    GetPage(name: PageRoutes.loginRoute, page: () => LoginScreen()),
    GetPage(name: PageRoutes.homeRoute, page: () => const BaseScreen()),
  ];
}

abstract class PageRoutes {
  static const String splashRoute = '/splash';
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';
}
