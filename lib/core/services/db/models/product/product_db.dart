import 'package:agent/core/models/product/product.dart';
import 'package:isar/isar.dart';

part 'product_db.g.dart';

@collection
class ProductDb {
  Id? id;
  String? apiId;
  String? name;
  String? categoryId;
  String? unitId;
  int? quantityInPackage;

 static ProductDb fromProduct(Product product) {
    return ProductDb()
      ..apiId = product.id
      ..name = product.name
      ..categoryId = product.categoryId
      ..unitId = product.unitId
      ..quantityInPackage = product.quantityInPackage;
  }

  Product toProduct() {
    return Product(
      id: apiId,
      unitId: unitId,
      quantityInPackage: quantityInPackage,
      categoryId: categoryId,
      name: name,
    );
  }
}
