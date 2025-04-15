import 'package:flutter/material.dart';
import 'package:todoapp/shared/app_colors.dart';

class TdButton extends StatelessWidget {
  final String label;
  final TextStyle? textStyle;
  final double height;
  final double elevation;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? labelColor;
  final VoidCallback onPressed;

  const TdButton({
    super.key,
    required this.label,
    this.textStyle,
    this.height = 56,
    this.elevation = 0,
    this.borderRadius = 100,
    this.backgroundColor,
    this.labelColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          elevation: elevation,
          backgroundColor: backgroundColor ?? AppColors.primaryLight,
          foregroundColor: labelColor ?? AppColors.white,
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: textStyle ??
              TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
