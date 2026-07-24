import 'package:awraq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
//import 'app_colors.dart';

class AppLightTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBackground,
    cardColor: AppColors.lightSurface,

    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      surface: AppColors.lightSurface,
      error: AppColors.error,
    ),

    dividerColor: AppColors.lightBorder,
  );
}