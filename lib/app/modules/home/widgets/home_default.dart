import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/constants/home_constants.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/home_controller.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/states/home_states.dart';
import 'package:very_good_coffee_app/app/shared/themes/app_colors.dart';
import 'package:very_good_coffee_app/app/shared/themes/app_text_styles.dart';

class HomeDefault extends StatefulWidget {
  final HomeController controller;
  const HomeDefault({
    super.key,
    required this.controller,
  });

  @override
  State<HomeDefault> createState() => _HomeDefaultState();
}

class _HomeDefaultState extends State<HomeDefault> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (state.coffeeModel!.isFavoriteCoffee) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.secondary,
            content: Text(
              HomeConstants.successMessage,
              style: AppTextStyles.medium(color: AppColors.primary),
            ),
          ),
        );
      }
    });
  }

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
                onPressed: widget.controller.setHomeFavoritesCoffeeImages,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.bookmark_outline_rounded,
                        color: AppColors.secondary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        HomeConstants.favorites,
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
              child: (state.coffeeModel!.isFavoriteCoffee)
                  ? CachedNetworkImage(
                      imageUrl: state.coffeeModel!.file,
                      placeholder: (_, url) => const ImagePlaceholder(),
                      errorListener: (_) => widget.controller.setHomeError(),
                    )
                  : Image.network(
                      state.coffeeModel!.file,
                      loadingBuilder: (_, child, progress) =>
                          (progress == null) ? child : const ImagePlaceholder(),
                      errorBuilder: (_, error, __) {
                        widget.controller.setHomeError();
                        return const SizedBox();
                      },
                    ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                onPressed: () async => await widget.controller
                    .addImageToFavorites(state.coffeeModel!.file),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.favorite_outline_rounded,
                        color: AppColors.secondary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        HomeConstants.saveImage,
                        style: AppTextStyles.medium(),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                onPressed: widget.controller.getCoffeeImage,
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
            ],
          )
        ],
      ),
    );
  }

  HomeDefaultState get state => widget.controller.state$ as HomeDefaultState;
}

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 64),
      height: 32,
      width: 32,
      child: const CircularProgressIndicator(
        color: AppColors.secondary,
      ),
    );
  }
}
