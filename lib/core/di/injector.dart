import 'package:get_it/get_it.dart';
import 'package:lints_localization_assignment9/core/networking/network_service.dart';
import 'package:lints_localization_assignment9/features/product_details/data/data_source/product_details_data_source.dart';
import 'package:lints_localization_assignment9/features/product_details/data/repo_impl/product_details_repo_impl.dart';
import 'package:lints_localization_assignment9/features/product_details/domain/repo_abstract/product_details_repository.dart';
import 'package:lints_localization_assignment9/features/product_details/domain/usecases/product_details_usecases.dart';
import 'package:lints_localization_assignment9/features/product_listing/data/data_source/product_listing_data_source.dart';

import 'package:lints_localization_assignment9/features/product_listing/data/repo_impl/product_listing_repo_impl.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/repo_abstract/product_listing_repository.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/usecases/products_listing_usecases.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/bloc/product_listing_bloc.dart';

import 'package:lints_localization_assignment9/features/product_details/presentation/bloc/product_details_bloc.dart';

class Injector {
  static final injectorInstance = GetIt.instance;

  static void init() {
    injectorInstance
        .registerLazySingleton<NetworkService>(() => NetworkService());

    // products data source
    injectorInstance.registerLazySingleton<ProductsListDataSource>(
      () => ProductListDataSourceImplementation(
        injectorInstance<NetworkService>(),
      ),
    );

    // products repository Implementation
    injectorInstance.registerLazySingleton<ProductsListingRepository>(
      () => ProductsListingRepositoryImplementation(
        injectorInstance<ProductsListDataSource>(),
      ),
    );

    // products use case injection
    injectorInstance.registerLazySingleton<ProductsListingUseCases>(
      () => ProductsListingUseCases(
          injectorInstance<ProductsListingRepository>()),
    );

    // product listing bloc
    injectorInstance.registerFactory<ProductListingBloc>(
      () => ProductListingBloc(injectorInstance<ProductsListingUseCases>()),
    );

    // Register ProductDetails DataSource
    injectorInstance.registerLazySingleton<ProductDetailsDataSource>(
      () => ProductDetailsDataSourceImplementation(
        injectorInstance<NetworkService>(),
      ),
    );

    // Register ProductDetails Repository Implementation
    injectorInstance.registerLazySingleton<ProductDetailsRepository>(
      () => ProductDetailsRepositoryImplementation(
        injectorInstance<ProductDetailsDataSource>(),
      ),
    );

    // Register ProductDetails UseCases
    injectorInstance.registerLazySingleton<ProductDetailsUseCases>(
      () => ProductDetailsUseCases(
        injectorInstance<ProductDetailsRepository>(),
      ),
    );

    // Register ProductDetails Bloc
    injectorInstance.registerFactory<ProductDetailsBloc>(
      () => ProductDetailsBloc(injectorInstance<ProductDetailsUseCases>()),
    );
  }
}
