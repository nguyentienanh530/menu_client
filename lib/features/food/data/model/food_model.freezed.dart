// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoodModel _$FoodModelFromJson(Map<String, dynamic> json) {
  return _FoodModel.fromJson(json);
}

/// @nodoc
mixin _$FoodModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int get categoryID => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_count')
  int get orderCount => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_discount')
  bool get isDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_show')
  bool get isShow => throw _privateConstructorUsedError;
  @JsonKey(name: 'photo_gallery', fromJson: stringToList)
  List<dynamic> get photoGallery => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'create_at')
  String get createAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodModelCopyWith<FoodModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodModelCopyWith<$Res> {
  factory $FoodModelCopyWith(FoodModel value, $Res Function(FoodModel) then) =
      _$FoodModelCopyWithImpl<$Res, FoodModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'category_id') int categoryID,
      @JsonKey(name: 'order_count') int orderCount,
      String description,
      int discount,
      @JsonKey(name: 'is_discount') bool isDiscount,
      @JsonKey(name: 'is_show') bool isShow,
      @JsonKey(name: 'photo_gallery', fromJson: stringToList)
      List<dynamic> photoGallery,
      double price,
      @JsonKey(name: 'create_at') String createAt});
}

/// @nodoc
class _$FoodModelCopyWithImpl<$Res, $Val extends FoodModel>
    implements $FoodModelCopyWith<$Res> {
  _$FoodModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryID = null,
    Object? orderCount = null,
    Object? description = null,
    Object? discount = null,
    Object? isDiscount = null,
    Object? isShow = null,
    Object? photoGallery = null,
    Object? price = null,
    Object? createAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryID: null == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as int,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      isDiscount: null == isDiscount
          ? _value.isDiscount
          : isDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      isShow: null == isShow
          ? _value.isShow
          : isShow // ignore: cast_nullable_to_non_nullable
              as bool,
      photoGallery: null == photoGallery
          ? _value.photoGallery
          : photoGallery // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodModelImplCopyWith<$Res>
    implements $FoodModelCopyWith<$Res> {
  factory _$$FoodModelImplCopyWith(
          _$FoodModelImpl value, $Res Function(_$FoodModelImpl) then) =
      __$$FoodModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'category_id') int categoryID,
      @JsonKey(name: 'order_count') int orderCount,
      String description,
      int discount,
      @JsonKey(name: 'is_discount') bool isDiscount,
      @JsonKey(name: 'is_show') bool isShow,
      @JsonKey(name: 'photo_gallery', fromJson: stringToList)
      List<dynamic> photoGallery,
      double price,
      @JsonKey(name: 'create_at') String createAt});
}

/// @nodoc
class __$$FoodModelImplCopyWithImpl<$Res>
    extends _$FoodModelCopyWithImpl<$Res, _$FoodModelImpl>
    implements _$$FoodModelImplCopyWith<$Res> {
  __$$FoodModelImplCopyWithImpl(
      _$FoodModelImpl _value, $Res Function(_$FoodModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryID = null,
    Object? orderCount = null,
    Object? description = null,
    Object? discount = null,
    Object? isDiscount = null,
    Object? isShow = null,
    Object? photoGallery = null,
    Object? price = null,
    Object? createAt = null,
  }) {
    return _then(_$FoodModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      categoryID: null == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as int,
      orderCount: null == orderCount
          ? _value.orderCount
          : orderCount // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      isDiscount: null == isDiscount
          ? _value.isDiscount
          : isDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      isShow: null == isShow
          ? _value.isShow
          : isShow // ignore: cast_nullable_to_non_nullable
              as bool,
      photoGallery: null == photoGallery
          ? _value._photoGallery
          : photoGallery // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodModelImpl implements _FoodModel {
  _$FoodModelImpl(
      {this.id = 0,
      this.name = '',
      @JsonKey(name: 'category_id') this.categoryID = 0,
      @JsonKey(name: 'order_count') this.orderCount = 0,
      this.description = '',
      this.discount = 0,
      @JsonKey(name: 'is_discount') this.isDiscount = false,
      @JsonKey(name: 'is_show') this.isShow = false,
      @JsonKey(name: 'photo_gallery', fromJson: stringToList)
      final List<dynamic> photoGallery = const [],
      this.price = 0,
      @JsonKey(name: 'create_at') this.createAt = ''})
      : _photoGallery = photoGallery;

  factory _$FoodModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey(name: 'category_id')
  final int categoryID;
  @override
  @JsonKey(name: 'order_count')
  final int orderCount;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final int discount;
  @override
  @JsonKey(name: 'is_discount')
  final bool isDiscount;
  @override
  @JsonKey(name: 'is_show')
  final bool isShow;
  final List<dynamic> _photoGallery;
  @override
  @JsonKey(name: 'photo_gallery', fromJson: stringToList)
  List<dynamic> get photoGallery {
    if (_photoGallery is EqualUnmodifiableListView) return _photoGallery;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photoGallery);
  }

  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey(name: 'create_at')
  final String createAt;

  @override
  String toString() {
    return 'FoodModel(id: $id, name: $name, categoryID: $categoryID, orderCount: $orderCount, description: $description, discount: $discount, isDiscount: $isDiscount, isShow: $isShow, photoGallery: $photoGallery, price: $price, createAt: $createAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryID, categoryID) ||
                other.categoryID == categoryID) &&
            (identical(other.orderCount, orderCount) ||
                other.orderCount == orderCount) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.isDiscount, isDiscount) ||
                other.isDiscount == isDiscount) &&
            (identical(other.isShow, isShow) || other.isShow == isShow) &&
            const DeepCollectionEquality()
                .equals(other._photoGallery, _photoGallery) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      categoryID,
      orderCount,
      description,
      discount,
      isDiscount,
      isShow,
      const DeepCollectionEquality().hash(_photoGallery),
      price,
      createAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodModelImplCopyWith<_$FoodModelImpl> get copyWith =>
      __$$FoodModelImplCopyWithImpl<_$FoodModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodModelImplToJson(
      this,
    );
  }
}

abstract class _FoodModel implements FoodModel {
  factory _FoodModel(
      {final int id,
      final String name,
      @JsonKey(name: 'category_id') final int categoryID,
      @JsonKey(name: 'order_count') final int orderCount,
      final String description,
      final int discount,
      @JsonKey(name: 'is_discount') final bool isDiscount,
      @JsonKey(name: 'is_show') final bool isShow,
      @JsonKey(name: 'photo_gallery', fromJson: stringToList)
      final List<dynamic> photoGallery,
      final double price,
      @JsonKey(name: 'create_at') final String createAt}) = _$FoodModelImpl;

  factory _FoodModel.fromJson(Map<String, dynamic> json) =
      _$FoodModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'category_id')
  int get categoryID;
  @override
  @JsonKey(name: 'order_count')
  int get orderCount;
  @override
  String get description;
  @override
  int get discount;
  @override
  @JsonKey(name: 'is_discount')
  bool get isDiscount;
  @override
  @JsonKey(name: 'is_show')
  bool get isShow;
  @override
  @JsonKey(name: 'photo_gallery', fromJson: stringToList)
  List<dynamic> get photoGallery;
  @override
  double get price;
  @override
  @JsonKey(name: 'create_at')
  String get createAt;
  @override
  @JsonKey(ignore: true)
  _$$FoodModelImplCopyWith<_$FoodModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
