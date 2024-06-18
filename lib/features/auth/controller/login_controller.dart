import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/controller/base_controller.dart';
import 'package:menu_client/features/auth/data/model/access_token.dart';
import 'package:menu_client/features/auth/data/model/login_model.dart';
import 'package:menu_client/features/auth/data/provider/remote/login_api.dart';

import '../../../core/app_datasource.dart';
import '../../home/view/screen/home_screen.dart';

class LoginController extends GetxController
    with StateMixin<AccessToken>, BaseController {
  final LoginApi loginApi = LoginApi();

  void login(LoginModel login) async {
    change(null, status: RxStatus.loading());
    Either<String, AccessToken> failureOrSuccess =
        await loginApi.login(login: login);
    failureOrSuccess.fold((String failure) {
      change(null, status: RxStatus.error(failure));
    }, (AccessToken accessToken) async {
      if (accessToken.accessToken.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        // print('token ${accessToken.accessToken}');
        var saved =
            await AppDatasource().saveAccessToken(accessToken.accessToken);
        if (!saved) return;
        Get.offAll(() => const HomeScreen());
        change(accessToken, status: RxStatus.success());
      }
    });
  }
}
