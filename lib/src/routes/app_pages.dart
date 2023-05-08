import 'package:get/get.dart';
import 'package:p4droid/src/app_modules/help_module/help_screen.dart';

import 'package:p4droid/src/app_modules/home_module/home_binding.dart';
import 'package:p4droid/src/app_modules/info_module/info_screen.dart';
import 'package:p4droid/src/app_modules/login_module/login_screen.dart';
import 'package:p4droid/src/app_modules/settings_module/settings_screen.dart';
import 'package:p4droid/src/app_modules/splash_module/splash_screen.dart';
import '../app_modules/settings_module/settings_binding.dart';
import '../app_modules/splash_module/splash_bindings.dart';
import '../app_modules/home_module/home_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
        name: Routes.HOME,
        page: () => const HomeScreen(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.LOGIN,
        page: () => LoginScreen(),),
    GetPage(
        name: Routes.SETTINGS,
        page: () => SettingsScreen(),
        binding: SettingsBinding()),
    GetPage(
        name: Routes.INFO,
        page: () => const InfoScreen()),
    GetPage(
        name: Routes.HELP,
        page: () => const HelpScreen()),
  ];
}
