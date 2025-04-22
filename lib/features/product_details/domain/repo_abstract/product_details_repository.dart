import 'package:dartz/dartz.dart';
import 'package:lints_localization_assignment9/core/networking/failure_constants.dart';
import 'package:lints_localization_assignment9/features/product_details/domain/entities/product_details_entity.dart';

abstract interface class ProductDetailsRepository {
  Future<Either<Failure, ProductDetailsEntity>> getProductById(int id);
}
