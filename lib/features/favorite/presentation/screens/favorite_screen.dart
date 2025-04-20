import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';

@RoutePage()
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text(TextConstants.favorites),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(TextConstants.favoriteScreen),
          ],
        ),
      ),
    );
}
