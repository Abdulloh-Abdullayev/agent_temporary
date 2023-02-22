import 'package:agent/core/models/category_model/category_model.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_model.g.dart';

@JsonSerializable()
@Collection()
class ClientModel {
  Id? localeId;
  String? name;
  @JsonKey(name: "company_name")
  String? companyName;
  String? address;
  String? navigate;
  String? phone;
  String? contact;
  String? inn;
  String? jshshir;
  String? description;
  String? lat;
  String? lon;
  double? balance;
  String? bank;
  String? mfo;
  String? oked;
  @JsonKey(name: 'visit_days', defaultValue: [])
  List<String>? visitDays;
  Territory? territory;
  @JsonKey(name: 'sales_channel')
  SalesChannel? salesChannel;
  Category? category;
  @JsonKey(name: 'client_type')
  ClientType? clientType;
  int? sum;
  String? orders;
  String? id;

  ClientModel({
    this.name,
    this.companyName,
    this.address,
    this.navigate,
    this.phone,
    this.contact,
    this.inn,
    this.jshshir,
    this.description,
    this.lat,
    this.lon,
    this.balance,
    this.bank,
    this.mfo,
    this.oked,
    this.visitDays,
    this.territory,
    this.salesChannel,
    this.category,
    this.clientType,
    this.sum,
    this.orders,
    this.id,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      _$ClientModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClientModelToJson(this);
}

@JsonSerializable()
@embedded
class Territory {
  String? name;
  String? lat;
  String? lon;
  @JsonKey(name: 'is_active', defaultValue: false)
  bool? isActive;
  Region? region;
  String? id;

  Territory({
    this.name,
    this.lat,
    this.lon,
    this.isActive,
    this.region,
    this.id,
  });

  factory Territory.fromJson(Map<String, dynamic> json) =>
      _$TerritoryFromJson(json);

  Map<String, dynamic> toJson() => _$TerritoryToJson(this);
}

@JsonSerializable()
@embedded
class Region {
  String? name;
  String? description;
  String? id;

  Region({this.name, this.description, this.id});

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);
}

@JsonSerializable()
@embedded
class SalesChannel {
  String? name;
  String? id;

  SalesChannel({this.name, this.id});

  factory SalesChannel.fromJson(Map<String, dynamic> json) =>
      _$SalesChannelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesChannelToJson(this);
}

@JsonSerializable()
@embedded
class ClientType {
  String? name;
  String? color;
  String? xml;
  String? id;

  ClientType({this.name, this.color, this.xml, this.id});

  factory ClientType.fromJson(Map<String, dynamic> json) =>
      _$ClientTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ClientTypeToJson(this);
}
