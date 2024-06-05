import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/widget/empty_widget.dart';
import 'package:menu_client/common/widget/grid_item_food.dart';
import 'package:menu_client/common/widget/loading.dart';
import 'package:menu_client/common/widget/retry_dialog.dart';
import 'package:menu_client/core/app_asset.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_const.dart';
import 'package:menu_client/core/app_string.dart';
import 'package:menu_client/core/app_style.dart';
import 'package:menu_client/core/extensions.dart';
import 'package:menu_client/features/banner/controller/banner_controller.dart';
import 'package:menu_client/features/cart/controller/cart_controller.dart';
import 'package:menu_client/features/cart/view/screen/cart_screen.dart';
import 'package:menu_client/features/food/controller/new_food_controller.dart';
import 'package:menu_client/features/food/view/screens/food_screen.dart';
import 'package:menu_client/features/home/view/widget/categories.dart';
import 'package:badges/badges.dart' as badges;
import 'package:menu_client/features/table/controller/table_controller.dart';
import 'package:menu_client/features/table/view/widgets/table_screen.dart';
import '../../../../common/widget/list_item_food.dart';
import '../../../category/controller/category_controller.dart';
import '../../../food/controller/populer_food_controller.dart';
import '../widget/banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final newFoodsCtrl = Get.put(NewFoodController());
  final popularFoodsCtrl = Get.put(PopularFoodController());
  final categoriesCtrl = Get.put(CategoryController());
  final bannerCtrl = Get.put(BannerController());
  final cartCtrl = Get.put(CartController());
  final tableCtrl = Get.put(TableController());

  @override
  void initState() {
    newFoodsCtrl.getNewFoodsLimit();
    popularFoodsCtrl.getPopularFoodsLimit();
    categoriesCtrl.getCategories();
    bannerCtrl.getBanners();
    super.initState();
  }

  @override
  void dispose() {
    tableCtrl.dispose();
    newFoodsCtrl.dispose();
    popularFoodsCtrl.dispose();
    categoriesCtrl.dispose();
    bannerCtrl.dispose();
    cartCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _buildFloatingButton(),
        body: CustomScrollView(slivers: [
          SliverAppBar(
              expandedHeight: Get.height * 0.3,
              floating: false,
              pinned: true,
              backgroundColor: AppColors.themeColor,
              flexibleSpace: FlexibleSpaceBar(background: _buildBanner()),
              title: _buildSearch(),
              actions: [_buildTableButton(), _buildSettingButton()]),
          SliverToBoxAdapter(
              child: Column(children: [
            const SizedBox(height: defaultPadding),
            _buildCategories(),
            const SizedBox(height: defaultPadding),
            _buildNewFoods(),
            const SizedBox(height: defaultPadding),
            _buildPopularFoods(),
            const SizedBox(height: defaultPadding)
          ]))
        ]));
  }

  Widget _buildSearch() {
    return GestureDetector(
        onTap: () => Get.to(() => const FoodScreen()),
        child: Container(
            height: 35,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultPadding / 2),
                color: AppColors.white),
            child: Row(children: [
              const SizedBox(width: 8),
              Row(children: [
                Icon(Icons.search,
                    size: 20, color: AppColors.black.withOpacity(0.8)),
                const SizedBox(width: 8),
                Text('Tìm kiếm món ăn...',
                    style: context.textStyleSmall!
                        .copyWith(color: AppColors.black.withOpacity(0.8)))
              ])
            ])));
  }

  Widget _buildFloatingButton() {
    return Obx(() => FloatingActionButton(
        backgroundColor: AppColors.themeColor,
        onPressed: () => Get.to(() => CartScreen()),
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: badges.Badge(
                badgeStyle:
                    const badges.BadgeStyle(badgeColor: AppColors.islamicGreen),
                position: badges.BadgePosition.topEnd(top: -14),
                badgeContent: Text(cartCtrl.order.value.foods.length.toString(),
                    style: kThinWhiteTextStyle),
                child: SvgPicture.asset(AppAsset.shoppingCart,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                        Colors.white, BlendMode.srcIn))))));
  }

  Widget _buildTableButton() {
    return Obx(() {
      var table = tableCtrl.table.value.name;
      return GestureDetector(
          onTap: () => _showTableDialog(),
          child: Container(
              margin: const EdgeInsets.only(right: defaultPadding),
              height: 35,
              width: table.isEmpty ? 35 : null,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: table.isEmpty ? BoxShape.circle : BoxShape.rectangle,
                  borderRadius: table.isEmpty
                      ? null
                      : BorderRadius.circular(defaultBorderRadius / 2),
                  color: AppColors.white),
              child: table.isEmpty
                  ? SvgPicture.asset(AppAsset.handPlatter,
                      height: 18,
                      width: 18,
                      colorFilter: const ColorFilter.mode(
                          AppColors.themeColor, BlendMode.srcIn))
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: Text(tableCtrl.table.value.name,
                          style: kThinWhiteTextStyle.copyWith(
                              color: AppColors.themeColor)))));
    });
  }

  Widget _buildSettingButton() {
    return GestureDetector(
        onTap: () {},
        child: Container(
            margin: const EdgeInsets.only(right: defaultPadding),
            height: 35,
            width: 35,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: AppColors.white),
            child: SvgPicture.asset(AppAsset.setting,
                height: 18,
                width: 18,
                colorFilter: const ColorFilter.mode(
                    AppColors.themeColor, BlendMode.srcIn))));
  }

  Widget _buildBanner() {
    return bannerCtrl.obx((state) {
      return BannerWidget(banners: state);
    },
        onEmpty: const EmptyWidget(),
        onLoading: Container(
            color: AppColors.lavender,
            height: Get.height * 0.3,
            child: const Loading()),
        onError: (error) => RetryDialog(
            title: "$error", onRetryPressed: () => bannerCtrl.getBanners()));
  }

  Widget _buildNewFoods() {
    return Container(
        color: AppColors.white,
        child: Column(children: [
          _buildTitle(AppString.newFoods, () => {}),
          newFoodsCtrl.obx((state) {
            return SizedBox(
                height: Get.height * 0.25, child: ListItemFood(list: state));
          },
              onEmpty: const EmptyWidget(),
              onLoading: const Loading(),
              onError: (error) => RetryDialog(
                  title: "$error",
                  onRetryPressed: () => newFoodsCtrl.getNewFoodsLimit())),
          const SizedBox(height: defaultPadding)
        ]));
  }

  Widget _buildPopularFoods() {
    return Container(
        color: AppColors.white,
        child: Column(children: [
          _buildTitle(AppString.popularFood, () => {}),
          popularFoodsCtrl.obx((state) {
            return GridItemFood(list: state);
          },
              onEmpty: const EmptyWidget(),
              onLoading: const Loading(),
              onError: (error) => RetryDialog(
                  title: "$error",
                  onRetryPressed: () =>
                      popularFoodsCtrl.getPopularFoodsLimit())),
          const SizedBox(height: defaultPadding)
        ]));
  }

  Widget _buildCategories() {
    return Container(
        color: AppColors.white,
        padding: const EdgeInsets.all(defaultPadding),
        child: categoriesCtrl.obx((state) {
          return Categories(categories: state);
        },
            onEmpty: const EmptyWidget(),
            onLoading: const Loading(),
            onError: (error) => RetryDialog(
                title: "$error",
                onRetryPressed: () => categoriesCtrl.getCategories())));
  }

  Widget _buildTitle(String title, Function()? onTap) {
    return Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(title,
              style: kMediumTextStyle.copyWith(fontWeight: FontWeight.bold)),
          GestureDetector(
              onTap: onTap,
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Text('Xem tất cả',
                    style: kThinBlackTextStyle.copyWith(
                        fontStyle: FontStyle.italic,
                        color: AppColors.themeColor)),
                Icon(Icons.navigate_next_rounded,
                    size: 15, color: context.colorScheme.error)
              ]))
        ]));
  }

  _showTableDialog() async {
    await Get.dialog(
        barrierDismissible: false,
        const Dialog(
            backgroundColor: AppColors.white,
            surfaceTintColor: Colors.transparent,
            child: TableDialog()));
  }
}
