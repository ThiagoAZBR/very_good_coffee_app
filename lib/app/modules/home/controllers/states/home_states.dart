abstract class HomeStates {
  const HomeStates();
}

class HomeDefaultState implements HomeStates {
  final String? imageUrl;
  const HomeDefaultState({
    this.imageUrl,
  });
}

class HomeErrorState implements HomeStates {
  const HomeErrorState();
}

class HomeLoadingState implements HomeStates {
  const HomeLoadingState();
}
