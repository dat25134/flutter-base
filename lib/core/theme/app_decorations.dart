 import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppDecorations {
  static BoxDecoration get gradientBackground => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        AppColors.primary.withOpacity(0.1),
        AppColors.background,
      ],
    ),
  );

  static BoxDecoration get logoContainer => BoxDecoration(
    color: AppColors.background,
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        spreadRadius: 1,
        blurRadius: 15,
        offset: const Offset(0, 5),
      ),
    ],
  );

  static BoxDecoration get socialButton => BoxDecoration(
    color: AppColors.background,
    borderRadius: BorderRadius.circular(12),
    boxShadow: [
      BoxShadow(
        color: AppColors.shadowColor,
        spreadRadius: 1,
        blurRadius: 10,
        offset: const Offset(0, 2),
      ),
    ],
  );

  static InputDecoration textFieldDecoration(String label, Widget? prefixIcon, Widget? suffixIcon) => InputDecoration(
    labelText: label,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    filled: true,
    fillColor: Colors.grey.shade50,
    contentPadding: const EdgeInsets.all(20),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(
        color: AppColors.primary,
        width: 2,
      ),
    ),
  );
}