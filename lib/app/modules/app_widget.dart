import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:very_good_coffee_app/app/shared/routes/app_routes.dart';
import 'package:very_good_coffee_app/app/shared/routes/app_routing.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      routes: AppRouting().routes(),
      initialRoute: AppRoutes.homePage,
      debugShowCheckedModeBanner: false,
    );
  }
}
