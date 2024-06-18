// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataResponseImpl _$$DataResponseImplFromJson(Map<String, dynamic> json) =>
    _$DataResponseImpl(
      code: (json['code'] as num?)?.toInt() ?? 0,
      type: json['type'] as String? ?? '',
      data: json['data'] as Object? ?? '',
    );

Map<String, dynamic> _$$DataResponseImplToJson(_$DataResponseImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'type': instance.type,
      'data': instance.data,
    };
