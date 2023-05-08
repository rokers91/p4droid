// import 'package:flutter/animation.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SplashController extends GetxController
//     with GetSingleTickerProviderStateMixin {
//   late AnimationController animationController;
//   late Animation<double> animation;

//   @override
//   void onInit() {
//     animationInitialization();
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     animationController.dispose();
//     super.onClose();
//   }

//   void goToHome() async {
//     await Future.delayed(const Duration(seconds: 5));
//     Get.offAllNamed('/home');
//   }

//   void animationInitialization() {
//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 3),
//     );
//     animation = Tween<double>(begin: 0, end: 6.28).animate(animationController);
//     animationController.repeat();
//     goToHome();
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p4droid/src/app_modules/login_module/login_screen.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  final scale = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        scale.value = animation.value;
      });
    controller.forward().whenComplete(() {
      Get.off(() => LoginScreen());
    });
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
