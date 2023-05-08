import 'package:flutter/material.dart';

import '../constants/app_colors_pallette.dart';

extension AppTheme on ThemeData {
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppPalette.primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.blue,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
      )),
    colorScheme: const ColorScheme.light(
      secondary: AppPalette.secondaryColor,
    ),
    scaffoldBackgroundColor: AppPalette.lightColor,
    // otros ajustes de tema
  );

  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppPalette.primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: AppPalette.primaryColor,
        ),
      ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppPalette.primaryColor,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
      color: Colors.white,
    )),
    colorScheme: const ColorScheme.dark(
      onPrimary: Colors.white,
      secondary: AppPalette.secondaryColor,
    ),
    scaffoldBackgroundColor: AppPalette.darkColor,
    // otros ajustes de tema
  );
}
