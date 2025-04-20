import 'package:lints_localization_assignment9/features/product_details/domain/entity.dart';

class ProductDetailsModel extends ProductDetailsEntity {
  ProductDetailsModel({
    required super.id,
    required super.title,
    required super.image,
    required super.price,
    required super.description,
    required super.brand,
    required super.model,
    required super.color,
    required super.category,
    required super.discount,
    required super.rating,
  });

  // from json
  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      price: json['price'] ?? 0,
      description: json['description'] ?? '',
      brand: json['brand'] ?? '',
      model: json['model'] ?? '',
      color: json['color'] ?? '',
      category: json['category'] ?? '',
      discount: json['discount'] ?? 0,
      rating: json['rating'] ?? 4,
    );
}
