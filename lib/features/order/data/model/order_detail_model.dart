import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_detail_model.freezed.dart';
part 'order_detail_model.g.dart';

@freezed
class OrderDetail with _$OrderDetail {
  factory OrderDetail(
      {@Default(0) int id,
      @Default(0) @JsonKey(name: 'order_id') int orderID,
      @Default(0) @JsonKey(name: 'food_id') int foodID,
      @Default('') String foodName,
      @Default('') String foodImage,
      @Default(false) bool isDiscount,
      @Default(0) int discount,
      @Default(0) double foodPrice,
      @Default(1) int quantity,
      @Default('') String note,
      @Default(0) double totalPrice}) = _OrderDetail;

  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);
}
