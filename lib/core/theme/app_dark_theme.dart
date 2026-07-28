import 'package:awraq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppDarkTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppColors.darkBackground,

    cardColor: AppColors.darkSurface,

    dividerColor: AppColors.darkBorder,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimary,
      surface: AppColors.darkSurface,
      onSurface: AppColors.darkTextPrimary,
      error: AppColors.error,
    ),

    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: AppColors.darkTextSecondary),
    ),
  );
}

// class AppDarkTheme {
//   static ThemeData theme = ThemeData(
//     brightness: Brightness.dark,
//     scaffoldBackgroundColor: AppColors.darkBackground,
//     cardColor: AppColors.darkSurface,

//     colorScheme: const ColorScheme.dark(
//       primary: AppColors.darkPrimary,
//       surface: AppColors.darkSurface,
//       error: AppColors.error,
//     ),

//     dividerColor: AppColors.darkBorder,
//   );
// }
