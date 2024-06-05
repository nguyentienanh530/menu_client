import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_style.dart';
import 'package:menu_client/features/cart/controller/cart_controller.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key, required this.onPressed});
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final cartCtrl = Get.put(CartController());
    return IconButton(
        onPressed: onPressed,
        icon: badges.Badge(
            badgeStyle:
                const badges.BadgeStyle(badgeColor: AppColors.islamicGreen),
            position: badges.BadgePosition.topEnd(top: -14),
            badgeContent: Obx(() => Text(
                cartCtrl.order.value.foods.length.toString(),
                style:
                    kThinWhiteTextStyle.copyWith(fontWeight: FontWeight.bold))),
            child: const Icon(Icons.shopping_cart_rounded, size: 20)));
  }
}
