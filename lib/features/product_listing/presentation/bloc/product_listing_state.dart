import 'package:equatable/equatable.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/entities/product_listing_entity.dart';

abstract class ProductListingState extends Equatable {
  const ProductListingState();

  @override
  List<Object?> get props => [];
}

class ProductInitial extends ProductListingState {}

class ProductLoading extends ProductListingState {}

class ProductLoaded extends ProductListingState {
  final List<ProductListingEntity> products;
  final String selectedCategory;

  const ProductLoaded(this.products, this.selectedCategory);

  @override
  List<Object?> get props => [products, selectedCategory];
}

class ProductError extends ProductListingState {
  final String message;

  const ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
