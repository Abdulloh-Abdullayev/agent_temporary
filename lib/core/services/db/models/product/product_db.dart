
import 'package:agent/core/models/products_model/products_model.dart';
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

 static ProductDb fromProduct(ProductsModel productsModel) {
    return ProductDb()
      ..apiId = productsModel.id
      ..name = productsModel.name
      ..quantityInPackage = productsModel.quantityInPackage;
  }

  ProductsModel toProduct() {
    return ProductsModel(
      id: apiId,
      quantityInPackage: quantityInPackage,
      name: name,
    );
  }
}
