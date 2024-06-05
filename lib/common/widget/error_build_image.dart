import 'package:flutter/widgets.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_style.dart';

Widget errorBuilderForImage(context, error, stackTrace) {
  return const ImageNotFound();
}

class ImageNotFound extends StatelessWidget {
  final Color? color;
  final Color? tintcolor;

  const ImageNotFound({
    super.key,
    this.color,
    this.tintcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? AppColors.smokeWhite,
      child: Center(
        child: Text(
          ':-('.toUpperCase(),
          style: kBoldThemeTextStyle.copyWith(
            color: tintcolor ?? AppColors.smokeWhite1,
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
