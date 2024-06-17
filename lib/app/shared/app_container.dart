import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:very_good_coffee_app/app/data/coffee_repository.dart';
import 'package:very_good_coffee_app/app/domain/usecases/get_coffee_image.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/home_controller.dart';
import 'package:very_good_coffee_app/app/shared/local_db/local_db.dart';

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

    I.registerLazySingleton<GetCoffeeImageUseCase>(
      () => GetCoffeeImageUseCase(
        I.get<CoffeeRepository>(),
      ),
    );

    I.registerSingleton(
      PrefsImpl(
        I.get<SharedPreferences>(),
      ),
    );

    I.registerLazySingleton<HomeController>(
      () => HomeController(
        getCoffeeImageUseCase: I.get<GetCoffeeImageUseCase>(),
        localDB: I.get<PrefsImpl>(),
      ),
    );
  }
}
