import 'package:dartz/dartz.dart';
import 'package:lints_localization_assignment9/core/constants/failure_constants.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/entity.dart';

abstract interface class ProductsRepository {
  Future<Either<Failure, List<ProductListingEntity>>> getAllProducts();
}
