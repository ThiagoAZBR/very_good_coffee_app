import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:very_good_coffee_app/app/modules/app_widget.dart';
import 'package:very_good_coffee_app/app/shared/app_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  GetIt.I.registerSingleton(sharedPreferences);
  AppContainer().setup();

  runApp(
    const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: AppWidget(),
    ),
  );
}
