// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TokenModel _$$_TokenModelFromJson(Map<String, dynamic> json) =>
    _$_TokenModel(
      token: json['token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      expireTime: json['refresh_token_expiry_time'] == null
          ? null
          : DateTime.parse(json['refresh_token_expiry_time'] as String),
    );

Map<String, dynamic> _$$_TokenModelToJson(_$_TokenModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refresh_token': instance.refreshToken,
      'refresh_token_expiry_time': instance.expireTime?.toIso8601String(),
    };
