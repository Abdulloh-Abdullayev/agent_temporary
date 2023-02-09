import 'package:agent/core/services/db/entities/base_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends BaseEntity {
  final String? id;
  final String? name;
  @JsonKey(name: 'category_id')
  final String? categoryId;
  @JsonKey(name: 'unit_id')
  final String? unitId;
  @JsonKey(name: 'quantity_in_package')
  final int? quantityInPackage;

  Product({this.id, this.name, this.categoryId, this.quantityInPackage,this.unitId});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  List<Object?> get props => [id, name, categoryId, quantityInPackage,unitId];

  @override
  bool get stringify => true;
}
/*
* {
  "id": 0,
  "name": "string",
  "category_id": 0,
  "unit_id": 0,
  "quantity_in_package": 0,
  "weight": 0,
  "sort": 0,
  "sales_channel_id": 0,
  "box_type_id": 0,
  "code": "string",
  "sub_code": "string",
  "bar_code": "string",
  "IKPU_code": "string",
  "MML": true,
  "image_id": 0,
  "brand_id": 0,
  "is_active": true,
  "product_group_id": 0,
* */
