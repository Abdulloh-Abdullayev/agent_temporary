import 'package:agent/core/models/region_model/region_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'territory_model.freezed.dart';

part 'territory_model.g.dart';

@freezed
class TerritoryModel with _$TerritoryModel {
  const factory TerritoryModel({
    String? name,
    String? lat,
    String? lon,
    @Default(false) @JsonKey(name: 'is_active') bool? isActive,
    RegionModel? region,
    String? id,
  }) = _TerritoryModel;

  factory TerritoryModel.fromJson(Map<String, dynamic> json) =>
      _$TerritoryModelFromJson(json);
}
