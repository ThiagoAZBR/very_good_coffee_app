import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:very_good_coffee_app/app/data/coffee_repository.dart';

void main() {
  final Dio dio = Dio();
  final CoffeeRepository repository = CoffeeRepositoryImpl(dio);

  test('Coffee repository must return Right', () async {
    final response = await repository.getCoffeeImage();

    expect(response, isA<Right>());
  });
}
