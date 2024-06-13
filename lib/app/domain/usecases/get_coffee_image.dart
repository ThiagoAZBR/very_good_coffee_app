import 'package:fpdart/fpdart.dart';
import 'package:very_good_coffee_app/app/data/coffee_repository.dart';
import 'package:very_good_coffee_app/app/domain/models/coffee.dart';
import 'package:very_good_coffee_app/app/domain/usecases/usecase.dart';

class GetCoffeeImageUseCase implements UseCase<CoffeeModel, NoParams> {
  final CoffeeRepository repository;

  GetCoffeeImageUseCase(this.repository);
  @override
  Future<Either<Exception, CoffeeModel>> call({
    required NoParams params,
  }) async {
    return await repository.getCoffeeImage();
  }
}
