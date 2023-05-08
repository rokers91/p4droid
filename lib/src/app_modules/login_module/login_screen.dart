import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:p4droid/src/app_modules/login_module/login_controller.dart';


class LoginScreen extends StatelessWidget {
  final controller = Get.put(LoginController());
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  onChanged: (value) => controller.email.value = value,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 25,),
                TextField(
                  onChanged: (value) => controller.password.value = value,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 25,),
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
                const SizedBox(height: 25,),
                ElevatedButton(
                  onPressed: controller.login,
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
