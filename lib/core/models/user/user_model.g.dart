// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      firstName: json['first_name'] as String? ?? "",
      lastName: json['last_name'] as String? ?? "",
      middleName: json['middle_name'] as String? ?? "",
      phone: json['phone'] as String? ?? "",
      login: json['login'] as String? ?? "",
      agentType: json['agent_type'] as String? ?? "",
      apkVersion: json['apk_version'] as String?,
      lastSync: json['last_sync'] == null
          ? null
          : DateTime.parse(json['last_sync'] as String),
      color: json['color'] as String? ?? "",
      code: json['code'] as String? ?? "",
      fullName: json['full_name'] as String?,
      id: json['id'] as String? ?? "",
      token: json['token'] as String?,
      refreshToken: json['refreshToken'] as String?,
      expireTime: json['expireTime'] == null
          ? null
          : DateTime.parse(json['expireTime'] as String),
      serverName: json['serverName'] as String?,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'middle_name': instance.middleName,
      'phone': instance.phone,
      'login': instance.login,
      'agent_type': instance.agentType,
      'apk_version': instance.apkVersion,
      'last_sync': instance.lastSync?.toIso8601String(),
      'color': instance.color,
      'code': instance.code,
      'full_name': instance.fullName,
      'id': instance.id,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'expireTime': instance.expireTime?.toIso8601String(),
      'serverName': instance.serverName,
    };
