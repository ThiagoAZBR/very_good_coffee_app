import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/constants/home_constants.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/home_controller.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/states/home_states.dart';
import 'package:very_good_coffee_app/app/shared/exceptions.dart';
import 'package:very_good_coffee_app/app/shared/themes/app_text_styles.dart';
import 'package:very_good_coffee_app/app/shared/widgets/app_button.dart';

class HomeError extends StatelessWidget {
  final HomeController controller;

  const HomeError({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
        builder: (_) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  getErrorMessage(state),
                  style: AppTextStyles.big(),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                getException(state) is FailureToLoadImageFromNetworkException
                    ? AppButton(
                        onTap: () {
                          controller.setHomeLoading();
                          controller.setHomeFavoritesCoffeeImages();
                        },
                        text: HomeConstants.myImages,
                        iconData: Icons.bookmark_outline_rounded,
                        textStyle: AppTextStyles.medium(),
                      )
                    : AppButton(
                        onTap: controller.getCoffeeImage,
                        text: HomeConstants.newImages,
                        iconData: Icons.sync_outlined,
                        textStyle: AppTextStyles.medium(),
                      ),
              ],
            ));
  }

  HomeErrorState get state => controller.state$ as HomeErrorState;

  String getErrorMessage(HomeErrorState state) {
    if (state.exception is ThereIsNoFavoriteImagesException) {
      return HomeConstants.thereIsNoFavoriteImages;
    }

    return HomeConstants.defaultErrorMessage;
  }

  Exception getException(HomeErrorState state) {
    if (state.exception != null) {
      if (state.exception is ThereIsNoFavoriteImagesException) {
        return ThereIsNoFavoriteImagesException();
      }
    }

    return FailureToLoadImageFromNetworkException();
  }
}
