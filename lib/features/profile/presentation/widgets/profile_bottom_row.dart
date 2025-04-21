import 'package:flutter/material.dart';
import 'package:lints_localization_assignment9/core/constants/color_constants.dart';
import 'package:lints_localization_assignment9/core/constants/style_constants.dart';

class ProfileBottomRow extends StatelessWidget {
  final String label;
  final Widget icon;
  final bool isFilled;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;

  const ProfileBottomRow({
    super.key,
    required this.label,
    required this.icon,
    required this.isFilled,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
        decoration: BoxDecoration(
          color: isFilled ? backgroundColor : ColorConstants.transparent,
          borderRadius: BorderRadius.circular(20),
          border: isFilled
              ? null
              : Border.all(
                  color: borderColor ?? ColorConstants.darkColor,
                  width: borderWidth ?? 1,
                ),
        ),
        child: Row(
          spacing: 17,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: StyleConstants.bodyText1.copyWith(
                fontFamily: 'Roboto',
                color: isFilled ? ColorConstants.white : borderColor,
              ),
            ),
            icon,
          ],
        ),
      );
}
