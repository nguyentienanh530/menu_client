import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:menu_client/core/app_colors.dart';

import 'app_style.dart';

class AppRes {
  static String currencyFormat(double double) {
    final oCcy = NumberFormat("###,###,###", "vi");
    return oCcy.format(double);
  }

  static double foodPrice(
      {required bool isDiscount,
      required double foodPrice,
      required int discount}) {
    double discountAmount = (foodPrice * discount.toDouble()) / 100;
    double discountedPrice = foodPrice - discountAmount;

    return isDiscount ? discountedPrice : foodPrice;
  }

  static Future<SnackbarController> showSnackBar(
    String msg,
    bool positive,
  ) async {
    return Get.showSnackbar(
      GetSnackBar(
        titleText: Container(),
        backgroundColor: positive ? AppColors.white : AppColors.bitterSweet1,
        message: msg,
        messageText: Text(
          msg,
          style: kSemiBoldThemeTextStyle.copyWith(
            color: positive ? AppColors.themeColor : AppColors.bitterSweet,
          ),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
