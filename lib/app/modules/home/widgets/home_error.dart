import 'package:flutter/material.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/constants/home_constants.dart';
import 'package:very_good_coffee_app/app/shared/themes/app_text_styles.dart';

class HomeError extends StatelessWidget {
  const HomeError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        HomeConstants.errorMessage,
        style: AppTextStyles.big(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
