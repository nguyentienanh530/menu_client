import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:menu_client/core/api_config.dart';
import 'package:menu_client/features/auth/data/model/access_token.dart';
import 'package:menu_client/features/auth/data/model/login_model.dart';
import 'package:menu_client/features/table/data/model/table_model.dart';

import '../../../../../common/network/api_base.dart';
import '../../../../../common/network/dio_exception.dart';

class LoginApi extends ApiBase<TableModel> {
  Future<Either<String, AccessToken>> login({required LoginModel login}) async {
    try {
      final Response response = await dioClient.dio!.post(
        ApiConfig.login,
        data: login.toJson(),
      );

      final AccessToken accessToken = json
          .decode(json.encode(response.data))
          .map((item) => AccessToken.fromJson(item));

      return right(accessToken);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      return left(errorMessage);
    }
  }
}
