import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    @Default(0) @JsonKey(name: 'id') int id,
    @Default(0) @JsonKey(name: 'phone_number') int phoneNumber,
    @Default('') @JsonKey(name: 'full_name') String fullName,
    @Default('') @JsonKey(name: 'image') String image,
    @Default('') @JsonKey(name: 'created_at') String createdAt,
    @Default('') @JsonKey(name: 'updated_at') String updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
