import 'package:rx_notifier/rx_notifier.dart';
import 'package:very_good_coffee_app/app/domain/models/coffee.dart';
import 'package:very_good_coffee_app/app/domain/usecases/get_coffee_image.dart';
import 'package:very_good_coffee_app/app/domain/usecases/usecase.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/states/home_states.dart';
import 'package:very_good_coffee_app/app/shared/local_db/local_db.dart';
import 'package:very_good_coffee_app/app/shared/local_db/local_db_constants.dart';

class HomeController {
  final GetCoffeeImageUseCase _getCoffeeImageUseCase;
  final LocalDB _localDB;
  final _state = RxNotifier<HomeStates>(const HomeLoadingState());
  final _isLoadingNewImages = RxNotifier<bool>(true);

  Future<void> getCoffeeImage() async {
    setHomeLoading();
    final response = await _getCoffeeImageUseCase(params: const NoParams());

    response.fold(
      setHomeError,
      setHomeDefault,
    );
  }

  List<String>? getFavoriteCoffeeImages() =>
      _localDB.getListString(LocalDBConstants.favoriteCoffeeImages);

  Future<void> addImageToFavorites(String url) async {
    try {
      setHomeLoading();
      final favoriteImages = getFavoriteCoffeeImages();
      if (favoriteImages != null) {
        favoriteImages.add(url);
        _localDB.put(LocalDBConstants.favoriteCoffeeImages, favoriteImages);
        return getCoffeeImage();
      }

      _localDB.put(LocalDBConstants.favoriteCoffeeImages, [url]);
      return getCoffeeImage();
    } catch (e) {
      setHomeError();
    }
  }

  HomeController({
    required GetCoffeeImageUseCase getCoffeeImageUseCase,
    required LocalDB localDB,
  })  : _localDB = localDB,
        _getCoffeeImageUseCase = getCoffeeImageUseCase;

  // Getters and Setters
  HomeStates get state$ => _state.value;
  bool get isLoadingNewImages => _isLoadingNewImages.value;

  setHomeLoading() => _state.value = const HomeLoadingState();
  setHomeError([Exception? exception]) => _state.value = const HomeErrorState();
  setHomeDefault(CoffeeModel coffeeModel) =>
      _state.value = HomeDefaultState(imageUrl: coffeeModel.file);
}
