import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.primaryLight,
        error: AppColors.error,
      ),
      textTheme: const TextTheme(
        headlineMedium: AppTextStyles.headline,
        bodyLarge: AppTextStyles.subtitle,
      ),
      useMaterial3: true,
    );
  }
}