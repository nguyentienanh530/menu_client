import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menu_client/common/widget/error_build_image.dart';
import 'package:menu_client/common/widget/loading.dart';
import 'package:menu_client/core/api_config.dart';
import 'package:menu_client/core/app_colors.dart';
import 'package:menu_client/core/app_style.dart';
import 'package:menu_client/features/food/view/screens/food_screen.dart';
import '../../../category/data/model/category_model.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, this.categories});
  final List<CategoryModel>? categories;

  @override
  Widget build(BuildContext context) {
    return _buildBody(categories ?? <CategoryModel>[]);
  }

  Widget _buildBody(List<CategoryModel> categories) {
    List<CategoryModel> modifiableList = List.from(categories);
    modifiableList.sort((a, b) => a.serial.compareTo(b.serial));
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, mainAxisSpacing: 8, crossAxisSpacing: 8),
        physics: const NeverScrollableScrollPhysics(),
        // scrollDirection: Axis.horizontal,
        itemCount: modifiableList.length,
        itemBuilder: (context, index) =>
            _buildItemCategory(context, modifiableList[index]));
  }

  Widget _buildItemCategory(BuildContext context, CategoryModel categoryModel) {
    return GestureDetector(
        onTap: () => Get.to(() => FoodScreen(
            category: categoryModel, modeScreen: ModeScreen.foodsOnCategory)),
        child: Card(
            color: AppColors.lavender,
            shadowColor: AppColors.lavender,
            elevation: 4,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                          padding: const EdgeInsets.all(8),
                          child: CachedNetworkImage(
                              imageUrl:
                                  '${ApiConfig.host}${categoryModel.image}',
                              placeholder: (context, url) => const Loading(),
                              errorWidget: errorBuilderForImage))),
                  Expanded(
                      child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.center,
                          child: Text(categoryModel.name,
                              style: kBodyStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis)))
                ])));
  }
}
