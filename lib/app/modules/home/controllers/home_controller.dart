import 'package:rx_notifier/rx_notifier.dart';
import 'package:very_good_coffee_app/app/domain/models/coffee.dart';
import 'package:very_good_coffee_app/app/domain/usecases/get_coffee_image.dart';
import 'package:very_good_coffee_app/app/domain/usecases/usecase.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/states/home_states.dart';
import 'package:very_good_coffee_app/app/shared/exceptions.dart';
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

  List<String>? getLocalFavoriteCoffeeImages() =>
      _localDB.getListString(LocalDBConstants.favoriteCoffeeImages);

  Future<void> addImageToFavorites(String url) async {
    setHomeLoading();
    try {
      final favoriteImages = getLocalFavoriteCoffeeImages();
      if (favoriteImages != null) {
        if (favoriteImages.any((e) => e == url)) {
          return setHomeDefault(
            CoffeeModel(
              file: url,
              isFavoriteCoffee: true,
            ),
          );
        }
        favoriteImages.add(url);
        await _localDB.put(
            LocalDBConstants.favoriteCoffeeImages, favoriteImages);

        return setHomeDefault(
          CoffeeModel(
            file: url,
            isFavoriteCoffee: true,
          ),
        );
      }

      await _localDB.put(LocalDBConstants.favoriteCoffeeImages, [url]);
      return setHomeDefault(
        CoffeeModel(
          file: url,
          isFavoriteCoffee: true,
        ),
      );
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

  void setHomeLoading() {
    _state.value = const HomeLoadingState();
  }

  void setHomeError([Exception? exception]) {
    _state.value = HomeErrorState(exception: exception);
  }

  void setHomeDefault(CoffeeModel coffeeModel) {
    _state.value = HomeDefaultState(coffeeModel: coffeeModel);
  }

  setHomeFavoritesCoffeeImages() {
    final images = getLocalFavoriteCoffeeImages();
    if (images != null) {
      _state.value = HomeFavoriteCoffeeImagesState(
        images: getLocalFavoriteCoffeeImages(),
      );
      return;
    }

    setHomeError(ThereIsNoFavoriteImagesException());
  }
}
