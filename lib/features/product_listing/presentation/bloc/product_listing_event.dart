sealed class ProductListingEvent {}

class GetAllProductsEvent extends ProductListingEvent {}

class FilterByCategory extends ProductListingEvent {
  final String category;

  FilterByCategory(this.category);

  List<Object> get props => [category];
}

class SearchProductsEvent extends ProductListingEvent {
  final String query;

  SearchProductsEvent(this.query);

  @override
  List<Object?> get props => [query];
}

