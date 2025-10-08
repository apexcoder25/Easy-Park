// lib/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color primary = Color(0xFF006afd);
  static const Color accent = Color(0xFF7C4DFF);
  static const Color background = Color(0xFFF5F7FA);
  static const Color card = Colors.white;
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF616161);
  static const Color selected = Color(0xFF4FC3F7);
  static const Color available = Color(0xFFF3F4F6);
  static const Color occupied = Color(0xFFFFEAEA);
  static const Color border = Color(0xFFE0E0E0);

  static const Color hintTextColor = Color(0xFFB0BEC5);
  static const Color shadowColor = Color(0x1F000000);
  static const Color linkColor = Colors.blue;
  static const Color escalationIconColor = Colors.red;
  static const Color assignmentIconColor = Colors.blue;
  static const Color whatsappIconColor = Color(0xFF44a047);
  static const Color statusButtonColor = Color(0xFF006afd);
  static const Color holdButtonColor = Color(0xFFffc008);
  static const Color statusButtonColor1 = Color(0xFFffc107);
  static const Color dangerButtonColor = Color(0xFFf44336);
  static const Color verifyButtonColor = Color(0xFF388E3C);
  static const Color blackColor = Colors.black;
  static const Color drawerBackground = Color(0xFFF5F7FA);
  static const Color drawerHeaderGradientStart = Color(0xFF006afd);
  static const Color drawerHeaderGradientEnd = Color(0xFF0047b3);
  static const Color drawerTileHover = Color(0xFFE3F2FD);
  static const Color glassBackground = Color(0x33FFFFFF);
  static const Color glassTileBackground = Color(0x1AFFFFFF);
  static const Color iconColor = Colors.black54;
}

class AppTextStyles {
  static var heading = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static var label = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static var buttonText = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static var titleLarge = GoogleFonts.poppins(
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
    textTheme: TextTheme(
      headlineMedium: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 16,
        color: AppColors.textPrimary,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12,
        color: AppColors.textSecondary,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 14,
        color: AppColors.textPrimary,
      ),
      headlineSmall: GoogleFonts.poppins(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      labelLarge: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.textPrimary,
      ),
      displayLarge: GoogleFonts.poppins(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
        color: AppColors.textPrimary,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
        textStyle: AppTextStyles.buttonText,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.hintTextColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.border),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
    ),
    iconTheme: IconThemeData(
      color: AppColors.iconColor,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: AppColors.textPrimary, 
        fontSize: 18, 
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: AppColors.textPrimary),
    ),
    brightness: Brightness.light,
  );
}