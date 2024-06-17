import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/home_controller.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/states/home_states.dart';

import '../../../shared/themes/app_colors.dart';
import '../../../shared/themes/app_text_styles.dart';
import '../controllers/constants/home_constants.dart';

class HomeFavoriteCoffeeImages extends StatefulWidget {
  final HomeController controller;

  const HomeFavoriteCoffeeImages({
    super.key,
    required this.controller,
  });

  @override
  State<HomeFavoriteCoffeeImages> createState() =>
      _HomeFavoriteCoffeeImagesState();
}

class _HomeFavoriteCoffeeImagesState extends State<HomeFavoriteCoffeeImages> {
  int imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 64.0),
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
                onPressed: () => controller.getCoffeeImage(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.autorenew_rounded,
                        color: AppColors.secondary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        HomeConstants.newImages,
                        style: AppTextStyles.medium(),
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
                imageUrl: state.images![imageIndex],
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
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: FittedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                onPressed: () => setState(() {
                  int indexLimit = state.images!.length - 1;
                  if (imageIndex < indexLimit) {
                    imageIndex++;
                    return;
                  }
                  imageIndex = 0;
                }),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_right_alt_rounded,
                        color: AppColors.secondary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        HomeConstants.next,
                        style: AppTextStyles.medium(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  HomeController get controller => widget.controller;
  HomeFavoriteCoffeeImagesState get state =>
      controller.state$ as HomeFavoriteCoffeeImagesState;
}
