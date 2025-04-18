import 'package:lints_localization_assignment9/features/product_details/domain/entitites/product_details_entity.dart';
import 'package:lints_localization_assignment9/features/product_details/domain/repo_abstract/product_details_repo_abstract.dart';

class GetProductUseCase {
  final ProductDetailsRepoAbstract repo;

  GetProductUseCase(this.repo);

  Future<ProductDetailsEntity> call(int id) {
    return repo.getProductDetails(id);
  }
}
