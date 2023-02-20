import 'package:agent/core/models/user/user_model.dart';
import 'package:agent/core/services/account_service/user_db/user_db.dart';
import 'package:agent/core/services/db/models/product/product_db.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class AccountService {
  static AccountService get to => Modular.get<AccountService>();
  late Isar isar;

  static Future<AccountService> init() async {
    var instance = AccountService();
    final dir = await getApplicationSupportDirectory();
    instance.isar = await Isar.open(
      [
        UserDBSchema,
        ProductDbSchema,
      ],
      directory: dir.path,
      name: 'accountsdb',
    );
    return instance;
  }

  Future addUserDB(UserModel userModel) async {
    var usersDB = await to.isar.userDBs.where().apiIdProperty().findAll();
    String? userid =
        usersDB.firstWhere((element) => element == userModel.id, orElse: () {
      return null;
    });
    if (userid == null) {
      await to.isar.writeTxn(() async {
        to.isar.userDBs.put(UserDB.fromUser(userModel));
      });
    }
  }

  Future removeUserDb(UserModel userModel) async {
    await to.isar.userDBs.filter().apiIdContains(userModel.id).deleteAll();
  }

  Future<List<UserModel>> getUsers() async {
    return (await to.isar.userDBs.where().findAll())
        .map((e) => e.toUserModel())
        .toList();
  }
}
