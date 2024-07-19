import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_style.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key, required this.onPressed, required this.number});
  final Function() onPressed;
  final String number;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: badges.Badge(
            badgeStyle:
                const badges.BadgeStyle(badgeColor: AppColors.islamicGreen),
            position: badges.BadgePosition.topEnd(top: -14),
            badgeContent: Text(number,
                style: kBodyWhiteStyle.copyWith(fontWeight: FontWeight.bold)),
            child: const Icon(Icons.shopping_cart_rounded, size: 20)));
  }
}
