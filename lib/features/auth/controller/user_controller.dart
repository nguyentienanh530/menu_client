import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:menu_client/features/auth/data/model/user_model.dart';
import 'package:menu_client/features/auth/data/provider/remote/user_api.dart';

import '../../../common/controller/base_controller.dart';

class UserController extends GetxController
    with StateMixin<UserModel>, BaseController {
  final _userApi = UserApi();
  var userModel = UserModel().obs;

  Rx<File> imageFile = File('').obs;

  void getUser() async {
    change(null, status: RxStatus.loading());
    Either<String, UserModel> failureOrSuccess = await _userApi.getUser();
    failureOrSuccess.fold((String failure) {
      change(null, status: RxStatus.error(failure));
    }, (UserModel user) async {
      if (user.id == 0) {
        change(null, status: RxStatus.empty());
      } else {
        userModel.value = user;
        change(user, status: RxStatus.success());
      }
    });
  }

  Future<String> uploadAvatar(File file) async {
    var image = '';
    Either<String, String> failureOrSuccess = await _userApi.uploadAvatar(file);
    failureOrSuccess.fold((String failure) {
      log('uploadAvatar failure: $failure');
      image = '';
    }, (String imageUrl) {
      image = imageUrl;
    });
    return image;
  }

  void updateUser({required UserModel userModel}) {
    updateItem(_userApi.updateUser(userModel: userModel));
  }
}
