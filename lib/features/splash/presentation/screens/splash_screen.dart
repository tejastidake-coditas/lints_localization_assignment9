import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lints_localization_assignment9/core/constants/color_constants.dart';
import 'package:lints_localization_assignment9/core/constants/style_constants.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';
import 'package:lints_localization_assignment9/core/navigation/app_router.gr.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) context.router.replace(const MainShellRoute());
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorConstants.splashScreenTop,
                ColorConstants.splashScreenBottom
              ],
            ),
          ),
          child: Stack(
            children: [
              Center(
                heightFactor: 10,
                child: Text(
                  AppLocalizations.of(context)!.appName,
                  style: StyleConstants.splashScreenHeadline,
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  TextConstants.splashScreenBurger2,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  TextConstants.splashScreenBurger1,
                ),
              ),
            ],
          ),
        ),
      );
}
