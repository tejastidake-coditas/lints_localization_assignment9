import 'package:get_it/get_it.dart';
import 'package:lints_localization_assignment9/core/networking/network_service.dart';
import 'package:lints_localization_assignment9/features/product_details/data/data_source.dart';
import 'package:lints_localization_assignment9/features/product_details/data/repository.dart';
import 'package:lints_localization_assignment9/features/product_details/domain/repository.dart';
import 'package:lints_localization_assignment9/features/product_details/domain/usecases.dart';
import 'package:lints_localization_assignment9/features/product_listing/data/data_source.dart';

import 'package:lints_localization_assignment9/features/product_listing/data/repository.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/repository.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/usecases.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/bloc/product_listing_bloc.dart';

import 'package:lints_localization_assignment9/features/product_details/presentation/bloc/product_details_bloc.dart';

final injectorInstance = GetIt.instance;

abstract class Injector {
  static void init() {
    injectorInstance
        .registerLazySingleton<NetworkService>(() => NetworkService());

    // injectorInstance.registerLazySingleton<AppRouter>(() => AppRouter());

    // products data source
    injectorInstance.registerLazySingleton<ProductsListDataSource>(
      () => ProductListDataSourceImplementation(
        injectorInstance<NetworkService>(),
      ),
    );

    // products repository Implementation
    injectorInstance.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImplementation(
        injectorInstance<ProductsListDataSource>(),
      ),
    );

    // products use case injection
    injectorInstance.registerLazySingleton<ProductsUseCases>(
      () => ProductsUseCases(injectorInstance<ProductsRepository>()),
    );

    // product listing bloc
    injectorInstance.registerFactory<ProductListingBloc>(
      () => ProductListingBloc(injectorInstance<ProductsUseCases>()),
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
