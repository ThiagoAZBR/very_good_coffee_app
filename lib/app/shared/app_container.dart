import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:very_good_coffee_app/app/data/coffee_repository.dart';

abstract class Dependencies {
  void setup();
  void dispose();
}

class AppContainer implements Dependencies {
  final I = GetIt.instance;

  @override
  void dispose() {}

  @override
  void setup() {
    I.registerLazySingleton(
      () => Dio(),
    );

    I.registerLazySingleton<CoffeeRepository>(
      () => CoffeeRepositoryImpl(
        I.get<Dio>(),
      ),
    );
  }
}
