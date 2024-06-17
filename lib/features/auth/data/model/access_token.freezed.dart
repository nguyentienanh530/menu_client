// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccessToken _$AccessTokenFromJson(Map<String, dynamic> json) {
  return _AccessToken.fromJson(json);
}

/// @nodoc
mixin _$AccessToken {
  @JsonKey(name: 'access_token')
  String get accessToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccessTokenCopyWith<AccessToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessTokenCopyWith<$Res> {
  factory $AccessTokenCopyWith(
          AccessToken value, $Res Function(AccessToken) then) =
      _$AccessTokenCopyWithImpl<$Res, AccessToken>;
  @useResult
  $Res call({@JsonKey(name: 'access_token') String accessToken});
}

/// @nodoc
class _$AccessTokenCopyWithImpl<$Res, $Val extends AccessToken>
    implements $AccessTokenCopyWith<$Res> {
  _$AccessTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccessTokenImplCopyWith<$Res>
    implements $AccessTokenCopyWith<$Res> {
  factory _$$AccessTokenImplCopyWith(
          _$AccessTokenImpl value, $Res Function(_$AccessTokenImpl) then) =
      __$$AccessTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'access_token') String accessToken});
}

/// @nodoc
class __$$AccessTokenImplCopyWithImpl<$Res>
    extends _$AccessTokenCopyWithImpl<$Res, _$AccessTokenImpl>
    implements _$$AccessTokenImplCopyWith<$Res> {
  __$$AccessTokenImplCopyWithImpl(
      _$AccessTokenImpl _value, $Res Function(_$AccessTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
  }) {
    return _then(_$AccessTokenImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccessTokenImpl implements _AccessToken {
  _$AccessTokenImpl({@JsonKey(name: 'access_token') this.accessToken = ''});

  factory _$AccessTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccessTokenImplFromJson(json);

  @override
  @JsonKey(name: 'access_token')
  final String accessToken;

  @override
  String toString() {
    return 'AccessToken(accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessTokenImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessTokenImplCopyWith<_$AccessTokenImpl> get copyWith =>
      __$$AccessTokenImplCopyWithImpl<_$AccessTokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccessTokenImplToJson(
      this,
    );
  }
}

abstract class _AccessToken implements AccessToken {
  factory _AccessToken(
          {@JsonKey(name: 'access_token') final String accessToken}) =
      _$AccessTokenImpl;

  factory _AccessToken.fromJson(Map<String, dynamic> json) =
      _$AccessTokenImpl.fromJson;

  @override
  @JsonKey(name: 'access_token')
  String get accessToken;
  @override
  @JsonKey(ignore: true)
  _$$AccessTokenImplCopyWith<_$AccessTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
