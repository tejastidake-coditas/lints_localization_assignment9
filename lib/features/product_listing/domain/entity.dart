class ProductListingEntity {
  final int id;
  final String title;
  final String image;
  final int price;
  final String description;
  final String brand;
  final String model;
  final String color;
  final String category;
  final int discount;
  final int rating;

  ProductListingEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.brand,
    required this.model,
    required this.color,
    required this.category,
    required this.discount,
    required this.rating,
  });
}
