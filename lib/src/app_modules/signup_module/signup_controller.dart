import 'package:get/get.dart';

class SignUpController extends GetxController {
  final name = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
  final isTeacher = false.obs;

  void signup() {
    // Lógica de autenticación del usuario
    if (email.value == 'profesor@ejemplo.com' && password.value == '123456') {
      isTeacher.value = true;
    }
    // Navegación a la pantalla de inicio
    Get.offNamed('/home');
  }
}
