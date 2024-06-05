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
import 'package:menu_client/features/food/controller/food_controller.dart';
import 'package:menu_client/features/home/view/widget/categories.dart';
import 'package:badges/badges.dart' as badges;
import '../../../../common/widget/list_item_food.dart';
import '../../../category/controller/category_controller.dart';
import '../widget/banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final newFoodsCtrl = Get.put(FoodController());
  final popularFoodsCtrl = Get.put(PopularFoodController());
  final categoriesCtrl = Get.put(CategoryController());
  final bannerCtrl = Get.put(BannerController());
  final cartCtrl = Get.put(CartController());

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
              title:
                  const Text('Minh Long Menu', style: kSemiBoldWhiteTextStyle),
              actions: [_buildTableButton()]),
          SliverToBoxAdapter(
              child: Column(
            children: [
              const SizedBox(height: defaultPadding),
              _buildCategories(),
              const SizedBox(height: defaultPadding),
              _buildNewFoods(),
              const SizedBox(height: defaultPadding),
              _buildPopularFoods(),
              const SizedBox(height: defaultPadding),
            ],
          )),
        ]));
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
                    colorFilter: const ColorFilter.mode(
                        Colors.white, BlendMode.srcIn))))));
  }

  Widget _buildTableButton() {
    // final table = context.watch<TableCubit>().state;
    return Container(
        margin: const EdgeInsets.only(right: defaultPadding),
        height: 35,
        width: 35,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.fountainBlue.withOpacity(0.5)),
        // width: 60,
        child: const Icon(Icons.local_dining_rounded,
            color: AppColors.white, size: 20));
  }

  Widget _buildBanner() {
    return bannerCtrl.obx((state) {
      return BannerWidget(banners: state);
    },
        onEmpty: const EmptyWidget(),
        onLoading: Card(
          margin: const EdgeInsets.all(defaultMargin),
          color: AppColors.lavender,
          child: SizedBox(height: Get.height * 0.3, child: const Loading()),
        ),
        onError: (error) => RetryDialog(
            title: "$error", onRetryPressed: () => bannerCtrl.getBanners()));
  }

  Widget _buildNewFoods() {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
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
        ],
      ),
    );
  }

  Widget _buildPopularFoods() {
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
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
        ],
      ),
    );
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
              onRetryPressed: () => categoriesCtrl.getCategories())),
    );
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
}
