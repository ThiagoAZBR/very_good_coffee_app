import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:very_good_coffee_app/app/modules/app_widget.dart';
import 'package:very_good_coffee_app/app/shared/app_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  AppContainer().setup();

  runApp(
    const AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: AppWidget(),
    ),
  );
}
