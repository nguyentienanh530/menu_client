import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/controller/base_controller.dart';
import 'package:menu_client/features/category/data/model/category_model.dart';
import 'package:menu_client/features/category/data/provider/remote/category_api.dart';

class CategoryController extends GetxController
    with StateMixin<List<CategoryModel>>, BaseController {
  final CategoryApi categoriesApi = CategoryApi();
  List<CategoryModel> categoryList = <CategoryModel>[].obs;

  Future<void> getCategories() async {
    change(null, status: RxStatus.loading());
    Either<String, List<CategoryModel>> failureOrSuccess =
        await categoriesApi.getCategories();
    failureOrSuccess.fold((String failure) {
      change(null, status: RxStatus.error(failure));
    }, (List<CategoryModel> categories) {
      categoryList = categories.obs;
      if (categoryList.isEmpty) {
        change(null, status: RxStatus.empty());
      } else {
        change(categories, status: RxStatus.success());
      }
    });
  }
}
