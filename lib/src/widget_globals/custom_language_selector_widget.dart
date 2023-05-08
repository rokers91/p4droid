import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_modules/settings_module/settings_controller.dart';

class LanguageSelector extends StatelessWidget {
  final settingsController = Get.find<SettingsController>();

  LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const[
           BoxShadow(
            color: Colors.grey,
            blurRadius: 2.0,
            spreadRadius: 0.0,
            offset: Offset(1.0, 1.0),
          ),
        ],
      ),
      child: Obx(() {
          return Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => settingsController.locale.value = const Locale('es', 'ES'),
                  child: Text(
                    'Español',
                    style: TextStyle(
                      color: settingsController.locale.value.languageCode == 'es'
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: TextButton(
                  onPressed: () => settingsController.locale.value = const Locale('en', 'US'),
                  child: Text(
                    'Inglés',
                    style: TextStyle(
                      color: settingsController.locale.value.languageCode == 'en'
                          ? Theme.of(context).primaryColor
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}