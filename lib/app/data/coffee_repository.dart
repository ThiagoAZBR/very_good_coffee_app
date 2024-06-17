import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:very_good_coffee_app/app/domain/models/coffee.dart';
import 'package:very_good_coffee_app/app/shared/network/app_urls.dart';
import 'package:very_good_coffee_app/app/shared/exceptions.dart';

abstract class CoffeeRepository {
  Future<Either<Exception, CoffeeModel>> getCoffeeImage();
}

class CoffeeRepositoryImpl implements CoffeeRepository {
  final Dio dio;

  CoffeeRepositoryImpl(this.dio);

  @override
  Future<Either<Exception, CoffeeModel>> getCoffeeImage() async {
    try {
      final response = await dio.get(AppUrls.getCoffeeImage);

      return Right(_handleGetCoffeeImageResponse(response));
    } on DioException catch (e) {
      return Left(e);
    } on UnexpectedException catch (e) {
      return Left(e);
    }
  }
}

CoffeeModel _handleGetCoffeeImageResponse(Response response) {
  if (response.statusCode == 200) {
    return CoffeeModel.fromMap(response.data);
  }

  throw UnexpectedException();
}
