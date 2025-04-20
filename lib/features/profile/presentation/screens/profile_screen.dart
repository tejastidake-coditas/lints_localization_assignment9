import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lints_localization_assignment9/core/constants/color_constants.dart';
import 'package:lints_localization_assignment9/core/constants/style_constants.dart';
import 'package:lints_localization_assignment9/core/constants/text_constants.dart';
import 'package:lints_localization_assignment9/features/profile/presentation/widgets/profile_bottom_row.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment(0, -0.15),
                  radius: 0.8,
                  colors: [Color(0xFFFF2A9D), Color(0xFFEF2A39)],
                ),
              ),
            ),
            Positioned(
              top: 11,
              right: -50,
              child: Image.asset(
                TextConstants.splashScreenBurger1,
                height: 196,
                width: 196,
                color: Colors.white.withValues(alpha: 0.16),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
            Positioned(
              top: 20,
              left: -50,
              child: Image.asset(
                TextConstants.splashScreenBurger2,
                height: 196,
                width: 196,
                color: Colors.white.withValues(alpha: 0.16),
                colorBlendMode: BlendMode.modulate,
              ),
            ),
            Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Image.asset(
                      'assets/images/arrow_left.png',
                      color: ColorConstants.white,
                      width: 28,
                      height: 28,
                    ),
                  ),
                  const Icon(Icons.settings, color: Colors.white, size: 24),
                ],
              ),
            ),
            Positioned.fill(
              top: 168,
              child: Container(
                padding: const EdgeInsets.only(top: 52),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    children: [
                      TextFormField(
                        initialValue: 'Sophia Patel',
                        style: StyleConstants.profileInputTextStyle,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 34, vertical: 22),
                          labelText: 'Name',
                          labelStyle: StyleConstants.hintTextStyle,
                          border: StyleConstants.outlineInputStyle,
                          enabledBorder: StyleConstants.outlineInputStyle,
                          focusedBorder: StyleConstants.outlineInputStyle,
                        ),
                      ),
                      const SizedBox(height: 38),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        initialValue: 'sophiapatel@gmail.com',
                        style: StyleConstants.profileInputTextStyle,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 34, vertical: 22),
                          labelText: 'Email',
                          labelStyle: StyleConstants.hintTextStyle,
                          border: StyleConstants.outlineInputStyle,
                          enabledBorder: StyleConstants.outlineInputStyle,
                          focusedBorder: StyleConstants.outlineInputStyle,
                        ),
                      ),
                      const SizedBox(height: 38),
                      TextFormField(
                        initialValue: '123 Main St Apartment 4A,New York, NY',
                        style: StyleConstants.profileInputTextStyle,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 34, vertical: 22),
                          labelText: TextConstants.deliveryAddress,
                          labelStyle: StyleConstants.hintTextStyle,
                          border: StyleConstants.outlineInputStyle,
                          enabledBorder: StyleConstants.outlineInputStyle,
                          focusedBorder: StyleConstants.outlineInputStyle,
                        ),
                      ),
                      const SizedBox(height: 38),
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: '●',
                        initialValue: TextConstants.password,
                        style: StyleConstants.profileInputTextStyle,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 34, vertical: 22),
                          labelText: 'Password',
                          labelStyle: StyleConstants.hintTextStyle,
                          border: StyleConstants.outlineInputStyle,
                          enabledBorder: StyleConstants.outlineInputStyle,
                          focusedBorder: StyleConstants.outlineInputStyle,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: Column(
                          spacing: 20,
                          children: [
                            const Divider(
                              height: 0,
                              color: ColorConstants.profileDividerColor,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  TextConstants.paymentDetails,
                                  style: StyleConstants.info,
                                ),
                                Image.asset(
                                  TextConstants.smallRight,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  TextConstants.orderHistory,
                                  style: StyleConstants.info,
                                ),
                                Image.asset(
                                  TextConstants.smallRight,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 58,
                      ),
                      Row(
                        spacing: 18,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProfileBottomRow(
                            label: TextConstants.editProfile,
                            icon: Image.asset(TextConstants.editIconPng),
                            isFilled: true,
                            backgroundColor: ColorConstants.darkColor,
                          ),
                          ProfileBottomRow(
                            label: TextConstants.logout,
                            icon: Image.asset(TextConstants.signOut),
                            isFilled: false,
                            borderColor: ColorConstants.red,
                            borderWidth: 3,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 80,
              left: 146,
              child: Container(
                width: 139,
                height: 139,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.red, width: 4),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(TextConstants.defaultProfileImageText),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
