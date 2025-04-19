import 'package:equatable/equatable.dart';
import 'package:lints_localization_assignment9/features/product_details/domain/entity.dart';

sealed class ProductDetailsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductDetailsInitial extends ProductDetailsState {}

class ProductDetailsLoading extends ProductDetailsState {}

class ProductDetailsLoaded extends ProductDetailsState {
  final ProductDetailsEntity product;

  ProductDetailsLoaded(this.product);

  @override
  List<Object?> get props => [product];
}

class ProductDetailsError extends ProductDetailsState {
  final String message;

  ProductDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}
