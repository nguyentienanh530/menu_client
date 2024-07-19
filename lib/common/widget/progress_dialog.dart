import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_style.dart';

class ProgressDialog extends StatelessWidget {
  const ProgressDialog({
    super.key,
    required this.title,
    required this.isProgressed,
    this.onPressed,
  });

  final String title;
  final bool isProgressed;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: isProgressed
          ? const Text("Vui lòng đợi...", style: kHeadingStyle)
          : const Icon(Icons.check_circle_outline_rounded,
              color: AppColors.themeColor, size: 100),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title),
          const SizedBox(height: 15),
          isProgressed
              ? const CircularProgressIndicator(color: AppColors.themeColor)
              : const SizedBox(),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: isProgressed
                ? const SizedBox()
                : ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.themeColor,
                      foregroundColor: AppColors.white,
                    ),
                    onPressed: onPressed,
                    child: const Text("Xác nhận", style: kButtonWhiteStyle),
                  ),
          )
        ],
      ),
    );
  }
}
