import 'package:freezed_annotation/freezed_annotation.dart';
part 'food_order.freezed.dart';
part 'food_order.g.dart';

@freezed
class FoodOrder with _$FoodOrder {
  factory FoodOrder(
      {@Default(0) int foodID,
      @Default('') String foodName,
      @Default('') String foodImage,
      @Default(1) int quantity,
      @Default(false) bool isDiscount,
      @Default(0) int discount,
      @Default(0) double foodPrice,
      @Default('') String note,
      @Default(0) double totalPrice}) = _FoodOrder;

  factory FoodOrder.fromJson(Map<String, dynamic> json) =>
      _$FoodOrderFromJson(json);
}
