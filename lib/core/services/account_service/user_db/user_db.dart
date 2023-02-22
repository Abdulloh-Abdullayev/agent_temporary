import 'package:agent/core/models/user/user_model.dart';
import 'package:isar/isar.dart';

part 'user_db.g.dart';

@collection
class UserDB {
  Id? id;
  String? apiId;
  String? firstName;
  String? lastName;
  String? middleName;
  String? phone;
  String? login;
  String? agentType;
  String? apkVersion;
  DateTime? lastSync;
  String? color;
  String? code;
  String? fullName;
  String? token;
  String? refreshToken;
  DateTime? expireTime;
  String? serverName;

  static UserDB fromUser(UserModel model) {
    return UserDB()
      ..apiId = model.id
      ..firstName = model.firstName
      ..lastName = model.lastName
      ..middleName = model.middleName
      ..phone = model.phone
      ..login = model.login
      ..agentType = model.agentType
      ..apkVersion = model.apkVersion
      ..lastSync = model.lastSync
      ..color = model.color
      ..code = model.code
      ..fullName = model.fullName
      ..token = model.token
      ..refreshToken = model.refreshToken
      ..expireTime = model.expireTime
      ..serverName = model.serverName;
  }

  UserModel toUserModel() {
    return UserModel(
      id: apiId!,
      firstName: firstName,
      lastName: lastName,
      middleName: middleName,
      phone: phone,
      login: login ?? "",
      agentType: agentType,
      apkVersion: apkVersion,
      lastSync: lastSync,
      color: color ?? '',
      code: code ?? '',
      fullName: fullName,
      token: token,
      refreshToken: refreshToken,
      expireTime: expireTime,
      serverName: serverName,
    );
  }
}
