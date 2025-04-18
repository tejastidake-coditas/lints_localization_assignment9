class ProductListingEntity { // use equitable
  final int id;
  final String title;
  final String description;
  final double price;
  final String brand;
  final String model;
  final String color;
  final String category;
  final num discount;
  final String image;

  ProductListingEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.brand,
    required this.model,
    required this.color,
    required this.category,
    required this.discount,
    required this.image,
  });
}
