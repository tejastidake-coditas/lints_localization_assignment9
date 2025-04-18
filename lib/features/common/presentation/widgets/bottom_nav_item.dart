import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lints_localization_assignment9/core/constants/color_constants.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';

class BottomNavItem extends StatelessWidget {
  BottomNavItem({
    super.key,
    required this.tabsRouter,
    required this.index,
  });

  final TabsRouter tabsRouter;
  final int index;

  final icons = [
    TextConstants.homeIcon,
    TextConstants.profileIcon,
    '',
    TextConstants.chatIcon,
    TextConstants.wishlistIcon,
  ];

  @override
  Widget build(BuildContext context) {
    final isSelected = tabsRouter.activeIndex == index;

    return GestureDetector(
      onTap: () => tabsRouter.setActiveIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            icons[index],
            height: 22,
          ),
          const SizedBox(height: 8),
          if (isSelected)
            Container(
              width: 4,
              height: 4,
              decoration: const BoxDecoration(
                color: ColorConstants.white,
                shape: BoxShape.circle,
              ),
            )
          else
            const SizedBox(height: 8),
        ],
      ),
    );
  }
}
