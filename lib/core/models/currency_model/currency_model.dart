import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency_model.g.dart';

@JsonSerializable()
@embedded
class Currency {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "title")
  String? title;

  Currency({this.id, this.name, this.code, this.title});

  factory Currency.fromJson(Map<String, dynamic> data) =>
      _$CurrencyFromJson(data);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}
