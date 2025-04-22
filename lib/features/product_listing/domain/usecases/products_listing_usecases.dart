import 'package:dartz/dartz.dart';
import 'package:lints_localization_assignment9/core/networking/failure_constants.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/entities/product_listing_entity.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/repo_abstract/product_listing_repository.dart';

class ProductsListingUseCases {
  final ProductsListingRepository productsRepository;

  ProductsListingUseCases(this.productsRepository);

  Future<Either<Failure, List<ProductListingEntity>>> getAllProducts() async {
    final response = await productsRepository.getAllProducts();
    return response.fold(
      (failure) => Left(failure),
      (products) => Right(products),
    );
  }
}
