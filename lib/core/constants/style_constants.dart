import 'package:flutter/material.dart';
import 'package:lints_localization_assignment9/core/constants/color_constants.dart';

class StyleConstants {
  static const titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: 'EncodeSans',
    color: ColorConstants.titleColor,
    height: 1.3,
    letterSpacing: 0,
  );
  static const priceStyle = TextStyle(
    fontSize: 16,
    color: Colors.green,
    fontFamily: 'EncodeSans',
  );
  static const qtyStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'EncodeSans',
  );

  static const miniStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    color: ColorConstants.miniColor,
    height: 1.5,
    fontFamily: 'EncodeSans',
    letterSpacing: 0,
  );

  static const defaultProfileNameStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    fontFamily: 'EncodeSans',
    color: ColorConstants.boldHeadingColor,
    height: 1.5,
    letterSpacing: 0,
  );

  static const searchHintStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    fontFamily: 'Roboto',
    color: ColorConstants.searchHintColor,
    height: 1,
    letterSpacing: 0,
  );

  static const cartStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 24,
    fontFamily: 'EncodeSans',
    color: ColorConstants.cartColor,
    height: 1.5,
    letterSpacing: 0,
  );

  static const productCardTileTitle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    fontFamily: 'Roboto',
    color: ColorConstants.productCardTileTitleColor,
    height: 1.3,
    letterSpacing: 0,
  );

  static const productCardTileCategory = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    fontFamily: 'Roboto',
    color: ColorConstants.productCardTileCategoryColor,
    height: 1.3,
    letterSpacing: 0,
  );

  static const productCardTilePrice = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    fontFamily: 'EncodeSans',
    color: ColorConstants.productCardTilePriceColor,
    height: 1.5,
    letterSpacing: 0,
  );

  static const addToCartTextStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    fontFamily: 'EncodeSans',
    color: ColorConstants.addToCartButtonTextColor,
    height: 1.4,
    letterSpacing: 0,
  );

  static const addToCartButtonStyle = TextStyle(
    color: ColorConstants.addToCartButtonColor,
  );

  static const productDescriptionTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    fontFamily: 'EncodeSans',
    color: ColorConstants.productDescriptionTextColor,
    height: 1.5,
    letterSpacing: 0,
  );

  static const labelHeadingTextStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 12,
    fontFamily: 'EncodeSans',
    color: ColorConstants.labelDetailsTextColor,
    height: 1.5,
    letterSpacing: 0,
  );

  static const labelDetailsTextStyle = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    fontFamily: 'EncodeSans',
    color: ColorConstants.labelDetailsTextColor,
    height: 1.5,
    letterSpacing: 0,
  );

  static const cartQtyTextStyle = TextStyle(
    color: ColorConstants.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );

  static const productQtyTextStyle = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
    fontFamily: 'EncodeSans',
    color: ColorConstants.productQtyTextColor,
    height: 1.2,
    letterSpacing: 0,
  );

  static const descriptionStyle = miniStyle;
  static const helloGreetingsStyle = miniStyle;

  static const splashScreenHeadline = TextStyle(
    fontSize: 60,
    color: Colors.white,
    fontWeight: FontWeight.w400,
    height: 1,
    fontFamily: 'Lobster',
  );

  static const appName = TextStyle(
    fontSize: 45,
    color: Color.fromARGB(202, 14, 14, 1),
    fontWeight: FontWeight.w400,
    height: 1.3,
    fontFamily: 'Lobster',
  );

  static const appTagLine = TextStyle(
    fontSize: 18,
    color: Color.fromARGB(234, 64, 64, 3),
    fontWeight: FontWeight.w500,
    height: 1.0,
    fontFamily: 'Poppins',
  );

  static const listingRatingStyle = TextStyle(
    fontSize: 16,
    color: ColorConstants.productCardTileTitleColor,
    fontWeight: FontWeight.w600,
    height: 1.3,
    fontFamily: 'Roboto',
  );

  static const bodyText3 = TextStyle(
    fontSize: 18,
    color: ColorConstants.counterColor,
    fontWeight: FontWeight.w500,
    height: 1.3,
    fontFamily: 'Inter',
  );

  static const deatilsRatingStyle = TextStyle(
    fontSize: 15,
    color: ColorConstants.productDeatilsCardTileTitleColor,
    fontWeight: FontWeight.w600,
    height: 1.3,
    fontFamily: 'Roboto',
  );

  static const minsDurationTextStyle = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    color: Color(0xFF808080),
    fontSize: 15,
    height: 1.3,
    letterSpacing: 0,
  );

  static const detailsDescriptionTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0,
    fontFamily: 'Roboto',
    color: ColorConstants.descriptionColor,
  );

  static const spicyTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.3,
    letterSpacing: 0,
    fontFamily: 'Roboto',
    color: ColorConstants.spicyTextColor,
  );

  static const mildHot = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.3,
    letterSpacing: 0,
    fontFamily: 'Roboto',
    color: ColorConstants.mildHotTextColor,
  );

  static const detailsTitleTextStyle = TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.w600,
      height: 1.3,
      letterSpacing: 0,
      fontFamily: 'Roboto');

  static const successTitle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w900,
    height: 1.0,
    letterSpacing: 0,
    fontFamily: 'Poppins',
    color: ColorConstants.successDialogTitle,
  );

  static const successMessage = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    letterSpacing: 0,
    fontFamily: 'Roboto',
    color: ColorConstants.successDialogMessage,
  );

  static const buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: 0,
    fontFamily: 'Roboto',
    color: ColorConstants.white,
  );

  static const priceTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: 0,
    fontFamily: 'Roboto',
    color: ColorConstants.white,
  );

  static const orderNowStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: 0,
    fontFamily: 'Inter',
    color: ColorConstants.white,
  );

  static const profileInputTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: 'Roboto',
    height: 1.0,
    letterSpacing: 0,
  );

  static const hintTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: ColorConstants.hintTextColor,
    fontFamily: 'Roboto',
    height: 1.5,
    letterSpacing: 0,
  );

  static var outlineInputStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(
      color: Color(0xFFE1E1E1),
      width: 2,
    ),
  );

  static const info = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: ColorConstants.hintTextColor,
    fontFamily: 'Roboto',
    height: 1.5,
    letterSpacing: 0,
  );

  static const bodyText1 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
    height: 1.5,
    letterSpacing: 0,
  );
}
