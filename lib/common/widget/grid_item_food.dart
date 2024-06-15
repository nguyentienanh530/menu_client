import 'package:flutter/material.dart';
import 'package:menu_client/common/widget/common_item_food.dart';
import 'package:menu_client/core/app_const.dart';
import '../../features/food/data/model/food_model.dart';

class GridItemFood extends StatelessWidget {
  final List<FoodModel>? list;
  final bool? isScroll;

  const GridItemFood({super.key, required this.list, this.isScroll = false});

  Widget _buildGridItemFood(BuildContext contextt, List<FoodModel> food) {
    return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        shrinkWrap: true,
        physics: isScroll!
            ? const BouncingScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        itemCount: food.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: defaultPadding,
            crossAxisSpacing: defaultPadding,
            crossAxisCount: 2),
        itemBuilder: (context, index) =>
            CommonItemFood(foodModel: food[index]));
  }

  @override
  Widget build(BuildContext context) {
    return _buildGridItemFood(context, list!);
  }
}
