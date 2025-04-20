import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lints_localization_assignment9/core/constants/failure_constants.dart';
import 'package:lints_localization_assignment9/core/enums/method_enum.dart';
import 'package:lints_localization_assignment9/core/networking/network_constants.dart';
import 'package:lints_localization_assignment9/core/networking/network_service.dart';
import 'package:lints_localization_assignment9/features/product_listing/data/model.dart';

abstract interface class ProductsListDataSource {
  Future<Either<Failure, List<ProductListingModel>>> getAllProducts();
}

class ProductListDataSourceImplementation implements ProductsListDataSource {
  final NetworkService networkService;
  ProductListDataSourceImplementation(this.networkService);

  @override
  Future<Either<Failure, List<ProductListingModel>>> getAllProducts() async {
    try {
      // Using the new 'request' method instead of 'get'
      final result = await networkService.request(
        NetworkConstants.productsEndpoint,
        method: Method.get,
      );

      return result.fold(
            (failure) => Left(failure), // In case of an error, return failure
            (response) {
          // Ensure the response.data is a Map or List
          if (response.data is Map<String, dynamic>) {
            final List data = response.data['products'] ?? [];
            final products = data
                .map((product) => ProductListingModel.fromJson(product))
                .toList();
            return Right(products);
          } else {
            return Left(ServiceFailure(message: 'Invalid response format.'));
          }
        },
      );
    } on DioException catch (error) {
      return Left(ServiceFailure(message: error.message.toString()));
    } catch (error) {
      return Left(UnexpectedFailure());
    }
  }
}
