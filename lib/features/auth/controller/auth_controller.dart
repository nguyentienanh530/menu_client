import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/controller/base_controller.dart';
import 'package:menu_client/features/auth/data/model/access_token.dart';
import 'package:menu_client/features/auth/data/model/login_model.dart';
import 'package:menu_client/features/auth/data/provider/remote/auth_api.dart';
import 'package:menu_client/features/auth/view/screens/login_screen.dart';

import '../../../core/app_datasource.dart';
import '../../home/view/screen/home_screen.dart';

class AuthController extends GetxController
    with StateMixin<AccessToken>, BaseController {
  final AuthApi authApi = AuthApi();

  void login(LoginModel login) async {
    change(null, status: RxStatus.loading());
    Either<String, AccessToken> failureOrSuccess =
        await authApi.login(login: login);
    failureOrSuccess.fold((String failure) {
      change(null, status: RxStatus.error(failure));
    }, (AccessToken accessToken) async {
      if (accessToken.accessToken.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        await AppDatasource().saveAccessToken(accessToken);

        Get.offAll(() => HomeScreen(accessToken: accessToken.accessToken));
        change(accessToken, status: RxStatus.success());
      }
    });
  }

  void logout() async {
    await authApi.logout();
    await AppDatasource().removeAccessToken();
    Get.offAll(() => const LoginScreen());
  }
}
