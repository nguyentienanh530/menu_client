import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../../../common/controller/base_controller.dart';
import '../data/model/food_model.dart';
import '../data/provider/remote/food_api.dart';

class FoodsOnCategoryController extends GetxController
    with StateMixin<List<FoodModel>>, BaseController {
  // final FoodApi foodApi = FoodApi();
  // List<FoodModel> foodsOnCategory = <FoodModel>[].obs;

  // Future<void> getFoodsOnCategory({required int idCategory}) async {
  //   change(null, status: RxStatus.loading());
  //   Either<String, List<FoodModel>> failureOrSuccess =
  //       await foodApi.getFoodsOnCategory(idCategory: idCategory);
  //   failureOrSuccess.fold((String failure) {
  //     change(null, status: RxStatus.error(failure));
  //   }, (List<FoodModel> foodsOnCategory) {
  //     // todosCount.value = todos.length;
  //     foodsOnCategory = foodsOnCategory.obs;
  //     if (foodsOnCategory.isEmpty) {
  //       change(null, status: RxStatus.empty());
  //     } else {
  //       change(foodsOnCategory, status: RxStatus.success());
  //     }
  //   });
  // }
}
