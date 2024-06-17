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
import '../../../../core/app_asset.dart';
import '../../../cart/controller/cart_controller.dart';
import '../../../category/data/model/category_model.dart';
import '../../controller/food_on_category_controller.dart';
import '../../controller/new_food_controller.dart';
import '../../controller/populer_food_controller.dart';

enum ModeScreen { foodsOnCategory, newsFoods, popularFoods }

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key, this.category, required this.modeScreen});
  final CategoryModel? category;
  final ModeScreen modeScreen;

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  final _foodsOnCategoryCtrl = Get.put(FoodsOnCategoryController());
  final cartCtrl = Get.put(CartController());
  final newFoodsCtrl = Get.put(NewFoodsController());
  final popularFoodCtrl = Get.put(PopularFoodController());
  CategoryModel _category = CategoryModel();
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() {
    if (widget.modeScreen == ModeScreen.foodsOnCategory) {
      _category = widget.category!;
      _foodsOnCategoryCtrl.getFoodsOnCategory(categoryID: _category.id);
    } else if (widget.modeScreen == ModeScreen.newsFoods) {
      newFoodsCtrl.getNewFoods();
    } else {
      popularFoodCtrl.getPopularFoods();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.themeColor,
        body: Stack(children: [
          Image.asset(AppAsset.background,
              color: AppColors.black.withOpacity(0.15)),
          _buildAppbar(context),
          Column(children: [
            const SizedBox(height: 100),
            Expanded(
                child: Container(
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(defaultBorderRadius * 4),
                            topRight:
                                Radius.circular(defaultBorderRadius * 4))),
                    child: Padding(
                        padding: const EdgeInsets.only(
                            top: defaultPadding, bottom: defaultPadding),
                        child: _buildBody())))
          ])
        ]));

    //  Scaffold(
    //     appBar: _buildAppbar(context),
    //     body: Padding(
    //         padding: const EdgeInsets.only(
    //             top: defaultPadding, bottom: defaultPadding),
    //         child: _foodsOnCategoryCtrl.obx(
    //             (state) => GridItemFood(list: state, isScroll: true),
    //             onEmpty: const EmptyScreen(),
    //             onLoading: const Loading(),
    //             onError: (error) => RetryDialog(
    //                 title: error ?? "",
    //                 onRetryPressed: () {
    //                   _foodsOnCategoryCtrl.getFoodsOnCategory(
    //                       categoryID: _category.id);
    //                 }))));
  }

  Widget _buildBody() {
    if (widget.modeScreen == ModeScreen.foodsOnCategory) {
      return _foodsOnCategoryCtrl.obx(
          (state) => GridItemFood(list: state, isScroll: true),
          onEmpty: const EmptyScreen(),
          onLoading: const Loading(),
          onError: (error) => RetryDialog(
              title: error ?? "",
              onRetryPressed: () {
                _foodsOnCategoryCtrl.getFoodsOnCategory(
                    categoryID: _category.id);
              }));
    } else if (widget.modeScreen == ModeScreen.newsFoods) {
      return newFoodsCtrl.obx(
          (state) => GridItemFood(list: state, isScroll: true),
          onEmpty: const EmptyScreen(),
          onLoading: const Loading(),
          onError: (error) => RetryDialog(
              title: error ?? "",
              onRetryPressed: () {
                newFoodsCtrl.getNewFoods();
              }));
    } else {
      return popularFoodCtrl.obx(
          (state) => GridItemFood(list: state, isScroll: true),
          onEmpty: const EmptyScreen(),
          onLoading: const Loading(),
          onError: (error) => RetryDialog(
              title: error ?? "",
              onRetryPressed: () {
                popularFoodCtrl.getPopularFoods();
              }));
    }
  }

  _buildAppbar(BuildContext context) => AppBar(
          centerTitle: true,
          backgroundColor: AppColors.transparent,
          foregroundColor: AppColors.white,
          title: Text(_category.name, style: kMediumWhiteTextStyle),
          actions: [
            CartButton(
                onPressed: () => Get.to(() => CartScreen()),
                number: cartCtrl.order.value.orderDetail.length.toString())
          ]);
}
