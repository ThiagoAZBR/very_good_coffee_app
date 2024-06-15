import 'package:flutter/material.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/constants/home_constants.dart';
import 'package:very_good_coffee_app/app/shared/themes/app_text_styles.dart';

class HomeDefault extends StatelessWidget {
  const HomeDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          HomeConstants.title,
          style: AppTextStyles.big(fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {},
              child: Text(
                HomeConstants.favorites,
                style: AppTextStyles.medium(),
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                HomeConstants.next,
                style: AppTextStyles.medium(),
              ),
            ),
          ],
        )
      ],
    );
  }
}
