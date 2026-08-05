import 'package:flutter/material.dart';
import 'package:offline_ludo/core/theme/app_colors.dart';

class CyberTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData? prefixIcon;
  final bool isUppercase;

  const CyberTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.prefixIcon,
    this.isUppercase = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceHighlight.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.3), width: 1),
      ),
      child: TextField(
        controller: controller,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: AppColors.onSurface,
          fontWeight: FontWeight.bold,
          letterSpacing: isUppercase ? 2.0 : 1.0,
        ),
        textCapitalization: isUppercase ? TextCapitalization.characters : TextCapitalization.words,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: AppColors.primary.withValues(alpha: 0.7),
            letterSpacing: 2.0,
          ),
          prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: AppColors.primary) : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
    );
  }
}
