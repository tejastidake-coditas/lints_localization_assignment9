import 'package:flutter/material.dart';
import 'package:lints_localization_assignment9/core/constants/color_constants.dart';

class IncrementDecrementWidget extends StatelessWidget {
  final IconData icon;

  const IncrementDecrementWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) => IconButton(
      style: IconButton.styleFrom(
        backgroundColor: ColorConstants.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {},
      icon: Icon(icon, color: ColorConstants.white),
    );
}