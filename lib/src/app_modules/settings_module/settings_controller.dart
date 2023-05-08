import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  var settingsBox = GetStorage();
  var isDarkModeEnabled = false.obs;
  var locale = const Locale('en', 'US').obs;

  @override
  void onInit() {
    super.onInit();
    isDarkModeEnabled.value = settingsBox.read('isDarkModeEnabled') ?? false;
    updateLocale();
  }

  void updateTheme() {
    Get.changeThemeMode(
        isDarkModeEnabled.value ? ThemeMode.dark : ThemeMode.light);
    settingsBox.write('isDarkModeEnabled', isDarkModeEnabled.value);
    update();
  }

  void updateLocale() {
    locale.value = Locale(
      settingsBox.read('locale_language_code') ?? 'en',
      settingsBox.read('locale_country_code') ?? 'US',
    );
    update();
  }

  void onLocaleChanged(Locale newLocale) {
    locale.value = newLocale;
    settingsBox.write('locale_language_code', newLocale.languageCode);
    settingsBox.write('locale_country_code', newLocale.countryCode);
    update();
  }
}
