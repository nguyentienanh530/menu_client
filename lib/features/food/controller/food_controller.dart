import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/controller/base_controller.dart';
import 'package:menu_client/features/food/data/model/food_model.dart';
import 'package:menu_client/features/food/data/provider/remote/food_api.dart';

class FoodController extends GetxController
    with StateMixin<List<FoodModel>>, BaseController {
  final FoodApi foodApi = FoodApi();
  List<FoodModel> newFoods = <FoodModel>[].obs;

  Future<void> getNewFoodsLimit() async {
    change(null, status: RxStatus.loading());
    Either<String, List<FoodModel>> failureOrSuccess =
        await foodApi.getNewFoodsLimit();
    failureOrSuccess.fold((String failure) {
      change(null, status: RxStatus.error(failure));
    }, (List<FoodModel> foods) {
      // todosCount.value = todos.length;
      newFoods = foods.obs;
      if (newFoods.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(foods, status: RxStatus.success());
      }
    });
  }
}

class PopularFoodController extends GetxController
    with StateMixin<List<FoodModel>>, BaseController {
  final FoodApi foodApi = FoodApi();
  List<FoodModel> popularFoods = <FoodModel>[].obs;

  Future<void> getPopularFoodsLimit() async {
    change(null, status: RxStatus.loading());
    Either<String, List<FoodModel>> failureOrSuccess =
        await foodApi.getPopularFoodsLimit();
    failureOrSuccess.fold((String failure) {
      change(null, status: RxStatus.error(failure));
    }, (List<FoodModel> popularfoods) {
      // todosCount.value = todos.length;
      popularFoods = popularfoods.obs;
      if (popularFoods.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(popularfoods, status: RxStatus.success());
      }
    });
  }
}