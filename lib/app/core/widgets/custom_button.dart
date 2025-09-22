// lib/widgets/custom_button.dart
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool outline;
  final Color? color;
  final IconData? icon;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.outline = false,
    this.color,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (outline) {
      return OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(color: color ?? AppColors.border),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: AppColors.textPrimary),
              const SizedBox(width: 8),
            ],
            Text(text, style: TextStyle(color: AppColors.textPrimary, fontWeight: FontWeight.w600)),
          ],
        ),
      );
    }

    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.primary,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
          ],
          Text(text, style: AppTextStyles.buttonText),
        ],
      ),
    );
  }
}
