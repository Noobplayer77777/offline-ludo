import 'package:flutter/material.dart';
import 'package:offline_ludo/core/theme/app_colors.dart';

class NeonContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final bool isGlowing;
  final double blurRadius;
  final double spreadRadius;

  const NeonContainer({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.isGlowing = true,
    this.blurRadius = 15.0,
    this.spreadRadius = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    final baseColor = color ?? AppColors.primary;
    
    return Container(
      margin: margin,
      padding: padding ?? const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: AppColors.surfaceHighlight.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: baseColor.withValues(alpha: 0.5),
          width: 1.5,
        ),
        boxShadow: isGlowing
            ? [
                BoxShadow(
                  color: baseColor.withValues(alpha: 0.2),
                  blurRadius: blurRadius,
                  spreadRadius: spreadRadius,
                ),
              ]
            : [],
      ),
      child: child,
    );
  }
}
