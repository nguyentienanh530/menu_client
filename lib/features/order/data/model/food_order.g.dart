// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodOrderImpl _$$FoodOrderImplFromJson(Map<String, dynamic> json) =>
    _$FoodOrderImpl(
      foodID: json['foodID'] as String? ?? '',
      foodName: json['foodName'] as String? ?? '',
      foodImage: json['foodImage'] as String? ?? '',
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      isDiscount: json['isDiscount'] as bool? ?? false,
      discount: (json['discount'] as num?)?.toInt() ?? 0,
      foodPrice: (json['foodPrice'] as num?)?.toDouble() ?? 0,
      note: json['note'] as String? ?? '',
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$FoodOrderImplToJson(_$FoodOrderImpl instance) =>
    <String, dynamic>{
      'foodID': instance.foodID,
      'foodName': instance.foodName,
      'foodImage': instance.foodImage,
      'quantity': instance.quantity,
      'isDiscount': instance.isDiscount,
      'discount': instance.discount,
      'foodPrice': instance.foodPrice,
      'note': instance.note,
      'totalPrice': instance.totalPrice,
    };