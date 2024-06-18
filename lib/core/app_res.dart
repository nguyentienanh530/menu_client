import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_const.dart';

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

  static bool validatePassword(String? password) {
    if (password == null || password.isEmpty) return false;
    var emailRegex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return emailRegex.hasMatch(password);
  }

  static bool validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) return false;
    var phoneNumberRegex = RegExp(r'^(?:[+0]9)?[0-9]{10,11}$');
    return phoneNumberRegex.hasMatch(phoneNumber);
  }

  static Future<SnackbarController> showSnackBar(
      String msg, bool positive) async {
    return Get.showSnackbar(
      GetSnackBar(
        snackPosition: SnackPosition.TOP,
        titleText: Container(),
        backgroundColor: positive
            ? AppColors.islamicGreen.withOpacity(0.8)
            : AppColors.themeColor,
        message: msg,
        messageText: Row(
          children: [
            positive
                ? const Icon(Icons.check_box_rounded, color: AppColors.white)
                : const Icon(Icons.error, color: AppColors.white),
            const SizedBox(width: defaultPadding),
            Text(
              msg,
              style: kSemiBoldThemeTextStyle.copyWith(
                color: AppColors.white,
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  static showWanningDiaLog(
      {String? title,
      String? content,
      void Function()? onCancelTap,
      void Function()? onConformTap}) {
    return Get.generalDialog(
        pageBuilder: (context, animation, secondaryAnimation) => AlertDialog(
                backgroundColor: AppColors.white,
                icon: const Icon(Icons.warning_amber_rounded, size: 80),
                title: Text(title ?? 'Thông báo!',
                    style: kRegularTextStyle.copyWith(
                        fontWeight: FontWeight.bold)),
                content: Text(content ?? '',
                    style: kThinBlackTextStyle, textAlign: TextAlign.center),
                actionsAlignment: MainAxisAlignment.spaceAround,
                actions: [
                  GestureDetector(
                      onTap: onCancelTap,
                      child: Container(
                          height: 35,
                          width: 90,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(color: AppColors.themeColor),
                              borderRadius:
                                  BorderRadius.circular(defaultBorderRadius)),
                          child: Text('Hủy',
                              style: kThinWhiteTextStyle.copyWith(
                                  color: AppColors.themeColor)))),
                  GestureDetector(
                      onTap: onConformTap,
                      child: Container(
                          height: 35,
                          width: 90,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.themeColor,
                              borderRadius:
                                  BorderRadius.circular(defaultBorderRadius)),
                          child: const Text('Xác nhận',
                              style: kThinWhiteTextStyle)))
                ]));
  }

  static comfirmDiaLog(
      {String? title,
      String? content,
      void Function()? onCancelTap,
      void Function()? onConformTap}) {
    return Get.generalDialog(
        pageBuilder: (context, animation, secondaryAnimation) => AlertDialog(
                backgroundColor: AppColors.white,
                icon: const Icon(Icons.question_mark_rounded, size: 80),
                title: Text(title ?? 'Thông báo!',
                    style: kRegularTextStyle.copyWith(
                        fontWeight: FontWeight.bold)),
                content: Text(content ?? '',
                    style: kThinBlackTextStyle, textAlign: TextAlign.center),
                actionsAlignment: MainAxisAlignment.spaceAround,
                actions: [
                  GestureDetector(
                      onTap: onCancelTap,
                      child: Container(
                          height: 35,
                          width: 90,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              border: Border.all(color: AppColors.themeColor),
                              borderRadius:
                                  BorderRadius.circular(defaultBorderRadius)),
                          child: Text('Hủy',
                              style: kThinWhiteTextStyle.copyWith(
                                  color: AppColors.themeColor)))),
                  GestureDetector(
                      onTap: onConformTap,
                      child: Container(
                          height: 35,
                          width: 90,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.themeColor,
                              borderRadius:
                                  BorderRadius.circular(defaultBorderRadius)),
                          child: const Text('Xác nhận',
                              style: kThinWhiteTextStyle)))
                ]));
  }

  static String tableStatus(bool isUse) {
    switch (isUse) {
      case false:
        return 'Trống';
      case true:
        return 'Sử dụng';
      default:
        return 'Trống';
    }
  }
}
