import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/usecases/get_product_usecase.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/bloc/product_listing_event.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/bloc/product_listing_state.dart';

class ProductListingBloc extends Bloc<ProductListingEvent, ProductListingState> {
  final GetProductsUseCase useCase;

  ProductListingBloc(this.useCase) : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await useCase();
        final fetch50 = products.take(50).toList(); // variable name like products
        emit(ProductLoaded(fetch50, 'All'));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

    on<FilterByCategory>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await useCase();
        if (event.category == 'All') {
          emit(ProductLoaded(products.take(50).toList(), 'All'));
        } else {
          final filtered = products
              .where((p) => p.category.toLowerCase() == event.category.toLowerCase())
              .take(50)
              .toList();
          emit(ProductLoaded(filtered, event.category));
        }
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });

    on<SearchProduct>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await useCase();
        final filtered = products
            .where((p) => p.title.toLowerCase().contains(event.query.toLowerCase()))
            .toList();

        emit(ProductLoaded(filtered, 'Search'));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
