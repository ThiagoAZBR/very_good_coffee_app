import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final IconData iconData;
  final TextStyle textStyle;

  const AppButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.iconData,
    required this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
      ),
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: AppColors.secondary,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: AppTextStyles.medium(),
            ),
          ],
        ),
      ),
    );
  }
}
