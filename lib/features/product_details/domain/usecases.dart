import 'package:dartz/dartz.dart';
import 'package:lints_localization_assignment9/core/constants/failure_constants.dart';
import 'package:lints_localization_assignment9/features/product_details/domain/repository.dart';

import 'entity.dart';

class ProductDetailsUseCases {
  final ProductDetailsRepository productDetailsRepository;

  ProductDetailsUseCases(this.productDetailsRepository);

  Future<Either<Failure, ProductDetailsEntity>> getProductById(int id) async {
    final response = await productDetailsRepository.getProductById(id);

    return response.fold(
      (failure) => Left(failure),
      (products) => Right(products),
    );
  }
}
