import 'package:freezed_annotation/freezed_annotation.dart';
part 'food_model.freezed.dart';
part 'food_model.g.dart';

@freezed
class FoodModel with _$FoodModel {
  factory FoodModel(
      {@Default(0) int id,
      @Default('') String name,
      @Default('') String categoryID,
      @Default(0) int count,
      @Default('') String description,
      @Default(0) int discount,
      @Default('') String image,
      @Default(false) bool isDiscount,
      @Default(false) bool isShowFood,
      @Default([]) List photoGallery,
      @Default(0) double price,
      @Default('') String createAt}) = _FoodModel;

  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);
}
