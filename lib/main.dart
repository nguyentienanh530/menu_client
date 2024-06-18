import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_datasource.dart';
import 'package:menu_client/features/auth/controller/user_controller.dart';
import 'package:menu_client/features/home/view/screen/home_screen.dart';

import 'features/auth/view/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var accessToken = await AppDatasource().getAccessToken();

  Logger().d('accessToken: $accessToken');
  runApp(MainApp(accessToken: accessToken ?? ''));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key, required this.accessToken});
  final String accessToken;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //  theme: AppTheme.lightAppTheme,
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.smokeWhite,
          // scaffoldBackgroundColor: ColorRes.themeColor.withOpacity(0.6),
          textTheme: const TextTheme(
              displaySmall: TextStyle(color: AppColors.white),
              displayLarge: TextStyle(color: AppColors.white),
              displayMedium: TextStyle(color: AppColors.white)),
          colorScheme: ColorScheme.fromSwatch(
              primarySwatch: MaterialColor(AppColors.themeColor.value,
                  getSwatch(AppColors.themeColor)))),

      home: accessToken.isEmpty ? const LoginScreen() : const HomeScreen(),
    );
  }

  Map<int, Color> getSwatch(Color color) {
    final hslColor = HSLColor.fromColor(color);
    final lightness = hslColor.lightness;

    /// if [500] is the default color, there are at LEAST five
    /// steps below [500]. (i.e. 400, 300, 200, 100, 50.) A
    /// divisor of 5 would mean [50] is a lightness of 1.0 or
    /// a color of #ffffff. A value of six would be near white
    /// but not quite.
    const lowDivisor = 6;

    /// if [500] is the default color, there are at LEAST four
    /// steps above [500]. A divisor of 4 would mean [900] is
    /// a lightness of 0.0 or color of #000000
    const highDivisor = 5;

    final lowStep = (1.0 - lightness) / lowDivisor;
    final highStep = lightness / highDivisor;

    return {
      50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
      100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
      200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
      300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
      400: (hslColor.withLightness(lightness + lowStep)).toColor(),
      500: (hslColor.withLightness(lightness)).toColor(),
      600: (hslColor.withLightness(lightness - highStep)).toColor(),
      700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
      800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
      900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
    };
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
