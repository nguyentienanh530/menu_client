// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodModelImpl _$$FoodModelImplFromJson(Map<String, dynamic> json) =>
    _$FoodModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      categoryID: (json['category_id'] as num?)?.toInt() ?? 0,
      orderCount: (json['order_count'] as num?)?.toInt() ?? 0,
      description: json['description'] as String? ?? '',
      discount: (json['discount'] as num?)?.toInt() ?? 0,
      isDiscount: json['is_discount'] as bool? ?? false,
      isShow: json['is_show'] as bool? ?? false,
      photoGallery: json['photo_gallery'] == null
          ? const []
          : stringToList(json['photo_gallery'] as String),
      price: (json['price'] as num?)?.toDouble() ?? 0,
      createAt: json['create_at'] as String? ?? '',
    );

Map<String, dynamic> _$$FoodModelImplToJson(_$FoodModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category_id': instance.categoryID,
      'order_count': instance.orderCount,
      'description': instance.description,
      'discount': instance.discount,
      'is_discount': instance.isDiscount,
      'is_show': instance.isShow,
      'photo_gallery': instance.photoGallery,
      'price': instance.price,
      'create_at': instance.createAt,
    };
