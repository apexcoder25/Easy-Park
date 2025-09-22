// lib/widgets/custom_text_field.dart
import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class CustomTextField extends StatelessWidget {
  final String? label;                // <-- NEW
  final String hint;
  final IconData icon;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffix;

  const CustomTextField({
    Key? key,
    this.label,             // <-- NEW
    required this.hint,
    required this.icon,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? "",             // <-- NEW
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Colors.grey.shade100,
            prefixIcon: Icon(icon, color: AppColors.textSecondary),
            suffixIcon: suffix,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.primary),
            ),
          ),
          style: const TextStyle(color: AppColors.textPrimary),
        ),
      ],
    );
  }
}
