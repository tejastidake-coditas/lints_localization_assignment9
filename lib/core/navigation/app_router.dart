import 'package:auto_route/auto_route.dart';
import 'package:lints_localization_assignment9/core/navigation/app_router.gr.dart';
import 'package:lints_localization_assignment9/core/navigation/product_details_routes.dart';
import 'package:lints_localization_assignment9/core/navigation/product_routes.dart';
import 'package:lints_localization_assignment9/core/navigation/profile_details_routes.dart';
import 'package:lints_localization_assignment9/core/navigation/profile_options_routes.dart';
import 'main_shell_routes.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashScreenRoute.page,
          initial: true,
        ),
        mainShellRoute,
        productRoute,
        profileDetails,
        profileOptions,
        productDetails,
      ];
}
