import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:menu_client/features/auth/data/model/user_model.dart';
import 'package:menu_client/features/auth/data/provider/remote/user_api.dart';

import '../../../common/controller/base_controller.dart';

class UserController extends GetxController
    with StateMixin<UserModel>, BaseController {
  final userApi = UserApi();
  var userModel = UserModel().obs;
  var accessToken = ''.obs;

  void setAccessToken(String token) {
    accessToken.value = token;
  }

  void getUser({required String accessToken}) async {
    change(null, status: RxStatus.loading());
    Either<String, UserModel> failureOrSuccess =
        await userApi.getUser(accessToken: accessToken);
    failureOrSuccess.fold((String failure) {
      change(null, status: RxStatus.error(failure));
    }, (UserModel user) async {
      if (user.id == 0) {
        change(null, status: RxStatus.empty());
      } else {
        userModel = user.obs;
        change(user, status: RxStatus.success());
      }
    });
  }
}
