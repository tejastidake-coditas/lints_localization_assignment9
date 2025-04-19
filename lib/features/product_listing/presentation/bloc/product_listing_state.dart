import 'package:equatable/equatable.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/entity.dart';

sealed class ProductListingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductListingInitial extends ProductListingState {}

class ProductListingLoading extends ProductListingState {}

class ProductListingLoaded extends ProductListingState {
  final List<ProductListingEntity> products;

  final String selectedCategory;

  ProductListingLoaded(this.products, this.selectedCategory);

  @override
  List<Object?> get props => [products, selectedCategory];
}

class ProductListingError extends ProductListingState {
  final String message;

  ProductListingError(this.message);

  @override
  List<Object?> get props => [message];
}
