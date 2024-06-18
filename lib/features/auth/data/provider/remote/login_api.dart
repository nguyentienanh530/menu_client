import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:menu_client/common/network/api_exception.dart';
import 'package:menu_client/core/api_config.dart';
import 'package:menu_client/features/auth/data/model/access_token.dart';
import 'package:menu_client/features/auth/data/model/login_model.dart';

import '../../../../../common/network/api_base.dart';
import '../../../../../common/network/data_response.dart';

class LoginApi extends ApiBase<AccessToken> {
  Future<Either<String, AccessToken>> login({required LoginModel login}) async {
    try {
      final Response response = await dioClient.dio!.post(
        ApiConfig.login,
        data: login.toJson(),
      );
      print('response: ${response.data}');
      final AccessToken accessToken =
          AccessToken.fromJson(response.data['data']);
      return right(accessToken);
    } on DioException catch (e) {
      var dataResponse = DataResponse.fromJson(e.response!.data);
      final errorMessage = ApiException().fromApiError(dataResponse).toString();
      return left(errorMessage);
    }
  }
}
