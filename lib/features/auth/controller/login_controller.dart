import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/controller/base_controller.dart';
import 'package:menu_client/features/auth/data/model/access_token.dart';
import 'package:menu_client/features/auth/data/model/login_model.dart';
import 'package:menu_client/features/auth/data/provider/remote/login_api.dart';
import 'package:menu_client/features/food/data/model/food_model.dart';

class LoginController extends GetxController
    with StateMixin<AccessToken>, BaseController {
  final LoginApi loginApi = LoginApi();
  List<FoodModel> foods = <FoodModel>[].obs;
  var textSearch = ''.obs;

  void login(LoginModel login) async {
    change(null, status: RxStatus.loading());
    Either<String, AccessToken> failureOrSuccess =
        await loginApi.login(login: login);
    failureOrSuccess.fold((String failure) {
      change(null, status: RxStatus.error(failure));
    }, (AccessToken accessToken) {
      if (accessToken.accessToken.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        print('access token: ${accessToken.accessToken}');
        change(accessToken, status: RxStatus.success());
      }
    });
  }

  // Future<void> fetchFoods() async {
  //   change(null, status: RxStatus.loading());
  //   Either<String, List<FoodModel>> failureOrSuccess = await foodApi.getFoods();
  //   failureOrSuccess.fold((String failure) {
  //     change(null, status: RxStatus.error(failure));
  //   }, (List<FoodModel> foods) {
  //     foods = foods.obs;
  //     if (foods.isEmpty) {
  //       change(null, status: RxStatus.empty());
  //     } else {
  //       change(foods, status: RxStatus.success());
  //     }
  //   });
  // }
}
