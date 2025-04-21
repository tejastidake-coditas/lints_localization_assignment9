import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lints_localization_assignment9/features/product_details/domain/usecases.dart';
import 'package:lints_localization_assignment9/features/product_details/presentation/bloc/product_details_event.dart';
import 'package:lints_localization_assignment9/features/product_details/presentation/bloc/product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  final ProductDetailsUseCases productDetailsUseCases;

  ProductDetailsBloc(this.productDetailsUseCases)
      : super(ProductDetailsInitial()) {
    on<GetProductDetailsEvent>(_onGetProductDetails);
  }

  Future<void> _onGetProductDetails(
    GetProductDetailsEvent event,
    Emitter<ProductDetailsState> emit,
  ) async {
    emit(ProductDetailsLoading());

    final result = await productDetailsUseCases.getProductById(event.id);

    result.fold(
      (failure) => emit(ProductDetailsError(failure.message)),
      (product) => emit(ProductDetailsLoaded(product)),
    );
  }
}
