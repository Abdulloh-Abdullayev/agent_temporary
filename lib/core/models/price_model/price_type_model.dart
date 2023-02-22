import 'package:agent/core/models/currency_model/currency_model.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'price_type_model.g.dart';

@JsonSerializable()
@embedded
class PriceType {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "currency_id")
  String? currencyId;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "currency")
  Currency? currency;

  PriceType({
    this.id,
    this.name,
    this.type,
    this.currencyId,
    this.description,
    this.code,
    this.currency,
  });

  factory PriceType.fromJson(Map<String, dynamic> data) =>
      _$PriceTypeFromJson(data);

  Map<String, dynamic> toJson() => _$PriceTypeToJson(this);
}
