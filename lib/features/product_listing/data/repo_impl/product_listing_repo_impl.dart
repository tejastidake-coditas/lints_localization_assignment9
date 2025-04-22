import 'package:dartz/dartz.dart';
import 'package:lints_localization_assignment9/core/networking/failure_constants.dart';
import 'package:lints_localization_assignment9/features/product_listing/data/data_source/product_listing_data_source.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/entities/product_listing_entity.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/repo_abstract/product_listing_repository.dart';

class ProductsListingRepositoryImplementation
    implements ProductsListingRepository {
  final ProductsListDataSource productsListDataSource;

  ProductsListingRepositoryImplementation(this.productsListDataSource);

  @override
  Future<Either<Failure, List<ProductListingEntity>>> getAllProducts() =>
      productsListDataSource.getAllProducts();
}
