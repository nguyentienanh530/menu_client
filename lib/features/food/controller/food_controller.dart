import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/controller/base_controller.dart';
import 'package:menu_client/features/food/data/model/food_model.dart';
import 'package:menu_client/features/food/data/provider/remote/food_api.dart';

class FoodsController extends GetxController
    with StateMixin<List<FoodModel>>, BaseController {
  final FoodApi foodApi = FoodApi();
  List<FoodModel> foods = <FoodModel>[].obs;
  var textSearch = ''.obs;

  Future<void> fetchFoods() async {
    change(null, status: RxStatus.loading());
    Either<String, List<FoodModel>> failureOrSuccess = await foodApi.getFoods();
    failureOrSuccess.fold((String failure) {
      change(null, status: RxStatus.error(failure));
    }, (List<FoodModel> foods) {
      foods = foods.obs;
      if (foods.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(foods, status: RxStatus.success());
      }
    });
  }
}
