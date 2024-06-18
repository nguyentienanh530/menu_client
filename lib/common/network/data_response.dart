import 'package:freezed_annotation/freezed_annotation.dart';
part 'data_response.freezed.dart';
part 'data_response.g.dart';

@freezed
class DataResponse with _$DataResponse {
  factory DataResponse({
    @Default(0) int code,
    @Default('') String type,
    @Default('') Object data,
  }) = _DataResponse;

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);
}
