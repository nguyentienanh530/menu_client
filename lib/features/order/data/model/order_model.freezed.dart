// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return _OrderModel.fromJson(json);
}

/// @nodoc
mixin _$OrderModel {
  String get id => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'table_id')
  int? get tableID => throw _privateConstructorUsedError;
  String get tableName => throw _privateConstructorUsedError;
  @JsonKey(name: 'payed_at')
  String? get payedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price')
  double? get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(toJson: foodDtoListToJson, name: 'order_detail')
  List<OrderDetail> get orderDetail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderModelCopyWith<OrderModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) then) =
      _$OrderModelCopyWithImpl<$Res, OrderModel>;
  @useResult
  $Res call(
      {String id,
      String? status,
      @JsonKey(name: 'table_id') int? tableID,
      String tableName,
      @JsonKey(name: 'payed_at') String? payedAt,
      @JsonKey(name: 'total_price') double? totalPrice,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(toJson: foodDtoListToJson, name: 'order_detail')
      List<OrderDetail> orderDetail});
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res, $Val extends OrderModel>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = freezed,
    Object? tableID = freezed,
    Object? tableName = null,
    Object? payedAt = freezed,
    Object? totalPrice = freezed,
    Object? createdAt = null,
    Object? orderDetail = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      tableID: freezed == tableID
          ? _value.tableID
          : tableID // ignore: cast_nullable_to_non_nullable
              as int?,
      tableName: null == tableName
          ? _value.tableName
          : tableName // ignore: cast_nullable_to_non_nullable
              as String,
      payedAt: freezed == payedAt
          ? _value.payedAt
          : payedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      orderDetail: null == orderDetail
          ? _value.orderDetail
          : orderDetail // ignore: cast_nullable_to_non_nullable
              as List<OrderDetail>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderModelImplCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$$OrderModelImplCopyWith(
          _$OrderModelImpl value, $Res Function(_$OrderModelImpl) then) =
      __$$OrderModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? status,
      @JsonKey(name: 'table_id') int? tableID,
      String tableName,
      @JsonKey(name: 'payed_at') String? payedAt,
      @JsonKey(name: 'total_price') double? totalPrice,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(toJson: foodDtoListToJson, name: 'order_detail')
      List<OrderDetail> orderDetail});
}

/// @nodoc
class __$$OrderModelImplCopyWithImpl<$Res>
    extends _$OrderModelCopyWithImpl<$Res, _$OrderModelImpl>
    implements _$$OrderModelImplCopyWith<$Res> {
  __$$OrderModelImplCopyWithImpl(
      _$OrderModelImpl _value, $Res Function(_$OrderModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = freezed,
    Object? tableID = freezed,
    Object? tableName = null,
    Object? payedAt = freezed,
    Object? totalPrice = freezed,
    Object? createdAt = null,
    Object? orderDetail = null,
  }) {
    return _then(_$OrderModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      tableID: freezed == tableID
          ? _value.tableID
          : tableID // ignore: cast_nullable_to_non_nullable
              as int?,
      tableName: null == tableName
          ? _value.tableName
          : tableName // ignore: cast_nullable_to_non_nullable
              as String,
      payedAt: freezed == payedAt
          ? _value.payedAt
          : payedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      orderDetail: null == orderDetail
          ? _value._orderDetail
          : orderDetail // ignore: cast_nullable_to_non_nullable
              as List<OrderDetail>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderModelImpl implements _OrderModel {
  _$OrderModelImpl(
      {this.id = '',
      this.status,
      @JsonKey(name: 'table_id') this.tableID = 0,
      this.tableName = '',
      @JsonKey(name: 'payed_at') this.payedAt = '',
      @JsonKey(name: 'total_price') this.totalPrice = 0,
      @JsonKey(name: 'created_at') this.createdAt = '',
      @JsonKey(toJson: foodDtoListToJson, name: 'order_detail')
      final List<OrderDetail> orderDetail = const <OrderDetail>[]})
      : _orderDetail = orderDetail;

  factory _$OrderModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderModelImplFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final String? status;
  @override
  @JsonKey(name: 'table_id')
  final int? tableID;
  @override
  @JsonKey()
  final String tableName;
  @override
  @JsonKey(name: 'payed_at')
  final String? payedAt;
  @override
  @JsonKey(name: 'total_price')
  final double? totalPrice;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  final List<OrderDetail> _orderDetail;
  @override
  @JsonKey(toJson: foodDtoListToJson, name: 'order_detail')
  List<OrderDetail> get orderDetail {
    if (_orderDetail is EqualUnmodifiableListView) return _orderDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderDetail);
  }

  @override
  String toString() {
    return 'OrderModel(id: $id, status: $status, tableID: $tableID, tableName: $tableName, payedAt: $payedAt, totalPrice: $totalPrice, createdAt: $createdAt, orderDetail: $orderDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tableID, tableID) || other.tableID == tableID) &&
            (identical(other.tableName, tableName) ||
                other.tableName == tableName) &&
            (identical(other.payedAt, payedAt) || other.payedAt == payedAt) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._orderDetail, _orderDetail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      tableID,
      tableName,
      payedAt,
      totalPrice,
      createdAt,
      const DeepCollectionEquality().hash(_orderDetail));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      __$$OrderModelImplCopyWithImpl<_$OrderModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderModelImplToJson(
      this,
    );
  }
}

abstract class _OrderModel implements OrderModel {
  factory _OrderModel(
      {final String id,
      final String? status,
      @JsonKey(name: 'table_id') final int? tableID,
      final String tableName,
      @JsonKey(name: 'payed_at') final String? payedAt,
      @JsonKey(name: 'total_price') final double? totalPrice,
      @JsonKey(name: 'created_at') final String createdAt,
      @JsonKey(toJson: foodDtoListToJson, name: 'order_detail')
      final List<OrderDetail> orderDetail}) = _$OrderModelImpl;

  factory _OrderModel.fromJson(Map<String, dynamic> json) =
      _$OrderModelImpl.fromJson;

  @override
  String get id;
  @override
  String? get status;
  @override
  @JsonKey(name: 'table_id')
  int? get tableID;
  @override
  String get tableName;
  @override
  @JsonKey(name: 'payed_at')
  String? get payedAt;
  @override
  @JsonKey(name: 'total_price')
  double? get totalPrice;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(toJson: foodDtoListToJson, name: 'order_detail')
  List<OrderDetail> get orderDetail;
  @override
  @JsonKey(ignore: true)
  _$$OrderModelImplCopyWith<_$OrderModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
