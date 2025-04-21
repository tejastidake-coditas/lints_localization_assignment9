import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';

class FavoriteToggleButton extends StatelessWidget {
  const FavoriteToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
        TextConstants.heartUnfilled,
      );
}
