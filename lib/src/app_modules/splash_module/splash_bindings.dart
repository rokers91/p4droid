import 'package:get/get.dart';
import 'package:p4droid/src/app_modules/splash_module/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
