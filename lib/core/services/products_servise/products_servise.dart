import 'package:agent/core/constants/api_const.dart';
import 'package:agent/core/services/db/db_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:isar/isar.dart';
import '../../models/products_model/products_model.dart';

class ProductService {
  ProductService get to => Modular.get<ProductService>();

  Future getProductsApi(int page, int page_size) async {
    String url = '${APIConst.apiURL}api/mobile/Products/list';
    var body = {"page": page, "page_size": page_size};

    try {
      final response = await Dio().post(url,
          data: body,
          options: Options(headers: {
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjUwMGMxMjgyLTRlODgtNDdiOS04YTNmLWY5MmY5NjUzZDAwYiIsIlRlbmFudE5hbWUiOiJsaWRlciIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkFnZW50IiwiUGVybWlzc2lvbiI6IiIsImV4cCI6MTY3NzIyMjY4M30.Wpi3aYwhC-4CVtlUNj3XyHlPNihxfRWDLSC45a_i7Og"
          }));
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<ProductsModel> products = List<ProductsModel>.from(
          (response.data['items'] as List)
              .map((e) => ProductsModel.fromJson(e))
              .toList(),
        );
        print(products);
        //save db
        await saveProductsDb(products);
        return products;
      }
    } catch (error) {
      print("____----$error ____----");
    }
  }

  Future saveProductsDb(List<ProductsModel> products) async {
    await DBService.to.isar.writeTxn(() async {
      await DBService.to.isar.productsModels.clear();
      for (var product in products) {
        await DBService.to.isar.productsModels.put(product);
      }
    });
  }

  Future<List<ProductsModel>> getProductsFromDb() async {
    return await DBService.to.isar.productsModels.where().findAll();
  }
}
