import 'package:dartz/dartz.dart';
import 'package:lints_localization_assignment9/core/networking/failure_constants.dart';
import 'package:lints_localization_assignment9/features/product_details/domain/entities/product_details_entity.dart';
import 'package:lints_localization_assignment9/features/product_details/domain/repo_abstract/product_details_repository.dart';

import 'package:lints_localization_assignment9/features/product_details/data/data_source/product_details_data_source.dart';

class ProductDetailsRepositoryImplementation
    implements ProductDetailsRepository {
  final ProductDetailsDataSource productDetailsDataSource;

  ProductDetailsRepositoryImplementation(this.productDetailsDataSource);

  @override
  Future<Either<Failure, ProductDetailsEntity>> getProductById(int id) =>
      productDetailsDataSource.getProductById(id);
}
