import 'package:auto_route/auto_route.dart';
import 'package:lints_localization_assignment9/core/navigation/app_router.gr.dart';

final AutoRoute profileRoute =
    AutoRoute(page: ProfileOptionsRoute.page, path: 'profile', children: [
  AutoRoute(page: ProfileDetailsRoute.page, path: 'details'),
]);
