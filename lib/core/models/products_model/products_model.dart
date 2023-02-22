import 'package:agent/core/models/category_model/category_model.dart';
import 'package:agent/core/models/image_model/image_model.dart';
import 'package:agent/core/models/price_model/price_type_model.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import '../currency_model/currency_model.dart';

part 'products_model.g.dart';

@JsonSerializable()
@Collection()
class ProductsModel {
  Id? localeId;
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "quantity_in_package")
  int? quantityInPackage;
  @JsonKey(name: "weight")
  int? weight;
  @JsonKey(name: "sort")
  int? sort;
  @JsonKey(name: "code")
  String? code;
  @JsonKey(name: "sub_code")
  String? subCode;
  @JsonKey(name: "bar_code")
  String? barCode;
  @JsonKey(name: "ikpu_code")
  String? ikpuCode;
  @JsonKey(name: "mml")
  bool? mml;
  @JsonKey(name: "quantity")
  int? quantity;
  @JsonKey(name: "price")
  int? price;
  @JsonKey(name: "warehouse_id")
  String? warehouseId;
  @JsonKey(name: "warehouse_name")
  String? warehouseName;
  @JsonKey(name: "price_type")
  PriceType? priceType;
  @JsonKey(name: "image")
  Image? image;
  Category? category;

  ProductsModel({
    this.id,
    this.name,
    this.quantityInPackage,
    this.weight,
    this.sort,
    this.code,
    this.subCode,
    this.barCode,
    this.ikpuCode,
    this.mml,
    this.quantity,
    this.price,
    this.warehouseId,
    this.warehouseName,
    this.priceType,
    this.image,
    this.category,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> data) =>
      _$ProductsModelFromJson(data);

  Map<String, dynamic> toJson() => _$ProductsModelToJson(this);
}
