import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lints_localization_assignment9/core/constants/color_constants.dart';
import 'package:lints_localization_assignment9/core/constants/style_constants.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';

@RoutePage()
class ProductSearchBar extends StatefulWidget {
  final ValueChanged<String> onChanged;

  const ProductSearchBar({super.key, required this.onChanged});

  @override
  State<ProductSearchBar> createState() => _ProductSearchBarState();
}

class _ProductSearchBarState extends State<ProductSearchBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      widget.onChanged(_controller.text.trim());
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _controller.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _controller,
      builder: (context, value, _) {
        return Card(
          color: ColorConstants.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: EdgeInsets.zero,
          child: TextField(
            controller: _controller,
            style: StyleConstants.searchHintStyle,
            decoration: InputDecoration(
              hintText: TextConstants.searchBarHintText,
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
              prefixIconConstraints: const BoxConstraints(minWidth: 40, minHeight: 40),
              suffixIcon: value.text.isNotEmpty
                  ? IconButton(
                      icon: TextConstants.closeIcon,
                      onPressed: _clearSearch,
                    )
                  : null,
            ),
          ),
        );
      },
    );
  }
}