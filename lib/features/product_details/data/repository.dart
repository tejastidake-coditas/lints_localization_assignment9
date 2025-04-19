import 'package:dartz/dartz.dart';
import 'package:lints_localization_assignment9/core/constants/failure_constants.dart';
import 'package:lints_localization_assignment9/features/product_details/domain/entity.dart';
import 'package:lints_localization_assignment9/features/product_details/domain/repository.dart';

import 'data_source.dart';

class ProductDetailsRepositoryImplementation
    implements ProductDetailsRepository {
  final ProductDetailsDataSource productDetailsDataSource;

  ProductDetailsRepositoryImplementation(this.productDetailsDataSource);

  @override
  Future<Either<Failure, ProductDetailsEntity>> getProductById(int id) async {
    final response = await productDetailsDataSource.getProductById(id);
    return response.fold(
      (failure) => Left(failure),
      (productModel) => Right(productModel),
    );
  }
}
