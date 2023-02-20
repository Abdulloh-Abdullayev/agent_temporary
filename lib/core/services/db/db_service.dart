import 'package:agent/core/services/account_service/user_db/user_db.dart';
import 'package:agent/core/services/db/models/product/product_db.dart';
import 'package:agent/core/services/hive_service.dart';
import 'package:agent/core/utils/app_logger_util.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class DBService {
  static DBService get to => Modular.get<DBService>();

  late Isar isar;
  late String path;

  static Future<DBService> init() async {
    var instance = DBService();
    final dir = await getApplicationSupportDirectory();
    instance.path = dir.path;
    var userId = HiveService.to.getCurrentUserId();
    AppLoggerUtil.w("userid $userId");
    if (userId.isNotEmpty) {
      var isar = await Isar.open(
        [
          UserDBSchema,
          ProductDbSchema,
        ],
        name: userId,
      );
      instance.isar = isar;
      AppLoggerUtil.w('isar db ${instance.isar.name}');
    }
    return instance;
  }

  Future createDB(String id) async {
    var db = await Isar.getInstance(id);
    if (db == null) {
      to.isar = await Isar.open(
        schemas,
        directory: path,
        //db name is equal to user uuid
        name: id,
        inspector: true,
      );
      return;
    }
    to.isar = db;
  }

  Future<Isar> getCurrentDb() async {
    var userID = HiveService.to.getCurrentUserId();
    var isar = await Isar.open(schemas, name: userID);
    await isar.close();
    // var isar = await Isar.getInstance(userID);
    return isar;
  }

  Future changeDb() async {
    final dbName = HiveService.to.getCurrentUserId();
    var instance = await Isar.getInstance(dbName);
    if (instance == null) {
      var isar = await Isar.open(schemas, name: dbName);
      to.isar = isar;
      AppLoggerUtil.i('current db ${to.isar.name}');
      return;
    }
    to.isar = instance;
    AppLoggerUtil.i('current db ${to.isar.name}');
  }

  static List<CollectionSchema> schemas = [
    UserDBSchema,
    ProductDbSchema,
  ];
}
