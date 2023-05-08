import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget_globals/custom_language_selector_widget.dart';
import '../../widget_globals/custom_settings_options_widget.dart';
import 'settings_controller.dart';



class SettingsScreen extends StatelessWidget {
  final SettingsController settingsController = Get.find();
  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Configuración general',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Obx(() => CustomSwitchTileWidget(
              label: 'Tema oscuro',
              value: settingsController.isDarkModeEnabled.value,
              onChanged: (value) {
                settingsController.isDarkModeEnabled.value = value;
                settingsController.updateTheme();
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: LanguageSelector(),
          ),
          // CustomSwitchTileWidget(
          //   label: 'Idioma del calendario',
          //   value: settingsController.locale.value.toString(),
          //   onChanged: (value) => settingsController.onLocaleChanged(value),
          // ),
        ],
      ),
      // ListView(
      //   children: [
      //     ListTile(
      //       title: const Text('Modo Oscuro'),
      //       trailing: Obx(
      //             () => const Column(
      //               children: [
      //                  Padding(
      //                   padding: EdgeInsets.all(16.0),
      //                   child: Text(
      //                     'Configuración general',
      //                     style: TextStyle(fontSize: 20),
      //                   ),
      //                 ),
      //                 // Switch(
      //                 //   value: settingsController.isDarkModeEnabled.value,
      //                 //   onChanged: (val) {
      //                 //         settingsController.isDarkModeEnabled.value = val;
      //                 //         settingsController.updateTheme();
      //                 //   },
      //                 // ),
      //                 // const SizedBox(height: 15,),
      //                 //   DropdownButton<Locale>(
      //                 //     value: settingsController.locale.value,
      //                 //     onChanged: (newLocale) {
      //                 //       settingsController.onLocaleChanged(newLocale!);
      //                 //     },
      //                 //     items: const [
      //                 //       DropdownMenuItem(
      //                 //         value: Locale('en', 'US'),
      //                 //         child: Text('English'),
      //                 //       ),
      //                 //       DropdownMenuItem(
      //                 //         value: Locale('es', 'ES'),
      //                 //         child: Text('Español'),
      //                 //       ),
      //                 //     ],
      //                 //   )
      //               ],
      //             ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}



// CustomOptionsWidget(
// label: 'Tema oscuro',
// value: settingsController.isDarkModeEnabled.value,
// onChanged: (value) => settingsController.updateTheme()
// ),
// const SizedBox(height: 15,),
// CustomOptionsWidget(
// label: 'Idioma del calendario',
// value: settingsController.locale.value,
// options: const ['Español', 'Inglés'],
// onChanged: (value) => settingsController.onLocaleChanged(value),
// ),
