import 'package:lints_localization_assignment9/features/product_details/data/data_source/product_details_remote_data_source.dart';
import 'package:lints_localization_assignment9/features/product_details/domain/entitites/product_details_entity.dart';

import 'package:lints_localization_assignment9/features/product_details/domain/repo_abstract/product_details_repo_abstract.dart';

class ProductDetailsRepoImpl implements ProductDetailsRepoAbstract {
  final ProductDetailsRemoteDataSource remoteDataSource;

  ProductDetailsRepoImpl(this.remoteDataSource);

  @override
  Future<ProductDetailsEntity> getProductDetails(int id) {
    return remoteDataSource.fetchProductDetails(id);
  }
}
