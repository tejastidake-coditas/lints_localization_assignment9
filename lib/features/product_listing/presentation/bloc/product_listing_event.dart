import 'package:equatable/equatable.dart';

abstract class ProductListingEvent extends Equatable { // use sealed
  const ProductListingEvent();

  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductListingEvent {}

class FilterByCategory extends ProductListingEvent {
  final String category;

  const FilterByCategory(this.category);

  @override
  List<Object> get props => [category];
}


class SearchProduct extends ProductListingEvent {
  final String query;

  const SearchProduct(this.query);
}
