import 'package:flutter/material.dart';
import 'package:very_good_coffee_app/app/shared/themes/app_colors.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.secondary,
      ),
    );
  }
}
