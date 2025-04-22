import 'package:dartz/dartz.dart';
import 'package:lints_localization_assignment9/core/networking/failure_constants.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/entities/product_listing_entity.dart';

abstract interface class ProductsListingRepository {
  Future<Either<Failure, List<ProductListingEntity>>> getAllProducts();
}
