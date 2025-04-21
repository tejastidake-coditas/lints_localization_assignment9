import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lints_localization_assignment9/core/constants/color_constants.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';
import 'package:lints_localization_assignment9/core/navigation/app_router.gr.dart';
import 'package:lints_localization_assignment9/features/common/presentation/widgets/bottom_nav_item.dart';

@RoutePage()
class MainShell extends StatelessWidget {
  const MainShell({super.key});

  @override
  Widget build(BuildContext context) => AutoTabsScaffold(
        routes: [
          ProductListScreenRoute(),
          const ProfileOptionsRoute(),
          const AddProductScreenRoute(),
          const ChatScreenRoute(),
          const FavoriteScreenRoute(),
        ],
        floatingActionButton: Builder(
          builder: (context) {
            final tabsRouter = AutoTabsRouter.of(context);
            return FloatingActionButton(
              onPressed: () => tabsRouter.setActiveIndex(2),
              backgroundColor: ColorConstants.slidersButtonBackgroundColor,
              elevation: 6,
              shape: const CircleBorder(),
              child: Image.asset(TextConstants.addIcon),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBuilder: (_, tabsRouter) => BottomAppBar(
          color: ColorConstants.slidersButtonBackgroundColor,
          shape: const CircularNotchedRectangle(),
          notchMargin: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomNavItem(tabsRouter: tabsRouter, index: 0),
              BottomNavItem(tabsRouter: tabsRouter, index: 1),
              const SizedBox.shrink(),
              BottomNavItem(tabsRouter: tabsRouter, index: 3),
              BottomNavItem(tabsRouter: tabsRouter, index: 4),
            ],
          ),
        ),
      );
}
