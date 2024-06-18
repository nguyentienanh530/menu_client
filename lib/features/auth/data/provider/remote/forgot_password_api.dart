import 'package:dartz/dartz.dart';
import 'package:menu_client/core/api_config.dart';
import 'package:menu_client/features/auth/data/model/login_model.dart';
import '../../../../../common/network/api_base.dart';

class ForgotPasswordApi extends ApiBase {
  Future<Either<String, bool>> forgotPassword({LoginModel? login}) async {
    return await makePostRequest(
        dioClient.dio!.post(ApiConfig.forgotPassword, data: login!.toJson()));
  }
}
