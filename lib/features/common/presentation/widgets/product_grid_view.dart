import 'package:flutter/material.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/entity.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/widgets/product_card_tile.dart';

class ProductGridView extends StatelessWidget {
  final List<ProductListingEntity> products;
  final Map<int, int>? quantityMap;

  const ProductGridView({
    super.key,
    required this.products,
    this.quantityMap,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const Center(
        child: Text(
          TextConstants.noProductsText,
        ),
      );
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 22,
        mainAxisExtent: 226,
        crossAxisSpacing: 18,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCardTile(product: product);
      },
    );
  }
}
