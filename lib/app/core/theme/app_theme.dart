// lib/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF4FC3F7); // bright blue
  static const Color accent = Color(0xFF7C4DFF);
  static const Color background = Color(0xFFF5F7FA);
  static const Color card = Colors.white;
  static const Color textPrimary = Color(0xFF1F2937);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color selected = Color(0xFF4FC3F7);
  static const Color available = Color(0xFFF3F4F6);
  static const Color occupied = Color(0xFFFFEAEA);
  static const Color border = Color(0xFFE6E9EE);
}

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle label = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.2,
    color: AppColors.textPrimary,
  );
}

ThemeData getAppTheme() {
  return ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: 'Roboto',
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      titleTextStyle:
          TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w600),
      iconTheme: IconThemeData(color: AppColors.textPrimary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(color: AppColors.textSecondary),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        textStyle: AppTextStyles.buttonText,
      ),
    ),
  );
}
