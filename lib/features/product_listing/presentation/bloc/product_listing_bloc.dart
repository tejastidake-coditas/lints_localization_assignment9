import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/entity.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/usecases.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/bloc/product_listing_event.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/bloc/product_listing_state.dart';

class ProductListingBloc
    extends Bloc<ProductListingEvent, ProductListingState> {
  final ProductsUseCases productsUseCases;
  List<ProductListingEntity> _allProducts = [];
  String _selectedCategory = 'All'; // ⚡️ Store the selected category


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
        emit(ProductListingError('Error fetching products: ${failure.toString()}'));
      },
          (products) {
        _allProducts = products;
        print('🔥 All products loaded: ${_allProducts.length}');
        emit(ProductListingLoaded(products, 'All'));
      },
    );
  }



  Future<void> _onSearchProducts(
      SearchProductsEvent event,
      Emitter<ProductListingState> emit,
      ) async {
    final query = event.query.trim().toLowerCase();

    if (query.isEmpty) {
      // 🔁 Return to previous category state if query is cleared
      add(FilterByCategory(_selectedCategory));
      return;
    }

    print('🔍 Searching for: $query in $_selectedCategory');

    final filteredProducts = _allProducts.where((product) {
      final title = product.title.toLowerCase();
      final matchesQuery = title.contains(query);

      final matchesCategory = _selectedCategory == 'All' ||
          (product.category.toLowerCase() == _selectedCategory.toLowerCase());

      final shouldInclude = matchesQuery && matchesCategory;
      if (shouldInclude) print('✅ Match: ${product.title}');

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
    _selectedCategory = selectedCategory; // ⚡️ Track selected category

    if (selectedCategory == 'All') {
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
