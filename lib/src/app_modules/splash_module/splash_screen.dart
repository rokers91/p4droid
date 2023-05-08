import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash_controller.dart';

//variante que rota la imagen
// class SplashScreen extends GetWidget<SplashController> {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Container(
//             color: Colors.white,
//           ),
//           AnimatedBuilder(
//             animation: controller.animation,
//             builder: (context, child) {
//               return Transform.rotate(
//                 angle: controller.animation.value,
//                 child: Center(
//                   child: Image.asset(
//                     'assets/images/splash/logo.png',
//                     width: 400,
//                     height: 400,
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

//otra variante
class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Transform.scale(
            scale: controller.scale.value,
            child: Image.asset(
              'assets/images/splash/calendar_1.png',
              width: 200,
              height: 200,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
