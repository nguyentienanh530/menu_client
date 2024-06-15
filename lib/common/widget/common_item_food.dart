import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import '../../core/api_config.dart';
import '../../core/app_colors.dart';
import '../../core/app_const.dart';
import '../../core/app_res.dart';
import '../../core/app_style.dart';
import '../../features/cart/view/widget/order_food_bottomsheet.dart';
import '../../features/food/data/model/food_model.dart';
import '../../features/food/view/screens/food_detail_screen.dart';
import 'error_build_image.dart';
import 'loading.dart';

class CommonItemFood extends StatelessWidget {
  const CommonItemFood({super.key, required this.foodModel});
  final FoodModel foodModel;
  @override
  Widget build(BuildContext context) {
    return _buildItem(context, foodModel);
  }

  Widget _buildImage(FoodModel food, double height) {
    return Container(
        width: double.infinity,
        height: height,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultBorderRadius)),
        child: CachedNetworkImage(
            imageUrl: '${ApiConfig.host}${food.image}',
            placeholder: (context, url) => const Loading(),
            errorWidget: errorBuilderForImage,
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
    return Padding(
        padding: const EdgeInsets.all(defaultPadding / 2),
        child: FittedBox(
            alignment: Alignment.centerLeft,
            fit: BoxFit.scaleDown,
            child: Text(food.name,
                overflow: TextOverflow.ellipsis,
                style: kRegularWhiteTextStyle)));
  }

  Widget _buildPriceDiscount(BuildContext context, FoodModel food) {
    double discountAmount = (food.price * food.discount.toDouble()) / 100;
    double discountedPrice = food.price - discountAmount;
    return Padding(
        padding: const EdgeInsets.all(defaultPadding / 2),
        child: !food.isDiscount
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
                ])));
  }

  Widget _buildButtonCart(BuildContext context, FoodModel food) {
    return GestureDetector(
        onTap: () => Get.dialog(
            barrierDismissible: false,
            Dialog(
                backgroundColor: AppColors.white,
                surfaceTintColor: Colors.transparent,
                child: PopScope(child: OrderFoodBottomSheet(foodModel: food)))),
        child: Container(
            height: double.infinity,
            width: 30,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: AppColors.themeColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(defaultBorderRadius),
                    bottomRight: Radius.circular(defaultBorderRadius))),
            child: const Icon(Icons.add, size: 20, color: AppColors.white)));
  }

  Widget _buildItem(BuildContext context, FoodModel foodModel) {
    return GestureDetector(
        onTap: () {
          Get.to(() => FoodDetailScreen(food: foodModel));
        },
        child: LayoutBuilder(
            builder: (context, constraints) => Card(
                  shadowColor: AppColors.transparent,
                  color: AppColors.lavender,
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
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.black
                                                .withOpacity(0.75),
                                            borderRadius: const BorderRadius
                                                .only(
                                                bottomLeft: Radius.circular(
                                                    defaultBorderRadius),
                                                bottomRight: Radius.circular(
                                                    defaultBorderRadius))),
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
}
