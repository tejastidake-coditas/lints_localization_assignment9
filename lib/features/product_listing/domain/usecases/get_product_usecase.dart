
import 'package:lints_localization_assignment9/features/product_listing/domain/entities/product_listing_entity.dart';

import 'package:lints_localization_assignment9/features/product_listing/domain/repo_abstract/product_repo_abstract.dart';

class GetProductsUseCase {
  final ProductListingRepo repo;

  GetProductsUseCase(this.repo);

  Future<List<ProductListingEntity>> call({String? query}) { // don't use call here
    if (query != null && query.isNotEmpty) {
      return repo.searchProducts(query);
    } else {
      return repo.getProducts();
    }
  }
}
