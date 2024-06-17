import 'package:menu_client/core/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:menu_client/core/app_colors.dart';

const kSemiBoldWhiteTextStyle = TextStyle(
  color: AppColors.white,
  fontFamily: AppAsset.fnProductSansMedium,
  fontSize: 23,
);

const kSemiBoldTextStyle = TextStyle(
  color: AppColors.neroDark,
  fontFamily: AppAsset.fnProductSansMedium,
  fontSize: 17,
);

const kSemiBoldThemeTextStyle = TextStyle(
  color: AppColors.themeColor,
  fontFamily: AppAsset.fnProductSansMedium,
  fontSize: 17,
);
const kMediumWhiteTextStyle = TextStyle(
  color: AppColors.white,
  fontFamily: AppAsset.fnProductSansMedium,
  fontSize: 20,
);

const kMediumTextStyle = TextStyle(
  color: AppColors.neroDark,
  fontFamily: AppAsset.fnProductSansMedium,
  fontSize: 20,
);

const kMediumThemeTextStyle = TextStyle(
  color: AppColors.themeColor,
  fontFamily: AppAsset.fnProductSansMedium,
  fontSize: 20,
);

const kBoldWhiteTextStyle = TextStyle(
  color: AppColors.white,
  fontFamily: AppAsset.fnProductSansBold,
  fontSize: 23,
);

const kBoldThemeTextStyle = TextStyle(
  color: AppColors.themeColor,
  fontFamily: AppAsset.fnProductSansBold,
  fontSize: 20,
);

const kBlackWhiteTextStyle = TextStyle(
  color: AppColors.neroDark,
  fontFamily: AppAsset.fnProductSansBlack,
  fontSize: 22,
);

const kRegularWhiteTextStyle = TextStyle(
  color: AppColors.white,
  fontFamily: AppAsset.fnProductSansRegular,
  fontSize: 16,
);

const kRegularTextStyle = TextStyle(
  color: AppColors.neroDark,
  fontFamily: AppAsset.fnProductSansRegular,
  fontSize: 16,
);

const kRegularEmpressTextStyle = TextStyle(
  color: AppColors.empress,
  fontFamily: AppAsset.fnProductSansRegular,
  fontSize: 16,
);
const kRegularThemeTextStyle = TextStyle(
  color: AppColors.themeColor,
  fontFamily: AppAsset.fnProductSansRegular,
  fontSize: 16,
);

const kLightWhiteTextStyle = TextStyle(
  color: AppColors.white,
  fontFamily: AppAsset.fnProductSansLight,
  fontSize: 14,
);

const kThinWhiteTextStyle = TextStyle(
  color: AppColors.white,
  fontFamily: AppAsset.fnProductSansThin,
  fontSize: 14,
);

const kThinBlackTextStyle = TextStyle(
  color: AppColors.neroDark,
  fontFamily: AppAsset.fnProductSansRegular,
  fontSize: 14,
);

const kBlackButtonTextStyle = TextStyle(
  color: AppColors.black,
  fontFamily: AppAsset.fnProductSansRegular,
  fontSize: 14,
);

const kThemeButtonTextStyle = TextStyle(
  color: AppColors.themeColor,
  fontFamily: AppAsset.fnProductSansRegular,
  fontSize: 16,
);

ButtonStyle kButtonWhiteStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(AppColors.white),
  shape: MaterialStateProperty.all(
    const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
  ),
  overlayColor: MaterialStateProperty.all(AppColors.transparent),
);

ButtonStyle kButtonThemeStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(AppColors.themeColor),
  shape: MaterialStateProperty.all(
    const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))),
  ),
  overlayColor: MaterialStateProperty.all(AppColors.transparent),
);
