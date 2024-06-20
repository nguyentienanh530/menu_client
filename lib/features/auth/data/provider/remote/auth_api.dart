import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/network/api_exception.dart';
import 'package:menu_client/core/api_config.dart';
import 'package:menu_client/features/auth/data/model/access_token.dart';
import 'package:menu_client/features/auth/data/model/login_model.dart';

import '../../../../../common/network/api_base.dart';
import '../../../../../common/network/data_response.dart';
import '../../../../../core/app_datasource.dart';
import '../../../view/screens/login_screen.dart';

class AuthApi extends ApiBase<AccessToken> {
  Future<Either<String, AccessToken>> login({required LoginModel login}) async {
    try {
      final response = await dioClient.dio!.post(
        ApiConfig.login,
        data: login.toJson(),
      );

      final AccessToken accessToken =
          AccessToken.fromJson(response.data['data']);
      return right(accessToken);
    } on DioException catch (e) {
      var dataResponse = DataResponse.fromJson(e.response!.data);
      final errorMessage = ApiException().fromApiError(dataResponse).toString();
      return left(errorMessage);
    }
  }

  Future<bool> logout() async {
    var isLogOut = false;
    try {
      final response = await dioClient.dio!.post(ApiConfig.logout);
      if (response.statusCode == 200) {
        isLogOut = true;
      }
      return isLogOut;
    } catch (e) {
      return isLogOut;
    }
  }

  Future<AccessToken?> refreshToken(
      {required String refreshToken, required String accessToken}) async {
    try {
      AccessToken accessToken = AccessToken(accessToken: '', refreshToken: '');
      final response = await dioClient.dio!.post(ApiConfig.refreshToken,
          data: {'refresh_token': refreshToken, 'access_token': accessToken});

      if (response.statusCode == HttpStatus.ok) {
        final token = AccessToken.fromJson(response.data['data']);
        accessToken = accessToken.copyWith(
            accessToken: token.accessToken, refreshToken: token.refreshToken);
        await AppDatasource().saveAccessToken(accessToken);
      }

      return accessToken;
    } catch (e) {
      await AppDatasource().removeAccessToken();
      Get.offAll(() => const LoginScreen());
      throw 'Something went wrong $e';
    }
  }
}
