import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lints_localization_assignment9/core/constants/color_constants.dart';
import 'package:lints_localization_assignment9/core/constants/style_constants.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';
import 'package:lints_localization_assignment9/core/di/injector.dart';
import 'package:lints_localization_assignment9/features/common/presentation/widgets/rating_widget.dart';
import 'package:lints_localization_assignment9/features/product_details/presentation/bloc/product_details_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:lints_localization_assignment9/features/product_details/presentation/bloc/product_details_event.dart';
import 'package:lints_localization_assignment9/features/product_details/presentation/bloc/product_details_state.dart';
import 'package:lints_localization_assignment9/features/product_details/presentation/widgets/increment_decrement_widget.dart';
import 'package:lints_localization_assignment9/features/product_details/presentation/widgets/order_success_dialog.dart';
import 'package:lints_localization_assignment9/features/product_details/presentation/widgets/spicy_slider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class ProductDetailsScreen extends StatelessWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) => BlocProvider<ProductDetailsBloc>(
        create: (_) => injectorInstance<ProductDetailsBloc>()
          ..add(GetProductDetailsEvent(productId)),
        child: Scaffold(
          backgroundColor: ColorConstants.backgroundColor,
          body: BlocBuilder<ProductDetailsBloc, ProductDetailsState>(
            builder: (context, state) {
              if (state is ProductDetailsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProductDetailsError) {
                return Center(child: Text(state.message));
              } else if (state is ProductDetailsLoaded) {
                final product = state.product;
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 38),
                    child: Column(children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: IconButton(
                            onPressed: () {
                              context.router.pop();
                            },
                            icon: Image.asset(
                              TextConstants.leftBlackArrow,
                              width: 28,
                            )),
                        trailing: Image.asset(
                          TextConstants.blackSearch,
                          width: 28,
                        ),
                      ),
                      Image.network(product.image),
                      const SizedBox(
                        height: 50,
                      ),
                      Text(
                        product.title,
                        style: StyleConstants.detailsTitleTextStyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const RatingWidget(screen: TextConstants.detailsText),
                          Text(
                            AppLocalizations.of(context)!.durationText,
                            style: StyleConstants.minsDurationTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(product.description,
                          style: StyleConstants.detailsDescriptionTextStyle),
                      const SizedBox(
                        height: 28,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              spacing: 3,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppLocalizations.of(context)!.spicy,
                                    style: StyleConstants.spicyTextStyle),
                                const SpicySlider(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.hot,
                                      style: StyleConstants.mildHot,
                                    ),
                                    Text(
                                      AppLocalizations.of(context)!.mild,
                                      style: StyleConstants.mildHot,
                                    ),
                                  ],
                                )
                              ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(AppLocalizations.of(context)!.portion,
                                    style: StyleConstants.spicyTextStyle),
                                Row(
                                  children: [
                                    const IncrementDecrementWidget(
                                      icon: Icons.remove,
                                    ),
                                    const SizedBox(width: 15),
                                    Text(
                                      AppLocalizations.of(context)!.number,
                                      style: StyleConstants.bodyText3,
                                    ),
                                    const SizedBox(width: 15),
                                    const IncrementDecrementWidget(
                                      icon: Icons.add,
                                    ),
                                  ],
                                ),
                              ])
                        ],
                      ),
                      const SizedBox(
                        height: 72,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  ColorConstants.successDialogTitle,
                              fixedSize: const Size(112, 64),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 4,
                            ),
                            child: Text(
                              '\$${product.price}',
                              style: StyleConstants.priceTextStyle,
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const OrderSuccessDialog(),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    ColorConstants.detailsButtonColor,
                                fixedSize: const Size(238, 64),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                elevation: 4,
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.orderNow,
                                style: StyleConstants.orderNowStyle,
                              )),
                        ],
                      )
                    ]),
                  ),
                );
              }
              return const Center(
                child: Text(
                  TextConstants.noProductAvailable,
                ),
              );
            },
          ),
        ),
      );
}
