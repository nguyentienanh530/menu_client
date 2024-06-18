import 'package:get/get.dart';
import 'package:menu_client/features/auth/data/model/login_model.dart';

import '../../../common/controller/base_controller.dart';
import '../data/provider/remote/forgot_password_api.dart';

class ForgotPasswordController extends GetxController with BaseController {
  var isShowPassword = false.obs;
  var isShowConfirmPassword = false.obs;
  final _forgotPasswordApi = ForgotPasswordApi();

  void toggleShowPassword() {
    isShowPassword.value = !isShowPassword.value;
  }

  void toggleShowConfirmPassword() {
    isShowConfirmPassword.value = !isShowConfirmPassword.value;
  }

  void resetPassword(LoginModel loginModel) {
    updateItem(_forgotPasswordApi.forgotPassword(login: loginModel));
  }
}
