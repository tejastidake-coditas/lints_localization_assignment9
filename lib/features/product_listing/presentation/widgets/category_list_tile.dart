import 'package:flutter/material.dart';
import 'package:lints_localization_assignment9/core/constants/color_constants.dart';

class CategoryListTile extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryListTile({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 0, 18),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            decoration: BoxDecoration(
              color: isSelected
                  ? ColorConstants.slidersButtonBackgroundColor
                  : ColorConstants.unselectedCategoryTileColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: ColorConstants.white.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [],
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    color: isSelected
                        ? ColorConstants.white
                        : ColorConstants.black54,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: 'Inter'),
              ),
            ),
          ),
        ),
      );
}
