import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:p4droid/src/app_modules/home_module/home_controller.dart';

import 'package:p4droid/src/app_modules/splash_module/splash_screen.dart';
import 'src/app_modules/settings_module/settings_controller.dart';
import 'src/app_modules/splash_module/splash_bindings.dart';
import 'src/extensions/theme_extension.dart';
import 'src/routes/app_pages.dart';
import 'src/routes/app_routes.dart';


void main() async {
  await GetStorage.init();
  initializeDateFormatting().then((_) => runApp(ScreenUtilInit(
    // BoxConstraints(
    //   maxWidth: 360,
    //   maxHeight: 690,
    // ),
    splitScreenMode: false,
    scaleByHeight: true,
    builder: (BuildContext context, Widget? child) {
      context;
      return MyApp();
    },
  )));
}

class MyApp extends StatelessWidget {
  final SettingsController settingsController = Get.put(SettingsController());
  final homeController = Get.put(HomeController());
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      defaultTransition: Transition.fade,
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
      home: const SplashScreen(),
      onReady: () {
        settingsController.updateTheme();
        homeController.loadEvents();
        // ScreenSize.getScreenSize(context);
      },
    );
  }
}