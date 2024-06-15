import 'package:flutter/material.dart';
import 'package:menu_client/core/app_const.dart';
import '../../features/food/data/model/food_model.dart';
import 'common_item_food.dart';

class ListItemFood extends StatelessWidget {
  final List<FoodModel>? list;

  // final getContext = Get.context;

  const ListItemFood({super.key, required this.list});

  Widget _buildListItemFood(List<FoodModel> food) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: list!.length,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: defaultPadding),
            child: CommonItemFood(foodModel: list![index])),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true);
  }

  @override
  Widget build(BuildContext context) {
    return _buildListItemFood(list ?? <FoodModel>[]);
  }
}
