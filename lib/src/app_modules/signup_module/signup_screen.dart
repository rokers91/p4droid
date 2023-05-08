import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'signup_controller.dart';

class LoginScreen extends GetView<SignUpController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) => controller.email.value = value,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              onChanged: (value) => controller.password.value = value,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Soy profesor'),
                Obx(() => Switch(
                      value: controller.isTeacher.value,
                      onChanged: (value) => controller.isTeacher.value = value,
                    )),
              ],
            ),
            ElevatedButton(
              onPressed: controller.signup,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
