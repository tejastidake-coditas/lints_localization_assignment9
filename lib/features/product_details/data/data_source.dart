import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lints_localization_assignment9/core/constants/failure_constants.dart';
import 'package:lints_localization_assignment9/core/networking/network_constants.dart';
import 'package:lints_localization_assignment9/core/networking/network_service.dart';
import 'package:lints_localization_assignment9/features/product_details/data/model.dart';

abstract interface class ProductDetailsDataSource {
  Future<Either<Failure, ProductDetailsModel>> getProductById(int id);
}

class ProductDetailsDataSourceImplementation
    implements ProductDetailsDataSource {
  final NetworkService networkService;

  ProductDetailsDataSourceImplementation(this.networkService);

  @override
  Future<Either<Failure, ProductDetailsModel>> getProductById(int id) async {
    try {
      final response = await networkService.get(
        '${NetworkConstants.productsEndpoint}/$id',
      );
      final data = response.data['product'];

      final product = ProductDetailsModel.fromJson(data);
      return Right(product);
    } on DioException catch (error) {
      return Left(ServiceFailure(message: error.message.toString()));
    } catch (error) {
      return Left(UnexpectedFailure());
    }
  }
}
