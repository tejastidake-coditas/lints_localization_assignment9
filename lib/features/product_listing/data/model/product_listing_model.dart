import 'package:lints_localization_assignment9/features/product_listing/domain/entities/product_listing_entity.dart';

class ProductListingModel extends ProductListingEntity {
  ProductListingModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.brand,
    required super.model,
    required super.color,
    required super.category,
    required super.discount,
    required super.image,
  });

  factory ProductListingModel.fromJson(Map<String, dynamic> json) => ProductListingModel(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        price: double.tryParse(json['price'].toString()) ?? 0.0,
        brand: json['brand'] ?? '',
        model: json['model'] ?? '',
        color: json['color'] ?? '',
        category: json['category'] ?? '',
        discount: json['discount'] ?? 0,
        image: json['image'] ?? '',
      );
}
