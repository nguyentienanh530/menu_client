import 'package:flutter/material.dart';
import 'package:menu_client/core/app_colors.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Center(child: SpinKitCircle(color: Colors.red, size: 30));
    return const Center(
        child: SizedBox(
      height: 25,
      width: 25,
      child: CircularProgressIndicator(
        color: AppColors.themeColor,
        strokeWidth: 4,
        strokeCap: StrokeCap.round,
      ),
    ));
  }
}
