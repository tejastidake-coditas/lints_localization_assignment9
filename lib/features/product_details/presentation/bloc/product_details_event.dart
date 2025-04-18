abstract class ProductDetailsEvent {}

class FetchProductDetails extends ProductDetailsEvent {
  final int id;

  FetchProductDetails(this.id);
}
