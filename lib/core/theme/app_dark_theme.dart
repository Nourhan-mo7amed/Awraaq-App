import 'package:awraq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
// import 'app_colors.dart';

class AppDarkTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBackground,
    cardColor: AppColors.darkSurface,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimary,
      surface: AppColors.darkSurface,
      error: AppColors.error,
    ),

    dividerColor: AppColors.darkBorder,
  );
}