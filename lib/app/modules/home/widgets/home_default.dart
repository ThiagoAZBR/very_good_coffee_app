import 'package:flutter/material.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/constants/home_constants.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/home_controller.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/states/home_states.dart';
import 'package:very_good_coffee_app/app/shared/themes/app_text_styles.dart';

class HomeDefault extends StatelessWidget {
  final HomeController controller;
  const HomeDefault({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          HomeConstants.title,
          style: AppTextStyles.big(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 32),
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            state.imageUrl!,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  HomeConstants.favorites,
                  style: AppTextStyles.medium(),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: controller.getCoffeeImage,
                child: Text(
                  HomeConstants.next,
                  style: AppTextStyles.medium(),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  HomeDefaultState get state => controller.state$ as HomeDefaultState;
}
