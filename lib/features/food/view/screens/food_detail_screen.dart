import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/widget/error_build_image.dart';
import 'package:menu_client/common/widget/loading.dart';
import 'package:menu_client/core/app_asset.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_res.dart';
import 'package:menu_client/features/cart/view/screen/cart_screen.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart' as indicator;
import '../../../../common/widget/cart_button.dart';
import '../../../../core/api_config.dart';
import '../../../../core/app_const.dart';
import '../../../../core/app_string.dart';
import '../../../../core/app_style.dart';
import '../../../cart/controller/cart_controller.dart';
import '../../../cart/view/widget/order_food_bottomsheet.dart';
import '../../data/model/food_model.dart';

class FoodDetailScreen extends StatelessWidget {
  FoodDetailScreen({super.key, this.food});
  final FoodModel? food;
  final cartCtrl = Get.put(CartController());

  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  final indexPage = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.themeColor,
        body: Stack(children: [
          Image.asset(AppAsset.background,
              color: AppColors.black.withOpacity(0.15)),
          _buildAppbar(context),
          Column(children: [SizedBox(height: Get.height * 0.5)]),
          Column(children: [
            const SizedBox(height: 80),
            Expanded(child: _buildBody(context, food!))
          ]),
        ]));
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
        // title: Text(AppString.titleFoodDetail, style: kRegularWhiteTextStyle),
        title: ValueListenableBuilder(
            valueListenable: indexPage,
            builder: (context, value, child) =>
                _buildIndicator(context, food!.photoGallery.length)),
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.transparent,
        centerTitle: true,
        actions: [
          Obx(() => Padding(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: CartButton(
                    onPressed: () => Get.to(() => CartScreen()),
                    number: cartCtrl.order.value.orderDetail.length.toString()),
              ))
        ]);
  }

  Widget _buildImageFood(FoodModel food) {
    return CarouselSlider.builder(
        itemBuilder: (context, index, realIndex) =>
            _buildItemImage(food.photoGallery[index]),
        itemCount: food.photoGallery.length,
        options: CarouselOptions(
            onPageChanged: (index, reason) {
              indexPage.value = index;
            },
            enlargeFactor: 0,
            height: double.infinity,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 1000),
            autoPlayCurve: Curves.linearToEaseOut,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal));
  }

  Widget _buildIndicator(BuildContext context, int length) {
    return indicator.AnimatedSmoothIndicator(
        activeIndex: indexPage.value,
        count: length,
        effect: const indicator.ExpandingDotsEffect(
            activeDotColor: AppColors.islamicGreen,
            dotHeight: 5,
            dotWidth: 10,
            dotColor: AppColors.white));
  }

  Widget _buildItemImage(String image) {
    return Center(
      child: Card(
        elevation: 20.0,
        shadowColor: AppColors.themeColor,
        shape: const CircleBorder(),
        child: Container(
            height: Get.height * 0.4,
            width: Get.height * 0.4,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: CachedNetworkImage(
                imageUrl: '${ApiConfig.host}$image',
                placeholder: (context, url) => const Loading(),
                errorWidget: errorBuilderForImage,
                fit: BoxFit.cover)),
      ),
    );
  }

  Widget _buildBody(BuildContext context, FoodModel food) {
    return Column(children: [
      Expanded(
          child: SingleChildScrollView(
              // physics: const BouncingScrollPhysics(),
              child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: Get.height * 0.25),
              Container(
                  height: Get.height,
                  decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(defaultBorderRadius * 4),
                          topRight: Radius.circular(defaultBorderRadius * 4)))),
            ],
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    alignment: Alignment.topCenter,
                    height: Get.height * 0.5,
                    child: _buildImageFood(food)),
                const SizedBox(height: defaultPadding),
                _buildTitle(context, food),
                Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: _buildPrice(context, food)),
                _buildDescription(context, food),
                // food.photoGallery.isNotEmpty
                //     ? _Gallery(food: food)
                //     : const SizedBox()
              ]
                  .animate(interval: 50.ms)
                  .slideX(
                      begin: -0.1,
                      end: 0,
                      curve: Curves.easeInOutCubic,
                      duration: 500.ms)
                  .fadeIn(curve: Curves.easeInOutCubic, duration: 500.ms)),
        ],
      ))),
      Container(
        color: AppColors.smokeWhite,
        child: Card(
          color: AppColors.lavender,
          margin: const EdgeInsets.all(defaultPadding),
          child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppString.totalPrice, style: kBodyStyle),
                          _buildPrice(context, food)
                        ]),
                    const SizedBox(height: defaultPadding),
                    _buildAddToCart(context, food)
                  ])),
        ),
      )
    ]);
  }

  Widget _buildAddToCart(BuildContext context, FoodModel food) {
    return GestureDetector(
        onTap: () {
          // Get.dialog(
          //     barrierDismissible: false,
          //     Dialog(
          //         backgroundColor: AppColors.white,
          //         surfaceTintColor: Colors.transparent,
          //         child:
          //             PopScope(child: OrderFoodBottomSheet(foodModel: food))));
          Get.bottomSheet(OrderFoodBottomSheet(foodModel: food),
              isScrollControlled: true);
        },
        child: Container(
            height: 45,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultBorderRadius),
                color: AppColors.themeColor),
            child: Text(AppString.addToCart, style: kButtonWhiteStyle)));
  }

  Widget _buildDescription(BuildContext context, FoodModel food) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding / 2),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Mô tả',
              style: kSubHeadingStyle.copyWith(fontWeight: FontWeight.bold)),
          ReadMoreText(food.description,
              trimLines: 8,
              trimMode: TrimMode.Line,
              trimCollapsedText: 'Xem thêm...',
              trimExpandedText: 'ẩn bớt',
              style: kBodyStyle,
              lessStyle: kBodyStyle.copyWith(color: AppColors.themeColor),
              moreStyle: kBodyStyle.copyWith(color: AppColors.themeColor))
        ]));
  }

  Widget _buildTitle(BuildContext context, FoodModel food) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding / 2),
        child: Text(food.name,
            style: kHeadingStyle.copyWith(fontWeight: FontWeight.bold)));
  }

  Widget _buildPrice(BuildContext context, FoodModel food) {
    double discountAmount = (food.price * food.discount.toDouble()) / 100;
    double discountedPrice = food.price - discountAmount;
    return !food.isDiscount
        ? Text(AppRes.currencyFormat(double.parse(food.price.toString())),
            style: kBodyStyle.copyWith(
                fontWeight: FontWeight.bold, color: AppColors.themeColor))
        : Row(children: [
            Text(AppRes.currencyFormat(double.parse(food.price.toString())),
                style: kBodyStyle.copyWith(
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 3.0,
                    decorationColor: Colors.red,
                    decorationStyle: TextDecorationStyle.solid)),
            const SizedBox(width: 4),
            Text(
                AppRes.currencyFormat(double.parse(discountedPrice.toString())),
                style: kBodyStyle.copyWith(
                    fontWeight: FontWeight.bold, color: AppColors.themeColor))
          ]);
  }
}

class _Gallery extends StatelessWidget {
  const _Gallery({required this.food});
  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    // var gallery = json.decode(food.photoGallery).cast<String>().toList();

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding, vertical: defaultPadding / 2),
          child: Text('Thư viện hình ảnh',
              style: kSubHeadingStyle.copyWith(fontWeight: FontWeight.bold))),
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
              itemCount: food.photoGallery.length))
    ]);
  }

  Widget _buildImage(BuildContext context, String item) {
    return InkWell(
        onTap: () {
          _viewImage(context, item);
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
                imageUrl: '${ApiConfig.host}$item',
                placeholder: (context, url) => const Loading(),
                errorWidget: errorBuilderForImage,
                fit: BoxFit.cover)));
  }

  void _viewImage(BuildContext context, String item) {
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
                                fit: BoxFit.cover,
                                image:
                                    NetworkImage('${ApiConfig.host}$item')))),
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
