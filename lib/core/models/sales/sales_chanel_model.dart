import 'package:freezed_annotation/freezed_annotation.dart';

part 'sales_chanel_model.freezed.dart';

part 'sales_chanel_model.g.dart';
@freezed
class SalesChannelModel with _$SalesChannelModel {
  const factory SalesChannelModel({
    String? name,
    String? id,
  }) = _SalesChannelModel;

  factory SalesChannelModel.fromJson(Map<String, dynamic> json) =>
      _$SalesChannelModelFromJson(json);
}