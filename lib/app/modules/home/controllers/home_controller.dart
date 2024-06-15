import 'package:rx_notifier/rx_notifier.dart';
import 'package:very_good_coffee_app/app/modules/home/controllers/states/home_states.dart';

class HomeController {
  final _state = RxNotifier<HomeStates>(const HomeLoadingState());
  final _isLoadingNewImages = RxNotifier<bool>(true);

  // Getters and Setters
  HomeStates get state$ => _state.value;
  bool get isLoadingNewImages => _isLoadingNewImages.value;
}
