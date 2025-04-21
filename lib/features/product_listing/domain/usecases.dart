import 'package:dartz/dartz.dart';
import 'package:lints_localization_assignment9/core/constants/failure_constants.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/entity.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/repository.dart';

class ProductsUseCases {
  final ProductsRepository productsRepository;

  ProductsUseCases(this.productsRepository);

  Future<Either<Failure, List<ProductListingEntity>>> getAllProducts() async {
    final response = await productsRepository.getAllProducts();
    return response.fold(
      (failure) => Left(failure),
      (products) => Right(products),
    );
  }
}
