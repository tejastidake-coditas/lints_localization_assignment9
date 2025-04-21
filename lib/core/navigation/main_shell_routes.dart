import 'package:auto_route/auto_route.dart';
import 'package:lints_localization_assignment9/core/navigation/add_product_routes.dart';
import 'package:lints_localization_assignment9/core/navigation/app_router.gr.dart';
import 'package:lints_localization_assignment9/core/navigation/chat_route.dart';
import 'package:lints_localization_assignment9/core/navigation/favorite_route.dart';
import 'package:lints_localization_assignment9/core/navigation/product_routes.dart';
import 'package:lints_localization_assignment9/core/navigation/profile_options_routes.dart';

final AutoRoute mainShellRoute = AutoRoute(
  page: MainShellRoute.page,
  children: [
    productRoute,
    profileOptions,
    addProductRoute,
    chatRoute,
    favoriteRoute,
  ],
);
