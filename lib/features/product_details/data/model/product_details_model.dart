import 'package:lints_localization_assignment9/features/product_details/domain/entitites/product_details_entity.dart';

class ProductDetailsModel extends ProductDetailsEntity {
  ProductDetailsModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.image,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        id: json['id'] ?? '',
        title: json['title'] ?? '',
        description: json['description'] ?? '',
        price: double.tryParse(json['price'].toString()) ?? 0.0,
        image: json['image'] ?? '',
      );
}
