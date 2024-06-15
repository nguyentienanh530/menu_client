import 'package:freezed_annotation/freezed_annotation.dart';
part 'table_model.freezed.dart';
part 'table_model.g.dart';

@freezed
class TableModel with _$TableModel {
  factory TableModel(
      {@Default(0) int id,
      @Default('') String name,
      @Default(0) int seats,
      @Default(false) @JsonKey(name: 'is_use') bool isUse}) = _TableModel;

  factory TableModel.fromJson(Map<String, dynamic> json) =>
      _$TableModelFromJson(json);
}
