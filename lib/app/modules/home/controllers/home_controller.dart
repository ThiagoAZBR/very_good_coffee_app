import 'package:rx_notifier/rx_notifier.dart';
import 'package:very_good_coffee_app/app/domain/models/coffee.dart';
import 'package:very_good_coffee_app/app/domain/usecases/get_coffee_image.dart';
import 'package:very_good_coffee_app/app/domain/usecases/usecase.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/states/home_states.dart';

class HomeController {
  final GetCoffeeImageUseCase _getCoffeeImageUseCase;
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

  HomeController({
    required GetCoffeeImageUseCase getCoffeeImageUseCase,
  }) : _getCoffeeImageUseCase = getCoffeeImageUseCase;

  // Getters and Setters
  HomeStates get state$ => _state.value;
  bool get isLoadingNewImages => _isLoadingNewImages.value;

  setHomeLoading() => _state.value = const HomeLoadingState();
  setHomeError(Exception? exception) => _state.value = const HomeErrorState();
  setHomeDefault(CoffeeModel coffeeModel) =>
      _state.value = HomeDefaultState(imageUrl: coffeeModel.file);
}
