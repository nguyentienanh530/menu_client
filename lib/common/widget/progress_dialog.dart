import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:menu_client/core/app_colors.dart';

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
      title: const Text("Vui lòng đợi..."),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title),
          const SizedBox(height: 15),
          isProgressed
              ? const SpinKitCircle(color: AppColors.themeColor, size: 30)
              : const SizedBox(),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: isProgressed
                ? const SizedBox()
                : ElevatedButton(
                    onPressed: onPressed,
                    child: const Text("Success"),
                  ),
          )
        ],
      ),
    );
  }
}
