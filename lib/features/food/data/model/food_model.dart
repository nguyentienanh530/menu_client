import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
part 'food_model.freezed.dart';
part 'food_model.g.dart';

List<dynamic> stringToList(String photoGallery) {
  return json.decode(photoGallery).cast<String>().toList();
}

@freezed
class FoodModel with _$FoodModel {
  factory FoodModel(
      {@Default(0) int id,
      @Default('') String name,
      @Default(0) @JsonKey(name: 'category_id') int categoryID,
      @Default(0) @JsonKey(name: 'order_count') int orderCount,
      @Default('') String description,
      @Default(0) int discount,
      @Default('') String image,
      @Default(false) bool isDiscount,
      @Default(false) bool isShow,
      @Default([])
      @JsonKey(name: 'photo_gallery', fromJson: stringToList)
      List photoGallery,
      @Default(0) double price,
      @Default('') @JsonKey(name: 'create_at') String createAt}) = _FoodModel;

  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);
}
