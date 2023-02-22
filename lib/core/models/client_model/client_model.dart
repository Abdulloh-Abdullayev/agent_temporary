import 'package:agent/core/models/category_model/category_model.dart';
import 'package:agent/core/models/sales/sales_chanel_model.dart';
import 'package:agent/core/models/territory_model/territory_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_model.freezed.dart';

part 'client_model.g.dart';

@freezed
class ClientModel with _$ClientModel {
  const factory ClientModel({
    String? name,
    String? companyName,
    String? address,
    String? navigate,
    String? phone,
    String? contact,
    String? inn,
    String? jshshir,
    String? description,
    String? lat,
    String? lon,
    double? balance,
    String? bank,
    String? mfo,
    String? oked,
    @Default([]) @JsonKey(name: 'visit_days') List<String>? visitDays,
    TerritoryModel? territory,
    @JsonKey(name: 'sales_channel') SalesChannelModel? salesChannel,
    CategoryModel? category,
    @JsonKey(name: 'client_type') ClientTypeModel? clientType,
    @Default([]) List<String>? orders,
    double? sum,
    String? apiId,
  }) = _ClientModel;

  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      _$ClientModelFromJson(json);
}

@freezed
class ClientTypeModel with _$ClientTypeModel {
  const factory ClientTypeModel({
    String? name,
    String? color,
    String? xml,
    String? id,
  }) = _ClientTypeModel;

  factory ClientTypeModel.fromJson(Map<String, dynamic> json) =>
      _$ClientTypeModelFromJson(json);
}
