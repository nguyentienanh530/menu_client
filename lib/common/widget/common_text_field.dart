import 'package:flutter/material.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_const.dart';
import 'package:menu_client/core/app_style.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key,
      this.errorText,
      required this.onChanged,
      this.hintText,
      this.keyboardType,
      this.obscureText,
      this.suffixIcon,
      this.validator,
      this.controller,
      this.prefixIcon,
      this.maxLines});
  final String? errorText;
  final TextInputType? keyboardType;
  final Function(String) onChanged;
  final String? hintText;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller!,
        validator: validator,
        textAlignVertical: TextAlignVertical.center,
        key: key,
        maxLines: maxLines,
        style: kThinBlackTextStyle,
        textAlign: TextAlign.start,
        keyboardType: keyboardType ?? TextInputType.text,
        autocorrect: false,
        autofocus: false,
        obscureText: obscureText ?? false,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
            isDense: true,
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                borderSide: const BorderSide(color: AppColors.themeColor)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                borderSide: const BorderSide(color: AppColors.themeColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                borderSide: const BorderSide(color: AppColors.lavender)),
            suffixIcon: suffixIcon ?? const SizedBox(),
            prefixIcon: prefixIcon ?? const SizedBox(),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                borderSide: const BorderSide(color: AppColors.lavender)),
            errorText: errorText,
            contentPadding: const EdgeInsets.only(left: defaultPadding),
            filled: true,
            hintText: hintText,
            errorStyle:
                kThinBlackTextStyle.copyWith(color: AppColors.themeColor),
            hintStyle: kThinBlackTextStyle.copyWith(
                color: AppColors.black.withOpacity(0.6)),
            labelStyle: kThinBlackTextStyle),
        onChanged: onChanged);
  }
}
