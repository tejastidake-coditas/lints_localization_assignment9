import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:lints_localization_assignment9/core/networking/network.dart';
import 'package:lints_localization_assignment9/core/navigation/app_router.dart';

import 'package:lints_localization_assignment9/features/product_listing/data/data_source/product_remote_data_source.dart';
import 'package:lints_localization_assignment9/features/product_listing/data/repositories/product_listing_repository.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/repo_abstract/product_repo_abstract.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/usecases/get_product_usecase.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/bloc/product_listing_bloc.dart';

import 'package:lints_localization_assignment9/features/product_details/data/data_source/product_details_remote_data_source.dart';
import 'package:lints_localization_assignment9/features/product_details/data/repositories/product_details_repository_impl.dart';
import 'package:lints_localization_assignment9/features/product_details/domain/repo_abstract/product_details_repo_abstract.dart';
import 'package:lints_localization_assignment9/features/product_details/domain/usecases/get_product_usecase.dart';
import 'package:lints_localization_assignment9/features/product_details/presentation/bloc/product_details_bloc.dart';

final sl = GetIt.instance; // todo: make class

Future<void> setupLocator() async {

  sl.registerLazySingleton<Dio>(() => Network.createDio());
  sl.registerLazySingleton<AppRouter>(() => AppRouter());

  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSource());
  sl.registerLazySingleton<ProductListingRepo>(() => ProductRepoImpl(sl()));
  sl.registerLazySingleton<GetProductsUseCase>(() => GetProductsUseCase(sl()));
  sl.registerFactory<ProductListingBloc>(() => ProductListingBloc(sl()));

  sl.registerLazySingleton<ProductDetailsRemoteDataSource>(
      () => ProductDetailsRemoteDataSource(sl()));

  sl.registerLazySingleton<ProductDetailsRepoAbstract>(
      () => ProductDetailsRepoImpl(sl()));

  sl.registerFactory<GetProductUseCase>(() => GetProductUseCase(sl()));
  sl.registerFactory<ProductDetailsBloc>(() => ProductDetailsBloc(sl()));
}
