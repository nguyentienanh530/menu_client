import 'package:flutter/material.dart';

import '../../core/app_colors.dart';
import '../../core/app_style.dart';

class ErrWidget extends StatelessWidget {
  const ErrWidget({super.key, required this.error});
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.smokeWhite,
      height: 30,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(Icons.error, color: Colors.redAccent, size: 20),
        const SizedBox(width: 10),
        Text(
          error ?? "Có lỗi xảy ra",
          style: kSemiBoldTextStyle.copyWith(
              color: AppColors.black.withOpacity(0.5), fontSize: 14),
        )
      ]),
    );
  }
}
