import 'package:lints_localization_assignment9/features/product_listing/presentation/widgets/category_list_tile.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lints_localization_assignment9/core/constants/color_constants.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';
import 'package:lints_localization_assignment9/features/common/presentation/widgets/product_grid_view.dart';
import 'package:lints_localization_assignment9/features/common/presentation/widgets/product_search_bar.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/bloc/product_listing_bloc.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/bloc/product_listing_event.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/bloc/product_listing_state.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/widgets/home_app_bar_widget.dart';

@RoutePage()
class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  final List<String> categories = ['All', 'Combos', 'Sliders', 'Classics'];

  void _handleSearch(BuildContext context, String query) {
    context.read<ProductListingBloc>().add(SearchProduct(query.trim()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.backgroundColor,
        appBar: HomeAppBarWidget(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 46, 0, 36), // don't use from LTRB like only
                child: Row(
                  children: [
                    Expanded(
                      child: ProductSearchBar(
                        onChanged: (query) => _handleSearch(context, query),
                      ),
                    ),
                    const SizedBox(width: 14),
                    IconButton(
                      style: IconButton.styleFrom(
                        backgroundColor: ColorConstants
                            .slidersButtonBackgroundColor,
                        fixedSize: const Size(54, 54),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      icon: SvgPicture.asset(
                        TextConstants.settingsSliders,
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
                      onPressed: () {
                        // Navigate to another screen
                      },
                    ),
                  ],
                ),
              ),
      
              // const SizedBox(height: 16),
              SizedBox(
                height: 68, // intrinsic height
                child: BlocBuilder<ProductListingBloc, ProductListingState>(
                  builder: (context, state) {
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 6),
                      itemBuilder: (context, index) {
                        final isSelected = state is ProductLoaded &&
                            state.selectedCategory.toLowerCase() ==
                                categories[index].toLowerCase();
                    
                        return CategoryListTile(
                          title: categories[index],
                          isSelected: isSelected,
                          onTap: () {
                            context.read<ProductListingBloc>().add(
                              FilterByCategory(categories[index]),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
      
      
              const SizedBox(height: 16),
      
              Expanded(
                child: BlocBuilder<ProductListingBloc, ProductListingState>(
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ProductLoaded) {
                      if (state.products.isEmpty) {
                        return const Center(
                            child: Text(TextConstants.noProductsText));
                      }
                      return ProductGridView(products: state.products);
                    } else if (state is ProductError) {
                      return Center(child: Text(state.message));
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
