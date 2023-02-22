
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';

part 'category_model.g.dart';
@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    String? name,
    String? description,
    String? code,
    @Default(false) @JsonKey(name: 'is_active') bool? isActive,
    String? id,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}