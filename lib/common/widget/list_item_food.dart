import 'package:flutter/material.dart';
import 'package:menu_client/core/app_const.dart';
import '../../features/food/data/model/food_model.dart';
import 'common_item_food.dart';

class ListItemFood extends StatelessWidget {
  final List<FoodModel>? list;

  const ListItemFood({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: list!.length,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: defaultPadding),
            child: CommonItemFood(foodModel: list![index])),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true);
  }
}
