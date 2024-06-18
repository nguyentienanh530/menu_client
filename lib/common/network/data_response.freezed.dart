// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DataResponse _$DataResponseFromJson(Map<String, dynamic> json) {
  return _DataResponse.fromJson(json);
}

/// @nodoc
mixin _$DataResponse {
  int get code => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  Object get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataResponseCopyWith<DataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataResponseCopyWith<$Res> {
  factory $DataResponseCopyWith(
          DataResponse value, $Res Function(DataResponse) then) =
      _$DataResponseCopyWithImpl<$Res, DataResponse>;
  @useResult
  $Res call({int code, String type, Object data});
}

/// @nodoc
class _$DataResponseCopyWithImpl<$Res, $Val extends DataResponse>
    implements $DataResponseCopyWith<$Res> {
  _$DataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? type = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data ? _value.data : data,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataResponseImplCopyWith<$Res>
    implements $DataResponseCopyWith<$Res> {
  factory _$$DataResponseImplCopyWith(
          _$DataResponseImpl value, $Res Function(_$DataResponseImpl) then) =
      __$$DataResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int code, String type, Object data});
}

/// @nodoc
class __$$DataResponseImplCopyWithImpl<$Res>
    extends _$DataResponseCopyWithImpl<$Res, _$DataResponseImpl>
    implements _$$DataResponseImplCopyWith<$Res> {
  __$$DataResponseImplCopyWithImpl(
      _$DataResponseImpl _value, $Res Function(_$DataResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? type = null,
    Object? data = null,
  }) {
    return _then(_$DataResponseImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data ? _value.data : data,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataResponseImpl implements _DataResponse {
  _$DataResponseImpl({this.code = 0, this.type = '', this.data = ''});

  factory _$DataResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataResponseImplFromJson(json);

  @override
  @JsonKey()
  final int code;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final Object data;

  @override
  String toString() {
    return 'DataResponse(code: $code, type: $type, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataResponseImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, type, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DataResponseImplCopyWith<_$DataResponseImpl> get copyWith =>
      __$$DataResponseImplCopyWithImpl<_$DataResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataResponseImplToJson(
      this,
    );
  }
}

abstract class _DataResponse implements DataResponse {
  factory _DataResponse(
      {final int code,
      final String type,
      final Object data}) = _$DataResponseImpl;

  factory _DataResponse.fromJson(Map<String, dynamic> json) =
      _$DataResponseImpl.fromJson;

  @override
  int get code;
  @override
  String get type;
  @override
  Object get data;
  @override
  @JsonKey(ignore: true)
  _$$DataResponseImplCopyWith<_$DataResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
