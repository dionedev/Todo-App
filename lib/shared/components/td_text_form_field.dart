import 'package:flutter/material.dart';
import 'package:todoapp/shared/app_colors.dart';

class TdTextFormField extends StatelessWidget {
  final String labelText;
  final String? hintText;
  final TextEditingController controller;

  const TdTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
        color: AppColors.textPrimaryLight,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelStyle: TextStyle(
          color: AppColors.primaryLight,
          fontWeight: FontWeight.bold,
        ),
        labelStyle: TextStyle(
          color: AppColors.textSecondaryLight,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.textSecondaryLight,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.borderLight,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryLight,
          ),
        ),
      ),
    );
  }
}
