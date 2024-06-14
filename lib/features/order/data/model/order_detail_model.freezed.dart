// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OrderDetail _$OrderDetailFromJson(Map<String, dynamic> json) {
  return _OrderDetail.fromJson(json);
}

/// @nodoc
mixin _$OrderDetail {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  int get orderID => throw _privateConstructorUsedError;
  @JsonKey(name: 'food_id')
  int get foodID => throw _privateConstructorUsedError;
  String get foodName => throw _privateConstructorUsedError;
  String get foodImage => throw _privateConstructorUsedError;
  bool get isDiscount => throw _privateConstructorUsedError;
  int get discount => throw _privateConstructorUsedError;
  double get foodPrice => throw _privateConstructorUsedError;
  int get quantity => throw _privateConstructorUsedError;
  String get note => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDetailCopyWith<OrderDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailCopyWith<$Res> {
  factory $OrderDetailCopyWith(
          OrderDetail value, $Res Function(OrderDetail) then) =
      _$OrderDetailCopyWithImpl<$Res, OrderDetail>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'order_id') int orderID,
      @JsonKey(name: 'food_id') int foodID,
      String foodName,
      String foodImage,
      bool isDiscount,
      int discount,
      double foodPrice,
      int quantity,
      String note,
      double totalPrice});
}

/// @nodoc
class _$OrderDetailCopyWithImpl<$Res, $Val extends OrderDetail>
    implements $OrderDetailCopyWith<$Res> {
  _$OrderDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderID = null,
    Object? foodID = null,
    Object? foodName = null,
    Object? foodImage = null,
    Object? isDiscount = null,
    Object? discount = null,
    Object? foodPrice = null,
    Object? quantity = null,
    Object? note = null,
    Object? totalPrice = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderID: null == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as int,
      foodID: null == foodID
          ? _value.foodID
          : foodID // ignore: cast_nullable_to_non_nullable
              as int,
      foodName: null == foodName
          ? _value.foodName
          : foodName // ignore: cast_nullable_to_non_nullable
              as String,
      foodImage: null == foodImage
          ? _value.foodImage
          : foodImage // ignore: cast_nullable_to_non_nullable
              as String,
      isDiscount: null == isDiscount
          ? _value.isDiscount
          : isDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      foodPrice: null == foodPrice
          ? _value.foodPrice
          : foodPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderDetailImplCopyWith<$Res>
    implements $OrderDetailCopyWith<$Res> {
  factory _$$OrderDetailImplCopyWith(
          _$OrderDetailImpl value, $Res Function(_$OrderDetailImpl) then) =
      __$$OrderDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'order_id') int orderID,
      @JsonKey(name: 'food_id') int foodID,
      String foodName,
      String foodImage,
      bool isDiscount,
      int discount,
      double foodPrice,
      int quantity,
      String note,
      double totalPrice});
}

/// @nodoc
class __$$OrderDetailImplCopyWithImpl<$Res>
    extends _$OrderDetailCopyWithImpl<$Res, _$OrderDetailImpl>
    implements _$$OrderDetailImplCopyWith<$Res> {
  __$$OrderDetailImplCopyWithImpl(
      _$OrderDetailImpl _value, $Res Function(_$OrderDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? orderID = null,
    Object? foodID = null,
    Object? foodName = null,
    Object? foodImage = null,
    Object? isDiscount = null,
    Object? discount = null,
    Object? foodPrice = null,
    Object? quantity = null,
    Object? note = null,
    Object? totalPrice = null,
  }) {
    return _then(_$OrderDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      orderID: null == orderID
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as int,
      foodID: null == foodID
          ? _value.foodID
          : foodID // ignore: cast_nullable_to_non_nullable
              as int,
      foodName: null == foodName
          ? _value.foodName
          : foodName // ignore: cast_nullable_to_non_nullable
              as String,
      foodImage: null == foodImage
          ? _value.foodImage
          : foodImage // ignore: cast_nullable_to_non_nullable
              as String,
      isDiscount: null == isDiscount
          ? _value.isDiscount
          : isDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      foodPrice: null == foodPrice
          ? _value.foodPrice
          : foodPrice // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      note: null == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderDetailImpl implements _OrderDetail {
  _$OrderDetailImpl(
      {this.id = 0,
      @JsonKey(name: 'order_id') this.orderID = 0,
      @JsonKey(name: 'food_id') this.foodID = 0,
      this.foodName = '',
      this.foodImage = '',
      this.isDiscount = false,
      this.discount = 0,
      this.foodPrice = 0,
      this.quantity = 1,
      this.note = '',
      this.totalPrice = 0});

  factory _$OrderDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderDetailImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey(name: 'order_id')
  final int orderID;
  @override
  @JsonKey(name: 'food_id')
  final int foodID;
  @override
  @JsonKey()
  final String foodName;
  @override
  @JsonKey()
  final String foodImage;
  @override
  @JsonKey()
  final bool isDiscount;
  @override
  @JsonKey()
  final int discount;
  @override
  @JsonKey()
  final double foodPrice;
  @override
  @JsonKey()
  final int quantity;
  @override
  @JsonKey()
  final String note;
  @override
  @JsonKey()
  final double totalPrice;

  @override
  String toString() {
    return 'OrderDetail(id: $id, orderID: $orderID, foodID: $foodID, foodName: $foodName, foodImage: $foodImage, isDiscount: $isDiscount, discount: $discount, foodPrice: $foodPrice, quantity: $quantity, note: $note, totalPrice: $totalPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.orderID, orderID) || other.orderID == orderID) &&
            (identical(other.foodID, foodID) || other.foodID == foodID) &&
            (identical(other.foodName, foodName) ||
                other.foodName == foodName) &&
            (identical(other.foodImage, foodImage) ||
                other.foodImage == foodImage) &&
            (identical(other.isDiscount, isDiscount) ||
                other.isDiscount == isDiscount) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.foodPrice, foodPrice) ||
                other.foodPrice == foodPrice) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, orderID, foodID, foodName,
      foodImage, isDiscount, discount, foodPrice, quantity, note, totalPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderDetailImplCopyWith<_$OrderDetailImpl> get copyWith =>
      __$$OrderDetailImplCopyWithImpl<_$OrderDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderDetailImplToJson(
      this,
    );
  }
}

abstract class _OrderDetail implements OrderDetail {
  factory _OrderDetail(
      {final int id,
      @JsonKey(name: 'order_id') final int orderID,
      @JsonKey(name: 'food_id') final int foodID,
      final String foodName,
      final String foodImage,
      final bool isDiscount,
      final int discount,
      final double foodPrice,
      final int quantity,
      final String note,
      final double totalPrice}) = _$OrderDetailImpl;

  factory _OrderDetail.fromJson(Map<String, dynamic> json) =
      _$OrderDetailImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'order_id')
  int get orderID;
  @override
  @JsonKey(name: 'food_id')
  int get foodID;
  @override
  String get foodName;
  @override
  String get foodImage;
  @override
  bool get isDiscount;
  @override
  int get discount;
  @override
  double get foodPrice;
  @override
  int get quantity;
  @override
  String get note;
  @override
  double get totalPrice;
  @override
  @JsonKey(ignore: true)
  _$$OrderDetailImplCopyWith<_$OrderDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
