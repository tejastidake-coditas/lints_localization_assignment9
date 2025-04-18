
import 'package:lints_localization_assignment9/features/product_listing/data/data_source/product_remote_data_source.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/entities/product_listing_entity.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/repo_abstract/product_repo_abstract.dart';

class ProductRepoImpl extends ProductListingRepo {
  final ProductRemoteDataSource remote;

  ProductRepoImpl(this.remote);

  @override
  Future<List<ProductListingEntity>> getProducts() => remote.fetchProducts();

  @override
  Future<List<ProductListingEntity>> searchProducts(String query) =>
      remote.searchProducts(query);
}
