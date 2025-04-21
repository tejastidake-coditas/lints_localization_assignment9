import 'package:equatable/equatable.dart';

class ProductListingEntity extends Equatable {
  final int id;
  final String title;
  final String image;
  final String category;
  final int rating;

  const ProductListingEntity({
    required this.id,
    required this.title,
    required this.image,
    required this.category,
    required this.rating,
  });

  @override
  List<Object?> get props => <Object?>[
        id,
        title,
        image,
        category,
        rating,
      ];
}
