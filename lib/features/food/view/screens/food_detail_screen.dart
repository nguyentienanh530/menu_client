import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/widget/error_build_image.dart';
import 'package:menu_client/common/widget/loading.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_res.dart';
import 'package:menu_client/features/cart/view/screen/cart_screen.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/widget/cart_button.dart';
import '../../../../core/app_const.dart';
import '../../../../core/app_string.dart';
import '../../../../core/app_style.dart';
import '../../../cart/view/widget/order_food_bottomsheet.dart';
import '../../data/model/food_model.dart';

class FoodDetailScreen extends StatelessWidget {
  const FoodDetailScreen({super.key, this.food});
  final FoodModel? food;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppbar(context), body: FoodDetailView(food: food!));
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
        title: Text(AppString.titleFoodDetail, style: kRegularWhiteTextStyle),
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.themeColor,
        centerTitle: true,
        actions: [CartButton(onPressed: () => Get.to(() => CartScreen()))]);
  }
}

class FoodDetailView extends StatefulWidget {
  const FoodDetailView({super.key, required this.food});
  final FoodModel food;

  @override
  State<FoodDetailView> createState() => _FoodDetailViewState();
}

class _FoodDetailViewState extends State<FoodDetailView> {
  @override
  Widget build(BuildContext context) {
    return _buildBody(context, widget.food);
  }

  Widget _buildBody(BuildContext context, FoodModel food) {
    return Column(children: [
      Expanded(
          child: Stack(
        children: [
          SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ImageFood(food: food),
                    const SizedBox(height: defaultPadding),
                    _buildTitle(context, food),
                    Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: _buildPrice(context, food)),
                    _buildDescription(context, food),
                    food.photoGallery.isNotEmpty
                        ? _Gallery(food: food)
                        : const SizedBox()
                  ]
                      .animate(interval: 50.ms)
                      .slideX(
                          begin: -0.1,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 500.ms)
                      .fadeIn(curve: Curves.easeInOutCubic, duration: 500.ms))),
        ],
      )),
      Card(
        margin: const EdgeInsets.all(defaultPadding),
        shadowColor: AppColors.transparent,
        color: AppColors.lavender,
        child: Container(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppString.totalPrice, style: kThinBlackTextStyle),
                        _buildPrice(context, food)
                      ]),
                  const SizedBox(height: defaultPadding),
                  _buildAddToCart(context, food)
                ])),
      )
    ]);
  }

  Widget _buildAddToCart(BuildContext context, FoodModel food) {
    return GestureDetector(
        onTap: () => Get.dialog(
            barrierDismissible: false,
            Dialog(
                backgroundColor: AppColors.white,
                surfaceTintColor: Colors.transparent,
                child: PopScope(child: OrderFoodBottomSheet(foodModel: food)))),
        child: Container(
            height: 45,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                color: AppColors.themeColor),
            child: Text(AppString.addToCart, style: kLightWhiteTextStyle)));
  }

  Widget _buildDescription(BuildContext context, FoodModel food) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding / 2),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Mô tả',
              style: kRegularTextStyle.copyWith(fontWeight: FontWeight.bold)),
          ReadMoreText(food.description,
              trimLines: 8,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Xem thêm...',
              trimExpandedText: 'ẩn bớt',
              style: kThinBlackTextStyle,
              lessStyle:
                  kThinBlackTextStyle.copyWith(color: AppColors.themeColor),
              moreStyle:
                  kThinBlackTextStyle.copyWith(color: AppColors.themeColor))
        ]));
  }

  Widget _buildTitle(BuildContext context, FoodModel food) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding / 2),
        child: Text(food.name,
            style: kRegularTextStyle.copyWith(fontWeight: FontWeight.bold)));
  }

  Widget _buildPrice(BuildContext context, FoodModel food) {
    double discountAmount = (food.price * food.discount.toDouble()) / 100;
    double discountedPrice = food.price - discountAmount;
    return !food.isDiscount
        ? Text(AppRes.currencyFormat(double.parse(food.price.toString())),
            style: kRegularTextStyle.copyWith(
                fontWeight: FontWeight.bold, color: AppColors.themeColor))
        : Row(children: [
            Text(AppRes.currencyFormat(double.parse(food.price.toString())),
                style: kRegularTextStyle.copyWith(
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 3.0,
                    decorationColor: Colors.red,
                    decorationStyle: TextDecorationStyle.solid)),
            const SizedBox(width: 4),
            Text(
                AppRes.currencyFormat(double.parse(discountedPrice.toString())),
                style: kRegularTextStyle.copyWith(
                    fontWeight: FontWeight.bold, color: AppColors.themeColor))
          ]);
  }
}

class _ImageFood extends StatelessWidget {
  const _ImageFood({required this.food});
  final FoodModel food;
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: 'hero-tag-${food.id}-search',
        child: Material(
            child: Container(
                height: Get.height * 0.4,
                width: double.infinity,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(),
                child: CachedNetworkImage(
                    imageUrl: food.image,
                    placeholder: (context, url) => const Loading(),
                    errorWidget: errorBuilderForImage,
                    fit: BoxFit.cover))));
  }
}

class _Gallery extends StatelessWidget {
  const _Gallery({required this.food});
  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding / 2),
          child: Text('Thư viện hình ảnh',
              style: kRegularTextStyle.copyWith(fontWeight: FontWeight.bold))),
      SizedBox(
        height: Get.height * 0.15,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(
                left: defaultPadding,
                top: defaultPadding / 2,
                bottom: defaultPadding / 2),
            child: _buildImage(context, food.photoGallery[index]),
          ),
          itemCount: food.photoGallery.length,
        ),
      )
    ]);
  }

  Widget _buildImage(BuildContext context, String item) {
    return InkWell(
        onTap: () {
          viewImage(context, item);
        },
        child: Container(
            height: Get.height * 0.15,
            width: Get.width / 3.8,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                // image: DecorationImage(
                //     image: NetworkImage(item), fit: BoxFit.cover),
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5.0,
                      color: Colors.black12.withOpacity(0.1),
                      spreadRadius: 2.0)
                ]),
            child: CachedNetworkImage(
                imageUrl: item,
                placeholder: (context, url) => const Loading(),
                errorWidget: errorBuilderForImage,
                fit: BoxFit.cover)));
  }

  viewImage(BuildContext context, String item) {
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (BuildContext context, _, __) {
          return Material(
              clipBehavior: Clip.antiAlias,
              elevation: 18.0,
              color: AppColors.white,
              child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Container(
                        height: Get.width * 0.9,
                        width: Get.width * 0.9,
                        decoration: BoxDecoration(
                            color: AppColors.themeColor,
                            borderRadius:
                                BorderRadius.circular(defaultBorderRadius),
                            image: DecorationImage(
                                fit: BoxFit.cover, image: NetworkImage(item)))),
                    IconButton(
                        iconSize: 30,
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.highlight_remove_sharp),
                        color: AppColors.themeColor)
                  ])));
        },
        transitionDuration: const Duration(milliseconds: 500)));
  }
}
