import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:very_good_coffee_app/app/data/coffee_repository.dart';
import 'package:very_good_coffee_app/app/domain/models/coffee.dart';
import 'package:very_good_coffee_app/app/domain/usecases/get_coffee_image.dart';
import 'package:very_good_coffee_app/app/domain/usecases/usecase.dart';

void main() {
  final Dio dio = Dio();
  final CoffeeRepository repository = CoffeeRepositoryImpl(dio);
  final getCoffeeImage = GetCoffeeImageUseCase(repository);

  test('get coffee image must returno CoffeeModel', () async {
    final response = await getCoffeeImage(params: const NoParams());
    final CoffeeModel? data = response.fold(
      (failure) => null,
      (success) => success,
    );

    expect(data, isA<CoffeeModel>());
  });
}
