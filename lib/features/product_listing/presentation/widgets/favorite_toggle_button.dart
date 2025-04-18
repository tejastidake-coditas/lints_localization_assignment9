import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteToggleButton extends StatelessWidget {
  // final ValueNotifier<bool> isFavoriteNotifier;

  const FavoriteToggleButton({
    super.key,
    // required this.isFavoriteNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/heart_unfilled.svg',
      // onPressed: () {
      //   isFavoriteNotifier.value = !isFavoriteNotifier.value;
      // },
    );
  }
}
