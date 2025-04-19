sealed class ProductDetailsEvent {}

class GetProductDetailsEvent extends ProductDetailsEvent {
  final int id;

  GetProductDetailsEvent(this.id);
}
