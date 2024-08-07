import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:menu_client/common/network/api_exception.dart';
import 'package:menu_client/core/api_config.dart';
import 'package:menu_client/features/auth/data/model/user_model.dart';
import '../../../../../common/network/api_base.dart';
import '../../../../../common/network/data_response.dart';

class UserApi extends ApiBase<UserModel> {
  Future<Either<String, UserModel>> getUser() async {
    try {
      final Response response = await dioClient.dio!.get(ApiConfig.user);

      final UserModel userModel = UserModel.fromJson(response.data['data']);
      return right(userModel);
    } on DioException catch (e) {
      var errorMessage = '';
      errorMessage = ApiException()
          .fromApiError(DataResponse.fromJson(e.response!.data))
          .toString();

      return left(errorMessage);
    }
  }

  Future<Either<String, String>> uploadAvatar(File file) async {
    var filePath = file.path.split('/').last;

    FormData formData = FormData.fromMap({
      "avatar": await MultipartFile.fromFile(file.path, filename: filePath),
    });

    try {
      final response = await dioClient.dio!.post(ApiConfig.uploadAvatar,
          data: formData, onSendProgress: (count, total) {
        Logger().w('count: $count, total: $total');
      });
      String image = response.data['image'];

      return right(image);
    } on DioException catch (e) {
      var dataResponse = DataResponse.fromJson(e.response!.data);
      final errorMessage = ApiException().fromApiError(dataResponse).toString();
      return left(errorMessage);
    }
  }

  Future<Either<String, bool>> updateUser(
      {required UserModel userModel}) async {
    return makePutRequest(dioClient.dio!
        .put(ApiConfig.updateUser, queryParameters: userModel.toJson()));
  }
}
