import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lints_localization_assignment9/core/constants/color_constants.dart';
import 'package:lints_localization_assignment9/core/constants/style_constants.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';
import 'package:lints_localization_assignment9/core/navigation/app_router.gr.dart';
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
    Future.delayed(const Duration(seconds: 3), () {
      context.router.replace(const MainShellRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const Center(
              heightFactor: 10,
              child: Text(
                TextConstants.splashScreenHeadline,
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
}
