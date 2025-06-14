import 'package:lints_localization_assignment9/features/product_details/domain/entities/product_details_entity.dart';

class ProductDetailsModel extends ProductDetailsEntity {
  const ProductDetailsModel({
    required super.id,
    required super.title,
    required super.image,
    required super.price,
    required super.description,
    required super.category,
    required super.rating,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        image: json['image'] ?? '',
        price: json['price'] ?? 0,
        description: json['description'] ?? '',
        category: json['category'] ?? '',
        rating: json['rating'] ?? 4,
      );
}
