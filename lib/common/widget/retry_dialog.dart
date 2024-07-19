import 'package:flutter/material.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_const.dart';
import 'package:menu_client/core/app_style.dart';

class RetryDialog extends StatelessWidget {
  const RetryDialog({
    super.key,
    required this.title,
    required this.onRetryPressed,
  });

  final String title;
  final VoidCallback onRetryPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        // side: BorderSide(color: Colors.redAccent, width: 2.0),
        borderRadius: BorderRadius.circular(defaultBorderRadius * 3),
      ),
      title: Column(
        children: [
          const Icon(Icons.error, color: Colors.redAccent, size: 80),
          const SizedBox(height: defaultPadding),
          Text(
            "Có lỗi xảy ra",
            style: kHeadingStyle.copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: kSubHeadingStyle.copyWith(
                fontSize: 14, color: AppColors.black.withOpacity(0.5)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.themeColor),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text("Hủy"),
              ),
              const SizedBox(width: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.themeColor,
                    foregroundColor: AppColors.white),
                onPressed: onRetryPressed,
                child: const Text("Thử lại"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
