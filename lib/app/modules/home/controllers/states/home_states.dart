import 'package:very_good_coffee_app/app/domain/models/coffee.dart';

abstract class HomeStates {
  const HomeStates();
}

class HomeDefaultState implements HomeStates {
  final CoffeeModel? coffeeModel;
  const HomeDefaultState({
    this.coffeeModel,
  });
}

class HomeFavoriteCoffeeImagesState implements HomeStates {
  final List<String>? images;

  const HomeFavoriteCoffeeImagesState({
    this.images,
  });
}

class HomeErrorState implements HomeStates {
  const HomeErrorState();
}

class HomeLoadingState implements HomeStates {
  const HomeLoadingState();
}
