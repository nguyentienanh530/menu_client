import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/widget/loading.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_const.dart';
import 'package:menu_client/core/app_res.dart';
import 'package:menu_client/features/cart/view/widget/order_food_bottomsheet.dart';

import '../../core/app_style.dart';
import '../../features/food/data/model/food_model.dart';
import '../../features/food/view/screens/food_detail_screen.dart';

// import 'package:get/get.dart';

// import '../pages/order_page/order_page.dart';

class ListItemFood extends StatelessWidget {
  final List<FoodModel>? list;

  // final getContext = Get.context;

  const ListItemFood({super.key, required this.list});
  Widget _buildImage(FoodModel food, double height) {
    return Container(
        width: double.infinity,
        height: height,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultBorderRadius)),
        child: Image.network(food.image,
            loadingBuilder: (context, child, loadingProgress) =>
                loadingProgress == null
                    ? child
                    : const SizedBox(height: 100, child: Loading()),
            fit: BoxFit.cover));
  }

  Widget _buildPercentDiscount(BuildContext context, FoodModel food) {
    return Container(
        height: 30,
        width: 50,
        decoration: const BoxDecoration(
            color: AppColors.themeColor,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(defaultBorderRadius),
                topLeft: Radius.circular(defaultBorderRadius))),
        child: Center(
            child: Text("${food.discount}%",
                style: kLightWhiteTextStyle.copyWith(
                    fontWeight: FontWeight.bold))));
  }

  Widget _buildTitle(BuildContext context, FoodModel food) {
    return FittedBox(
        alignment: Alignment.centerLeft,
        fit: BoxFit.scaleDown,
        child: Text(food.name,
            overflow: TextOverflow.ellipsis, style: kRegularWhiteTextStyle));
  }

  Widget _buildPriceDiscount(BuildContext context, FoodModel food) {
    double discountAmount = (food.price * food.discount.toDouble()) / 100;
    double discountedPrice = food.price - discountAmount;
    return !food.isDiscount
        ? FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
                AppRes.currencyFormat(double.parse(food.price.toString())),
                style: kLightWhiteTextStyle))
        : FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(children: [
              FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                      AppRes.currencyFormat(
                          double.parse(food.price.toString())),
                      style: kLightWhiteTextStyle.copyWith(
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 3.0,
                          decorationColor: Colors.red,
                          decorationStyle: TextDecorationStyle.solid))),
              const SizedBox(width: 4),
              FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                      AppRes.currencyFormat(
                          double.parse(discountedPrice.toString())),
                      style: kLightWhiteTextStyle))
            ]));
  }

  Widget _buildButtonCart(BuildContext context, FoodModel food) {
    // return OutlinedButton(
    //     // style: ButtonStyle(
    //     //     foregroundColor:
    //     //         MaterialStatePropertyAll(context.colorScheme.secondary)),
    //     onPressed: () {
    //       // Get.bottomSheet();
    //       showModalBottomSheet(
    //           context: context,
    //           isScrollControlled: true,
    //           builder: (context) {
    //             return SizedBox();
    //             //  OrderFoodBottomSheet(foodModel: food)
    //           });
    //     },
    //     child: const FittedBox(
    //         fit: BoxFit.scaleDown, child: Icon(Icons.shopping_cart_rounded)));

    return GestureDetector(
      onTap: () => Get.dialog(
          barrierDismissible: false,
          Dialog(
              backgroundColor: AppColors.white,
              surfaceTintColor: Colors.transparent,
              child: PopScope(child: OrderFoodBottomSheet(foodModel: food)))),
      child: Container(
          height: 30,
          width: 30,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.themeColor),
          child: const Icon(Icons.add, size: 20, color: AppColors.white)),
    );
  }

  Widget _buildListItemFood(List<FoodModel> food) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: list!.length,
        itemBuilder: (context, index) => _buildItem(context, list![index]),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true);
  }

  // Widget _buildItem(BuildContext context, FoodModel foodModel) {
  //   return Padding(
  //     padding: const EdgeInsets.only(right: 16),
  //     child: GestureDetector(
  //         onTap: () {
  //           // context.push(RouteName.foodDetail, extra: foodModel);
  //         },
  //         child: LayoutBuilder(
  //             builder: (context, constraints) => Card(
  //                   color: AppColors.lavender,
  //                   elevation: 10,
  //                   child: SizedBox(
  //                       width: (Get.width / 2) - 32,
  //                       child: Column(
  //                           crossAxisAlignment: CrossAxisAlignment.stretch,
  //                           // mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                           children: <Widget>[
  //                             Stack(children: <Widget>[
  //                               _buildImage(
  //                                   foodModel, constraints.maxHeight * 0.7),
  //                               foodModel.isDiscount == true
  //                                   ? _buildPercentDiscount(context, foodModel)
  //                                   : const SizedBox()
  //                             ]),
  //                             Expanded(
  //                                 flex: 1,
  //                                 child: Padding(
  //                                     padding: const EdgeInsets.all(
  //                                         defaultPadding / 2),
  //                                     child: Column(
  //                                         mainAxisAlignment:
  //                                             MainAxisAlignment.start,
  //                                         crossAxisAlignment:
  //                                             CrossAxisAlignment.start,
  //                                         children: [
  //                                           Expanded(
  //                                               child: _buildTitle(
  //                                                   context, foodModel)),
  //                                           Expanded(
  //                                               child: Row(
  //                                             mainAxisAlignment:
  //                                                 MainAxisAlignment
  //                                                     .spaceBetween,
  //                                             children: [
  //                                               _buildPriceDiscount(
  //                                                   context, foodModel),
  //                                               _buildButtonCart(
  //                                                   context, foodModel)
  //                                             ],
  //                                           )),
  //                                         ])))
  //                           ]
  //                               .animate(interval: 50.ms)
  //                               .slideX(
  //                                   begin: -0.1,
  //                                   end: 0,
  //                                   curve: Curves.easeInOutCubic,
  //                                   duration: 500.ms)
  //                               .fadeIn(
  //                                   curve: Curves.easeInOutCubic,
  //                                   duration: 500.ms))),
  //                 ))),
  //   );
  // }

  Widget _buildItem(BuildContext context, FoodModel foodModel) {
    return GestureDetector(
        onTap: () {
          Get.to(() => FoodDetailScreen(food: foodModel));
        },
        child: LayoutBuilder(
            builder: (context, constraints) => Card(
                  shadowColor: AppColors.transparent,
                  color: AppColors.lavender,
                  margin: const EdgeInsets.only(left: defaultMargin),
                  elevation: 10,
                  child: SizedBox(
                      width: (Get.width / 2) - 32,
                      child: Stack(
                        children: [
                          Stack(children: <Widget>[
                            _buildImage(foodModel, constraints.maxHeight),
                            foodModel.isDiscount == true
                                ? _buildPercentDiscount(context, foodModel)
                                : const SizedBox()
                          ]),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                SizedBox(height: constraints.maxHeight * 0.7),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.black
                                                .withOpacity(0.7),
                                            borderRadius: const BorderRadius
                                                .only(
                                                bottomLeft: Radius.circular(
                                                    defaultBorderRadius),
                                                bottomRight: Radius.circular(
                                                    defaultBorderRadius))),
                                        padding: const EdgeInsets.all(
                                            defaultPadding / 2),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                  child: _buildTitle(
                                                      context, foodModel)),
                                              Expanded(
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                    _buildPriceDiscount(
                                                        context, foodModel),
                                                    _buildButtonCart(
                                                        context, foodModel)
                                                  ]))
                                            ])))
                              ]
                                  .animate(interval: 50.ms)
                                  .slideX(
                                      begin: -0.1,
                                      end: 0,
                                      curve: Curves.easeInOutCubic,
                                      duration: 500.ms)
                                  .fadeIn(
                                      curve: Curves.easeInOutCubic,
                                      duration: 500.ms)),
                        ],
                      )),
                )));
  }

  @override
  Widget build(BuildContext context) {
    return _buildListItemFood(list ?? <FoodModel>[]);
  }
}

class Food {}
