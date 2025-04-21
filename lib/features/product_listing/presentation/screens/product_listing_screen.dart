import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lints_localization_assignment9/core/constants/color_constants.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';
import 'package:lints_localization_assignment9/core/di/injector.dart';
import 'package:lints_localization_assignment9/features/common/presentation/widgets/product_grid_view.dart';
import 'package:lints_localization_assignment9/features/common/presentation/widgets/product_search_bar.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/bloc/product_listing_bloc.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/bloc/product_listing_event.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/bloc/product_listing_state.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/widgets/category_list_tile.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/widgets/home_app_bar_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class ProductListScreen extends StatelessWidget {
  ProductListScreen({super.key});

  // final List<String> categories = ['All', 'Audio', 'Gaming', 'Mobile', 'Tv'];
  final TextEditingController _searchController = TextEditingController(); // 👈 ADD THIS

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    final List<String> categories = [
      local.all,
      local.audio,
      local.gaming,
      local.mobile,
      local.tv,
    ];

    return BlocProvider<ProductListingBloc>(
      create: (_) =>
      injectorInstance<ProductListingBloc>()
        ..add(GetAllProductsEvent()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorConstants.backgroundColor,
          appBar: const HomeAppBarWidget(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 46, 0, 36),
                  child: Row(
                    children: [
                      Expanded(
                        child: ProductSearchBar(
                          controller: _searchController, // 👈 PASS IT
                          onChanged: (query) =>
                              context
                                  .read<ProductListingBloc>()
                                  .add(SearchProductsEvent(query.trim())),
                        ),
                      ),
                      const SizedBox(width: 14),
                      IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor:
                          ColorConstants.slidersButtonBackgroundColor,
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
                          // TODO: Navigate to another screen
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 68,
                  child: BlocBuilder<ProductListingBloc, ProductListingState>(
                    builder: (context, state) =>
                        ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          separatorBuilder: (_, __) => const SizedBox(width: 6),
                          itemBuilder: (context, index) {
                            final isSelected = state is ProductListingLoaded &&
                                state.selectedCategory.toLowerCase() ==
                                    categories[index].toLowerCase();

                            return CategoryListTile(
                              title: categories[index],
                              isSelected: isSelected,
                              onTap: () {
                                _searchController.clear(); // 👈 CLEAR THE TEXT

                                FocusScope.of(context).unfocus();
                                context.read<ProductListingBloc>().add(
                                    FilterByCategory(categories[index]));
                              },
                            );
                          },
                        ),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: BlocBuilder<ProductListingBloc, ProductListingState>(
                    builder: (context, state) {
                      if (state is ProductListingLoading) {
                        return const Center(
                            child: CircularProgressIndicator());
                      } else if (state is ProductListingLoaded) {
                        if (state.products.isEmpty) {
                          return const Center(
                              child: Text(TextConstants.noProductsText));
                        }
                        return ProductGridView(products: state.products);
                      } else if (state is ProductListingError) {
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
      ),
    );
  }
}