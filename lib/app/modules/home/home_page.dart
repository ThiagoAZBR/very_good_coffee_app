import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/home_controller.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/states/home_states.dart';
import 'package:very_good_coffee_app/app/modules/home/widgets/home_default.dart';
import 'package:very_good_coffee_app/app/modules/home/widgets/home_error.dart';
import 'package:very_good_coffee_app/app/modules/home/widgets/home_loading.dart';
import 'package:very_good_coffee_app/app/shared/widgets/app_scaffold.dart';

class HomePage extends StatelessWidget {
  final HomeController controller;

  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final Map mapBuilder = {
      const HomeDefaultState().toString(): const HomeDefault(),
      const HomeLoadingState().toString(): const HomeLoading(),
      const HomeErrorState().toString(): const HomeError(),
    };
    return AppScaffold(
      child: RxBuilder(
        builder: (_) => Padding(
          padding: const EdgeInsets.all(16),
          child: mapBuilder[controller.state$.toString()],
        ),
      ),
    );
  }
}
