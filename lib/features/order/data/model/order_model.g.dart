// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as String? ?? '',
      status: json['status'] as String?,
      tableID: (json['table_id'] as num?)?.toInt() ?? 0,
      tableName: json['tableName'] as String? ?? '',
      payedAt: json['payed_at'] as String? ?? '',
      totalPrice: (json['total_price'] as num?)?.toDouble() ?? 0,
      createdAt: json['created_at'] as String? ?? '',
      orderDetail: (json['order_detail'] as List<dynamic>?)
              ?.map((e) => OrderDetail.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <OrderDetail>[],
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'table_id': instance.tableID,
      'tableName': instance.tableName,
      'payed_at': instance.payedAt,
      'total_price': instance.totalPrice,
      'created_at': instance.createdAt,
      'order_detail': foodDtoListToJson(instance.orderDetail),
    };
