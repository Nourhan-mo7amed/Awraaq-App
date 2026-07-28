import 'package:awraq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppLightTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.light,

    scaffoldBackgroundColor: AppColors.lightBackground,

    cardColor: AppColors.lightSurface,

    dividerColor: AppColors.lightBorder,

    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightTextPrimary,
      error: AppColors.error,
    ),

    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.lightTextSecondary),
    ),
  );
}

// class AppLightTheme {
//   static ThemeData theme = ThemeData(
//     brightness: Brightness.light,
//     scaffoldBackgroundColor: AppColors.lightBackground,
//     cardColor: AppColors.lightSurface,

//     colorScheme: const ColorScheme.light(
//       primary: AppColors.lightPrimary,
//       surface: AppColors.lightSurface,
//       error: AppColors.error,
//     ),

//     dividerColor: AppColors.lightBorder,
//   );
// }
