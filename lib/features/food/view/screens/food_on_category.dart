import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/widget/empty_screen.dart';
import 'package:menu_client/common/widget/loading.dart';
import 'package:menu_client/common/widget/retry_dialog.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_const.dart';
import 'package:menu_client/core/app_style.dart';
import 'package:menu_client/features/cart/view/screen/cart_screen.dart';

import '../../../../common/widget/cart_button.dart';
import '../../../../common/widget/grid_item_food.dart';
import '../../../category/data/model/category_model.dart';
import '../../controller/food_on_category_controller.dart';

class FoodOnCategory extends StatefulWidget {
  const FoodOnCategory({super.key, required this.category});
  final CategoryModel category;

  @override
  State<FoodOnCategory> createState() => _FoodOnCategoryState();
}

class _FoodOnCategoryState extends State<FoodOnCategory> {
  final _foodsOnCategoryCtrl = Get.put(FoodsOnCategoryController());
  CategoryModel _category = CategoryModel();
  @override
  void initState() {
    _category = widget.category;
    _foodsOnCategoryCtrl.getFoodsOnCategory(idCategory: _category.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppbar(context),
        body: Padding(
            padding: const EdgeInsets.only(
                top: defaultPadding, bottom: defaultPadding),
            child: _foodsOnCategoryCtrl.obx(
                (state) => GridItemFood(list: state, isScroll: true),
                onEmpty: const EmptyScreen(),
                onLoading: const Loading(),
                onError: (error) => RetryDialog(
                    title: error ?? "",
                    onRetryPressed: () => _foodsOnCategoryCtrl
                        .getFoodsOnCategory(idCategory: _category.id)))));
  }

  _buildAppbar(BuildContext context) => AppBar(
      centerTitle: true,
      backgroundColor: AppColors.themeColor,
      foregroundColor: AppColors.white,
      title: Text(_category.name, style: kMediumWhiteTextStyle),
      actions: [CartButton(onPressed: () => Get.to(() => CartScreen()))]);
}
