import 'package:lints_localization_assignment9/features/product_listing/domain/entities/product_listing_entity.dart';

class ProductListingModel extends ProductListingEntity {
  const ProductListingModel({
    required super.id,
    required super.title,
    required super.image,
    required super.category,
    required super.rating,
  });

  factory ProductListingModel.fromJson(Map<String, dynamic> json) =>
      ProductListingModel(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        image: json['image'] ?? '',
        category: json['category'] ?? '',
        rating: json['rating'] ?? 4,
      );
}
