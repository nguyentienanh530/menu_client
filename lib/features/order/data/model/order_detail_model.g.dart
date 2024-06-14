// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderDetailImpl _$$OrderDetailImplFromJson(Map<String, dynamic> json) =>
    _$OrderDetailImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      orderID: (json['order_id'] as num?)?.toInt() ?? 0,
      foodID: (json['food_id'] as num?)?.toInt() ?? 0,
      foodName: json['foodName'] as String? ?? '',
      foodImage: json['foodImage'] as String? ?? '',
      isDiscount: json['isDiscount'] as bool? ?? false,
      discount: (json['discount'] as num?)?.toInt() ?? 0,
      foodPrice: (json['foodPrice'] as num?)?.toDouble() ?? 0,
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      note: json['note'] as String? ?? '',
      totalPrice: (json['totalPrice'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$OrderDetailImplToJson(_$OrderDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderID,
      'food_id': instance.foodID,
      'foodName': instance.foodName,
      'foodImage': instance.foodImage,
      'isDiscount': instance.isDiscount,
      'discount': instance.discount,
      'foodPrice': instance.foodPrice,
      'quantity': instance.quantity,
      'note': instance.note,
      'totalPrice': instance.totalPrice,
    };
