// lib/app_routes.dart

import 'package:get/get.dart';
import 'package:test_orientacion_vocacional/views/home_screen.dart';
import 'package:test_orientacion_vocacional/views/test_screen.dart';

class AppRoutes {
  static const home = '/';
  static const test = '/test';

  static final routes = [
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: test, page: () => TestScreen()),
  ];
}
