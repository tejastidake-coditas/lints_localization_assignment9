import 'package:equatable/equatable.dart';

class ProductDetailsEntity extends Equatable {
  final int id;
  final String title;
  final String image;
  final int price;
  final String description;
  final String category;
  final int rating;

  const ProductDetailsEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.category,
    required this.rating,
  });

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
        image,
        price,
        description,
        category,
        rating,
      ];
}
