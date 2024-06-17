import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_model.freezed.dart';
part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel {
  factory LoginModel({
    @Default('') @JsonKey(name: 'phone_number') String phoneNumber,
    @Default('') @JsonKey(name: 'password') String password,
  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
}
