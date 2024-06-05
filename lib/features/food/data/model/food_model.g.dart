// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodModelImpl _$$FoodModelImplFromJson(Map<String, dynamic> json) =>
    _$FoodModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      id_category: (json['id_category'] as num?)?.toInt() ?? 0,
      count: (json['count'] as num?)?.toInt() ?? 0,
      description: json['description'] as String? ?? '',
      discount: (json['discount'] as num?)?.toInt() ?? 0,
      image: json['image'] as String? ?? '',
      isDiscount: json['isDiscount'] as bool? ?? false,
      isShowFood: json['isShowFood'] as bool? ?? false,
      photoGallery: json['photoGallery'] as List<dynamic>? ?? const [],
      price: (json['price'] as num?)?.toDouble() ?? 0,
      create_at: json['create_at'] as String? ?? '',
    );

Map<String, dynamic> _$$FoodModelImplToJson(_$FoodModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'id_category': instance.id_category,
      'count': instance.count,
      'description': instance.description,
      'discount': instance.discount,
      'image': instance.image,
      'isDiscount': instance.isDiscount,
      'isShowFood': instance.isShowFood,
      'photoGallery': instance.photoGallery,
      'price': instance.price,
      'create_at': instance.create_at,
    };
