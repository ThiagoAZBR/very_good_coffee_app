import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/constants/home_constants.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/home_controller.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/states/home_states.dart';
import 'package:very_good_coffee_app/app/shared/themes/app_colors.dart';
import 'package:very_good_coffee_app/app/shared/themes/app_text_styles.dart';

class HomeDefault extends StatelessWidget {
  final HomeController controller;
  const HomeDefault({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            HomeConstants.title,
            style: AppTextStyles.big(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerLeft,
            child: FittedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                onPressed: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        HomeConstants.favorites,
                        style: AppTextStyles.medium(),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.bookmark_outline_rounded,
                        color: AppColors.secondary,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.5,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: state.imageUrl!,
                placeholder: (_, url) => Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 64),
                  height: 32,
                  width: 32,
                  child: const CircularProgressIndicator(
                    color: AppColors.secondary,
                  ),
                ),
                errorListener: (_) => controller.setHomeError(),
              ),
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                onPressed: () async =>
                    await controller.addImageToFavorites(state.imageUrl!),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        HomeConstants.bookmark,
                        style: AppTextStyles.medium(),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.favorite_outline_rounded,
                        color: AppColors.secondary,
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                onPressed: controller.getCoffeeImage,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        HomeConstants.next,
                        style: AppTextStyles.medium(),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.navigate_next_rounded,
                        color: AppColors.secondary,
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  HomeDefaultState get state => controller.state$ as HomeDefaultState;
}
