import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/widget/loading.dart';
import 'package:menu_client/common/widget/retry_dialog.dart';
import 'package:menu_client/core/api_config.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_const.dart';
import 'package:menu_client/core/app_res.dart';
import 'package:menu_client/features/food/controller/food_controller.dart';
import 'package:menu_client/features/food/view/screens/food_detail_screen.dart';
import 'package:tiengviet/tiengviet.dart';
import '../../../../common/widget/common_text_field.dart';
import '../../../../common/widget/empty_screen.dart';
import '../../../../core/app_asset.dart';
import '../../data/model/food_model.dart';

class SearchFoodScreen extends StatefulWidget {
  const SearchFoodScreen({super.key});

  @override
  State<SearchFoodScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SearchFoodScreen>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _searchController = TextEditingController();
  final foodCtrl = Get.put(FoodsController());

  @override
  void dispose() {
    _searchController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                        color: AppColors.smokeWhite,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(defaultBorderRadius * 4),
                            topRight:
                                Radius.circular(defaultBorderRadius * 4))),
                    child: Obx(() => Padding(
                          padding: const EdgeInsets.only(top: defaultPadding),
                          child: SearchFoodView(
                              textSearch: foodCtrl.textSearch.value),
                        ))))
          ])
        ]));

    // Scaffold(
    //     appBar: _buildAppbar(context),
    //     body: Obx(() => SearchFoodView(textSearch: foodCtrl.textSearch.value)));
  }

  @override
  bool get wantKeepAlive => true;

  _buildAppbar(BuildContext context) {
    return AppBar(
        backgroundColor: AppColors.transparent,
        foregroundColor: AppColors.white,
        title: _buildSearch(context)
            .animate()
            .slideX(
                begin: 0.3,
                end: 0,
                curve: Curves.easeInOutCubic,
                duration: 500.ms)
            .fadeIn(curve: Curves.easeInOutCubic, duration: 500.ms));
  }

  Widget _buildSearch(BuildContext context) {
    return SizedBox(
        height: 40,
        child: CommonTextField(
            controller: _searchController,
            onChanged: (value) => foodCtrl.textSearch.value = value,
            hintText: "Tìm kiếm",
            suffixIcon: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  // foodCtrl.textSearch.value = '';
                  _searchController.clear();
                }),
            prefixIcon: const Icon(Icons.search)));
  }
}

class SearchFoodView extends StatelessWidget {
  const SearchFoodView({super.key, required this.textSearch});

  final String textSearch;
  @override
  Widget build(BuildContext context) {
    return AfterSearchUI(text: textSearch)
        .animate()
        .slideX(
            begin: -0.1, end: 0, curve: Curves.easeInOutCubic, duration: 500.ms)
        .fadeIn(curve: Curves.easeInOutCubic, duration: 500.ms);
  }
}

class AfterSearchUI extends StatefulWidget {
  const AfterSearchUI({super.key, this.text});
  final String? text;

  @override
  State<AfterSearchUI> createState() => _AfterSearchUIState();
}

class _AfterSearchUIState extends State<AfterSearchUI> {
  final foodCtrl = Get.put(FoodsController());
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() {
    if (!mounted) return;
    foodCtrl.fetchFoods();
  }

  @override
  Widget build(BuildContext context) {
    var text = widget.text;

    return foodCtrl.obx(
      (state) => _buildBody(state ?? <FoodModel>[], text ?? ''),
      onEmpty: const EmptyScreen(),
      onLoading: const Loading(),
      onError: (error) =>
          RetryDialog(title: error ?? '', onRetryPressed: () => getData()),
    );
  }

  _buildBody(List<FoodModel> foods, String text) => ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: foods.length,
      itemBuilder: (context, i) {
        if (foods[i]
                .name
                .toString()
                .toLowerCase()
                .contains(text.toLowerCase()) ||
            TiengViet.parse(foods[i].name.toString().toLowerCase())
                .contains(text.toLowerCase())) {
          return _buildItemSearch(context, foods[i]);
        }
        return const SizedBox();
      });

  Widget _buildItemSearch(BuildContext context, FoodModel food) {
    return GestureDetector(
        onTap: () => Get.to(() => FoodDetailScreen(food: food)),
        child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding / 5),
            child: Card(
                // color: AppColors.lavender,
                shadowColor: AppColors.lavender,
                elevation: 4,
                borderOnForeground: false,
                child: SizedBox(
                    height: 80,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildImage(food),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  _buildTitle(context, food),
                                  // _buildCategory(context, food),
                                  _buildPrice(context, food)
                                ]),
                          ),
                          const SizedBox(width: 8)
                        ]
                            .animate(interval: 50.ms)
                            .slideX(
                                begin: -0.1,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 500.ms)
                            .fadeIn(
                                curve: Curves.easeInOutCubic,
                                duration: 500.ms))))));
  }

  Widget _buildImage(FoodModel food) {
    return Container(
        margin: const EdgeInsets.all(defaultPadding / 2),
        height: 80,
        width: 80,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(0.3),
            image: DecorationImage(
                image:
                    NetworkImage('${ApiConfig.host}${food.photoGallery.first}'),
                fit: BoxFit.cover)));
  }

  Widget _buildTitle(BuildContext context, FoodModel food) {
    return FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          food.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ));
  }

  Widget _buildPrice(BuildContext context, FoodModel food) {
    double discountAmount = (food.price * food.discount.toDouble()) / 100;
    double discountedPrice = food.price - discountAmount;
    return food.isDiscount == false
        ? Text(AppRes.currencyFormat(double.parse(food.price.toString())),
            style: const TextStyle(
                color: AppColors.themeColor, fontWeight: FontWeight.bold))
        : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(children: [
              Text(AppRes.currencyFormat(double.parse(food.price.toString())),
                  style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 3.0,
                      decorationColor: Colors.red,
                      decorationStyle: TextDecorationStyle.solid,
                      // fontSize: defaultSizeText,
                      color: Color.fromARGB(255, 131, 128, 126),
                      fontWeight: FontWeight.w700)),
              const SizedBox(width: 10.0),
              Text(
                  AppRes.currencyFormat(
                      double.parse(discountedPrice.toString())),
                  style: const TextStyle(
                      color: AppColors.themeColor, fontWeight: FontWeight.bold))
            ])
          ]);
  }

  // Widget _buildPercentDiscount(FoodModel food) {
  //   return Container(
  //       height: 80,
  //       width: 80,
  //       // decoration: BoxDecoration(color: redColor),
  //       // child: Center(child: CommonLineText(value: "${food.discount}%")
  //       child: Text("${food.discount}%",
  //           style: TextStyle(
  //               fontSize: 16,
  //               // color: textColor,
  //               // fontFamily: Constant.font,
  //               fontWeight: FontWeight.w600)));
  // }
}
