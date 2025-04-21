// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:lints_localization_assignment9/features/add_product/presentation/screens/add_product_screen.dart'
    as _i1;
import 'package:lints_localization_assignment9/features/chat/presentation/screens/chat_screen.dart'
    as _i2;
import 'package:lints_localization_assignment9/features/common/presentation/widgets/main_shell.dart'
    as _i5;
import 'package:lints_localization_assignment9/features/common/presentation/widgets/product_search_bar.dart'
    as _i8;
import 'package:lints_localization_assignment9/features/favorite/presentation/screens/favorite_screen.dart'
    as _i3;
import 'package:lints_localization_assignment9/features/product_details/presentation/screens/product_details_screen.dart'
    as _i6;
import 'package:lints_localization_assignment9/features/product_listing/presentation/screens/product_listing_screen.dart'
    as _i7;
import 'package:lints_localization_assignment9/features/product_listing/presentation/widgets/home_app_bar_widget.dart'
    as _i4;
import 'package:lints_localization_assignment9/features/profile/presentation/screens/profile_details.dart'
    as _i9;
import 'package:lints_localization_assignment9/features/profile/presentation/screens/profile_options.dart'
    as _i10;
import 'package:lints_localization_assignment9/features/splash/presentation/screens/splash_screen.dart'
    as _i11;

/// generated route for
/// [_i1.AddProductScreen]
class AddProductScreenRoute extends _i12.PageRouteInfo<void> {
  const AddProductScreenRoute({List<_i12.PageRouteInfo>? children})
    : super(AddProductScreenRoute.name, initialChildren: children);

  static const String name = 'AddProductScreenRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddProductScreen();
    },
  );
}

/// generated route for
/// [_i2.ChatScreen]
class ChatScreenRoute extends _i12.PageRouteInfo<void> {
  const ChatScreenRoute({List<_i12.PageRouteInfo>? children})
    : super(ChatScreenRoute.name, initialChildren: children);

  static const String name = 'ChatScreenRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i2.ChatScreen();
    },
  );
}

/// generated route for
/// [_i3.FavoriteScreen]
class FavoriteScreenRoute extends _i12.PageRouteInfo<void> {
  const FavoriteScreenRoute({List<_i12.PageRouteInfo>? children})
    : super(FavoriteScreenRoute.name, initialChildren: children);

  static const String name = 'FavoriteScreenRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i3.FavoriteScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeAppBarWidget]
class HomeAppBarWidgetRoute extends _i12.PageRouteInfo<void> {
  const HomeAppBarWidgetRoute({List<_i12.PageRouteInfo>? children})
    : super(HomeAppBarWidgetRoute.name, initialChildren: children);

  static const String name = 'HomeAppBarWidgetRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeAppBarWidget();
    },
  );
}

/// generated route for
/// [_i5.MainShell]
class MainShellRoute extends _i12.PageRouteInfo<void> {
  const MainShellRoute({List<_i12.PageRouteInfo>? children})
    : super(MainShellRoute.name, initialChildren: children);

  static const String name = 'MainShellRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i5.MainShell();
    },
  );
}

/// generated route for
/// [_i6.ProductDetailsScreen]
class ProductDetailsScreenRoute
    extends _i12.PageRouteInfo<ProductDetailsScreenRouteArgs> {
  ProductDetailsScreenRoute({
    _i13.Key? key,
    required int productId,
    List<_i12.PageRouteInfo>? children,
  }) : super(
         ProductDetailsScreenRoute.name,
         args: ProductDetailsScreenRouteArgs(key: key, productId: productId),
         initialChildren: children,
       );

  static const String name = 'ProductDetailsScreenRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsScreenRouteArgs>();
      return _i6.ProductDetailsScreen(key: args.key, productId: args.productId);
    },
  );
}

class ProductDetailsScreenRouteArgs {
  const ProductDetailsScreenRouteArgs({this.key, required this.productId});

  final _i13.Key? key;

  final int productId;

  @override
  String toString() {
    return 'ProductDetailsScreenRouteArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [_i7.ProductListScreen]
class ProductListScreenRoute
    extends _i12.PageRouteInfo<ProductListScreenRouteArgs> {
  ProductListScreenRoute({_i13.Key? key, List<_i12.PageRouteInfo>? children})
    : super(
        ProductListScreenRoute.name,
        args: ProductListScreenRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ProductListScreenRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductListScreenRouteArgs>(
        orElse: () => const ProductListScreenRouteArgs(),
      );
      return _i7.ProductListScreen(key: args.key);
    },
  );
}

class ProductListScreenRouteArgs {
  const ProductListScreenRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'ProductListScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.ProductSearchBar]
class ProductSearchBarRoute
    extends _i12.PageRouteInfo<ProductSearchBarRouteArgs> {
  ProductSearchBarRoute({
    _i13.Key? key,
    required _i13.ValueChanged<String> onChanged,
    required _i13.TextEditingController controller,
    List<_i12.PageRouteInfo>? children,
  }) : super(
         ProductSearchBarRoute.name,
         args: ProductSearchBarRouteArgs(
           key: key,
           onChanged: onChanged,
           controller: controller,
         ),
         initialChildren: children,
       );

  static const String name = 'ProductSearchBarRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductSearchBarRouteArgs>();
      return _i8.ProductSearchBar(
        key: args.key,
        onChanged: args.onChanged,
        controller: args.controller,
      );
    },
  );
}

class ProductSearchBarRouteArgs {
  const ProductSearchBarRouteArgs({
    this.key,
    required this.onChanged,
    required this.controller,
  });

  final _i13.Key? key;

  final _i13.ValueChanged<String> onChanged;

  final _i13.TextEditingController controller;

  @override
  String toString() {
    return 'ProductSearchBarRouteArgs{key: $key, onChanged: $onChanged, controller: $controller}';
  }
}

/// generated route for
/// [_i9.ProfileDetails]
class ProfileDetailsRoute extends _i12.PageRouteInfo<void> {
  const ProfileDetailsRoute({List<_i12.PageRouteInfo>? children})
    : super(ProfileDetailsRoute.name, initialChildren: children);

  static const String name = 'ProfileDetailsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i9.ProfileDetails();
    },
  );
}

/// generated route for
/// [_i10.ProfileOptions]
class ProfileOptionsRoute extends _i12.PageRouteInfo<void> {
  const ProfileOptionsRoute({List<_i12.PageRouteInfo>? children})
    : super(ProfileOptionsRoute.name, initialChildren: children);

  static const String name = 'ProfileOptionsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i10.ProfileOptions();
    },
  );
}

/// generated route for
/// [_i11.SplashScreen]
class SplashScreenRoute extends _i12.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i12.PageRouteInfo>? children})
    : super(SplashScreenRoute.name, initialChildren: children);

  static const String name = 'SplashScreenRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i11.SplashScreen();
    },
  );
}
