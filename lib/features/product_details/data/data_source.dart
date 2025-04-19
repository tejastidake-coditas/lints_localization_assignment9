import 'package:dartz/dartz.dart';
import 'package:lints_localization_assignment9/core/constants/failure_constants.dart';
import 'package:lints_localization_assignment9/core/enums/method_enum.dart';
import 'package:lints_localization_assignment9/core/networking/network_constants.dart';
import 'package:lints_localization_assignment9/core/networking/network_service.dart';
import 'package:lints_localization_assignment9/features/product_details/data/model.dart';

abstract class ProductDetailsDataSource {
  Future<Either<Failure, ProductDetailsModel>> getProductById(int id);
}

class ProductDetailsDataSourceImplementation
    implements ProductDetailsDataSource {
  final NetworkService networkService;

  ProductDetailsDataSourceImplementation(this.networkService);

  @override
  Future<Either<Failure, ProductDetailsModel>> getProductById(int id) async {
    final result = await networkService.request(
      '${NetworkConstants.productsEndpoint}/$id',
      method: Method.get,
    );

    return result.fold(
          (failure) => Left(failure), // Handle errors here
          (response) {
        final data = response.data['product'];
        final product = ProductDetailsModel.fromJson(data);
        return Right(product); // Return the product if successful
      },
    );
  }
}
