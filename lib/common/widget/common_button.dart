import 'package:flutter/material.dart';
import '../../core/app_style.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({super.key, this.text, this.onTap});
  final String? text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
        icon: const Icon(Icons.arrow_forward_rounded, size: 20),
        onPressed: onTap,
        label: Text(text ?? '', style: kBodyWhiteStyle));
  }
}
