import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/entities/product_listing_entity.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/usecases/products_listing_usecases.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/bloc/product_listing_event.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/bloc/product_listing_state.dart';

class ProductListingBloc
    extends Bloc<ProductListingEvent, ProductListingState> {
  final ProductsListingUseCases productsUseCases;
  List<ProductListingEntity> _allProducts = [];
  String _selectedCategory = TextConstants.all;

  ProductListingBloc(this.productsUseCases) : super(ProductListingInitial()) {
    on<GetAllProductsEvent>(_onGetAllProducts);
    on<SearchProductsEvent>(_onSearchProducts);
    on<FilterByCategory>(_onFilterByCategory);
  }

  void _onGetAllProducts(
    GetAllProductsEvent event,
    Emitter<ProductListingState> emit,
  ) async {
    emit(ProductListingLoading());
    final result = await productsUseCases.getAllProducts();

    result.fold(
      (failure) {
        emit(ProductListingError(
            '${TextConstants.errorFetchingProducts} ${failure.toString()}'));
      },
      (products) {
        _allProducts = products;
        emit(ProductListingLoaded(products, TextConstants.all));
      },
    );
  }

  Future<void> _onSearchProducts(
    SearchProductsEvent event,
    Emitter<ProductListingState> emit,
  ) async {
    final query = event.query.trim().toLowerCase();

    if (query.isEmpty) {
      add(FilterByCategory(_selectedCategory));
      return;
    }

    final filteredProducts = _allProducts.where((product) {
      final title = product.title.toLowerCase();
      final matchesQuery = title.contains(query);

      final matchesCategory = _selectedCategory == TextConstants.all ||
          (product.category.toLowerCase() == _selectedCategory.toLowerCase());

      final shouldInclude = matchesQuery && matchesCategory;

      return shouldInclude;
    }).toList();

    emit(ProductListingLoaded(filteredProducts, _selectedCategory));
  }

  Future<void> _onFilterByCategory(
    FilterByCategory event,
    Emitter<ProductListingState> emit,
  ) async {
    emit(ProductListingLoading());

    final selectedCategory = event.category;
    _selectedCategory = selectedCategory;

    if (selectedCategory == TextConstants.all) {
      emit(ProductListingLoaded(_allProducts, selectedCategory));
      return;
    }

    final filtered = _allProducts
        .where(
          (product) =>
              (product.category).toLowerCase() ==
              selectedCategory.toLowerCase(),
        )
        .toList();

    emit(ProductListingLoaded(filtered, selectedCategory));
  }
}
