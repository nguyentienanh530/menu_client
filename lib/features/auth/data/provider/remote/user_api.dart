import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:menu_client/common/network/api_exception.dart';
import 'package:menu_client/core/api_config.dart';
import 'package:menu_client/core/app_string.dart';
import 'package:menu_client/features/auth/data/model/user_model.dart';
import '../../../../../common/network/api_base.dart';
import '../../../../../common/network/data_response.dart';

class UserApi extends ApiBase<UserModel> {
  Future<Either<String, UserModel>> getUser(
      {required String accessToken}) async {
    try {
      final Response response = await dioClient.dio!.get(ApiConfig.user,
          options: Options(headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json'
          }));

      final UserModel userModel = UserModel.fromJson(response.data['data']);

      return right(userModel);
    } on DioException catch (e) {
      var error = e.response!.data['message'] as String;
      var errorMessage = '';
      if (error.isEmpty) {
        var dataResponse = DataResponse.fromJson(e.response!.data);
        errorMessage = ApiException().fromApiError(dataResponse).toString();
      } else {
        errorMessage = AppString.tokenExpired;
      }
      return left(errorMessage);
    }
  }
}
