import 'package:flutter/material.dart';
import 'package:lints_localization_assignment9/core/constants/color_constants.dart';
import 'package:lints_localization_assignment9/core/constants/style_constants.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';
import 'package:lints_localization_assignment9/features/common/presentation/widgets/rating_widget.dart';
import 'package:lints_localization_assignment9/features/product_details/presentation/screens/product_details_screen.dart';
import 'package:lints_localization_assignment9/features/product_listing/domain/entity.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/widgets/favorite_toggle_button.dart';

class ProductCardTile extends StatelessWidget {
  final ProductListingEntity product;

  const ProductCardTile({
    super.key,
    required this.product,
  });

  void _handleTap(BuildContext context) {

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ProductDetailsScreen(
          productId: product.id,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handleTap(context),
      child: Card(
        elevation: 2,
        color: ColorConstants.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  child: Center(
                child: Image.network(
                  fit: BoxFit.cover,
                  height: 120,
                  product.image,
                  errorBuilder: (context, error, stackTrace) =>
                      TextConstants.brokenIcon,
                ),
              )),
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
              Row(
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
}
