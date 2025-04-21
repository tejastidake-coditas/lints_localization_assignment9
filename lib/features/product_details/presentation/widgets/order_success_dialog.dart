import 'package:flutter/material.dart';
import 'package:lints_localization_assignment9/core/constants/color_constants.dart';
import 'package:lints_localization_assignment9/core/constants/style_constants.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderSuccessDialog extends StatelessWidget {
  const OrderSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) => Dialog(
        backgroundColor: ColorConstants.transparent,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            decoration: BoxDecoration(
              color: ColorConstants.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: ColorConstants.black.withAlpha(1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: ColorConstants.red,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      TextConstants.tickImage,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    AppLocalizations.of(context)!.successTitle,
                    style: StyleConstants.successTitle,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppLocalizations.of(context)!.successMessage,
                    textAlign: TextAlign.center,
                    style: StyleConstants.successMessage,
                  ),
                  const SizedBox(height: 42),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); //use auto routes
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.red,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.goBack,
                        style: StyleConstants.buttonText,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
