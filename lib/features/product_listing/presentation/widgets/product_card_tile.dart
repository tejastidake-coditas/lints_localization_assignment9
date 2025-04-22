import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lints_localization_assignment9/core/constants/color_constants.dart';
import 'package:lints_localization_assignment9/core/constants/style_constants.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';
import 'package:lints_localization_assignment9/core/navigation/app_router.gr.dart';
import 'package:lints_localization_assignment9/features/common/presentation/widgets/rating_widget.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/entities/product_listing_entity.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/widgets/favorite_toggle_button.dart';

class ProductCardTile extends StatelessWidget {
  final ProductListingEntity product;

  const ProductCardTile({
    super.key,
    required this.product,
  });

  void _handleTap(BuildContext context, int productId) {
    context.pushRoute(ProductDetailsScreenRoute(productId: productId));
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => _handleTap(context, product.id),
        child: Card(
          elevation: 2,
          color: ColorConstants.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  child: Center(
                    child: SizedBox(
                      height: 120,
                      child: Image.network(
                        product.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Center(
                          child: Icon(Icons.broken_image, size: 48),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  product.title,
                  style: StyleConstants.productCardTileTitle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  product.category,
                  style: StyleConstants.productCardTileCategory,
                ),
                const SizedBox(
                  height: 8,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingWidget(screen: TextConstants.listing),
                    FavoriteToggleButton(),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
