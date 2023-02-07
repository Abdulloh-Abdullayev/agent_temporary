// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String?,
      name: json['name'] as String?,
      categoryId: json['category_id'] as String?,
      quantityInPackage: json['quantity_in_package'] as int?,
      unitId: json['unit_id'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category_id': instance.categoryId,
      'unit_id': instance.unitId,
      'quantity_in_package': instance.quantityInPackage,
    };
