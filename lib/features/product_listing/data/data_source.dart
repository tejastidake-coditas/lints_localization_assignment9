import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:lints_localization_assignment9/core/constants/failure_constants.dart';
import 'package:lints_localization_assignment9/core/networking/network_constants.dart';
import 'package:lints_localization_assignment9/core/networking/network_service.dart';
import 'package:lints_localization_assignment9/features/product_listing/data/model.dart';

abstract interface class ProductsListDataSource {
  Future<Either<Failure, List<ProductListingModel>>> getAllProducts();

  // Future<Either<Failure, List<ProductListingModel>>> searchProducts(String query);
}

class ProductListDataSourceImplementation implements ProductsListDataSource {
  final NetworkService networkService;
  ProductListDataSourceImplementation(this.networkService);
  @override
  Future<Either<Failure, List<ProductListingModel>>> getAllProducts() async {
    try {
      final response = await networkService.get(
        NetworkConstants.productsEndpoint,
      );
      final List data = response.data['products'];

      final products =
          data.map((product) => ProductListingModel.fromJson(product)).toList();
      return Right(products);
    } on DioException catch (error) {
      return Left(ServiceFailure(message: error.message.toString()));
    } catch (error) {
      return Left(UnexpectedFailure());
    }
  }

  //
  // @override
  // Future<Either<Failure, List<ProductListingModel>>> searchProducts(String query) async {
  //   try {
  //     final response = await networkService.get(
  //       '${NetworkConstants.productsEndpoint}?search=$query', // Example search query
  //     );
  //     final List data = response.data['products'];
  //
  //     final products =
  //     data.map((product) => ProductListingModel.fromJson(product)).toList();
  //     return Right(products);
  //   } on DioException catch (error) {
  //     return Left(ServiceFailure(message: error.message.toString()));
  //   } catch (error) {
  //     return Left(UnexpectedFailure());
  //   }
  // }

}
