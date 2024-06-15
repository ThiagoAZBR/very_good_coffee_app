import 'package:flutter/material.dart';
import 'package:very_good_coffee_app/app/shared/themes/app_colors.dart';

class AppTextStyles {
  static TextStyle medium() => const TextStyle(
        fontSize: 14,
        color: AppColors.textColor,
      );
  static TextStyle big() => const TextStyle(
        fontSize: 16,
        color: AppColors.textColor,
      );
}
