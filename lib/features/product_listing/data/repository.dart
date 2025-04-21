import 'package:dartz/dartz.dart';
import 'package:lints_localization_assignment9/core/constants/failure_constants.dart';
import 'package:lints_localization_assignment9/features/product_listing/data/data_source.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/entity.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/repository.dart';

class ProductsRepositoryImplementation implements ProductsRepository {
  final ProductsListDataSource productsListDataSource;

  ProductsRepositoryImplementation(this.productsListDataSource);

  @override
  Future<Either<Failure, List<ProductListingEntity>>> getAllProducts() async {
    final response = await productsListDataSource.getAllProducts();

    return response.fold(
      (failure) => Left(failure),
      (products) => Right(products),
    );
  }
}
