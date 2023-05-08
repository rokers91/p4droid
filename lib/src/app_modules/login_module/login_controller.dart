import 'package:get/get.dart';

class LoginController extends GetxController {
  final email = ''.obs;
  final password = ''.obs;
  final isTeacher = false.obs;

  void login() {
    // Lógica de autenticación del usuario
    if (email.value == 'profesor@ejemplo.com' && password.value == '123456') {
      isTeacher.value = true;
    }
    // Navegación a la pantalla de inicio
    Get.offNamed('/home');
  }
}
