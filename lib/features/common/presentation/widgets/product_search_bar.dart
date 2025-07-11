import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lints_localization_assignment9/core/constants/color_constants.dart';
import 'package:lints_localization_assignment9/core/constants/style_constants.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';
import 'dart:async';
import 'package:lints_localization_assignment9/features/product_listing/presentation/bloc/product_listing_bloc.dart';
import 'package:lints_localization_assignment9/features/product_listing/presentation/bloc/product_listing_event.dart';

@RoutePage()
class ProductSearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const ProductSearchBar(
      {super.key, required this.onChanged, required this.controller});

  @override
  State<ProductSearchBar> createState() => _ProductSearchBarState();
}

class _ProductSearchBarState extends State<ProductSearchBar> {
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () {
      if (query.length >= 2) {
        context
            .read<ProductListingBloc>()
            .add(SearchProductsEvent(query.trim()));
      } else if (query.isEmpty) {
        context.read<ProductListingBloc>().add(SearchProductsEvent(''));
      }
    });
  }

  @override
  Widget build(BuildContext context) => Card(
        color: ColorConstants.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.zero,
        child: TextField(
          controller: widget.controller,
          style: StyleConstants.searchHintStyle,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.searchBarHintText,
            hintStyle: StyleConstants.searchHintStyle,
            contentPadding: const EdgeInsets.symmetric(vertical: 18),
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: SvgPicture.asset(
                TextConstants.searchIcon,
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
            ),
            prefixIconConstraints:
                const BoxConstraints(minWidth: 40, minHeight: 40),
          ),
          onChanged: _onSearchChanged,
        ),
      );
}
