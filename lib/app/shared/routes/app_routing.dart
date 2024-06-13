import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/home_controller.dart';
import 'package:very_good_coffee_app/app/modules/home/home_page.dart';
import 'package:very_good_coffee_app/app/shared/routes/app_routes.dart';

class AppRouting {
  final I = GetIt.I;

  Map<String, Widget Function(BuildContext)> routes() => {
        AppRoutes.homePage: (_) => HomePage(
              controller: I.get<HomeController>(),
            )
      };
}
