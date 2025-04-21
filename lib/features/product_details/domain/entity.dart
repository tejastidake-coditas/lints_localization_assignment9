class ProductDetailsEntity {
  final int id;
  final String title;
  final String image;
  final int price;
  final String description;
  final String category;
  final int rating;

  ProductDetailsEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.category,
    required this.rating,
  });
}
