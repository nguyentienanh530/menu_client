// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginModelImpl _$$LoginModelImplFromJson(Map<String, dynamic> json) =>
    _$LoginModelImpl(
      phoneNumber: json['phone_number'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$$LoginModelImplToJson(_$LoginModelImpl instance) =>
    <String, dynamic>{
      'phone_number': instance.phoneNumber,
      'password': instance.password,
    };
