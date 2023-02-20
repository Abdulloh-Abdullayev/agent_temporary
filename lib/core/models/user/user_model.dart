import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
   factory UserModel({
    @JsonKey(name: "first_name") @Default("") String? firstName,
    @JsonKey(name: "last_name") @Default("") String? lastName,
    @JsonKey(name: 'middle_name') @Default("") String? middleName,
    @JsonKey(name: 'phone') @Default("") String? phone,
    @JsonKey(name: 'login') @Default("") String login,
    @JsonKey(name: 'agent_type') @Default("") String? agentType,
    @JsonKey(name: 'apk_version') String? apkVersion,
    @JsonKey(name: 'last_sync') DateTime? lastSync,
    @JsonKey(name: 'color') @Default("") String color,
    @JsonKey(name: 'code') @Default("") String code,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'id') @Default("") String id,
    String? token,
    String? refreshToken,
    DateTime? expireTime,
    String? serverName,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

// part 'token_model.freezed.dart';
// part 'token_model.g.dart';
//
// @freezed
// class TokenModel with _$TokenModel {
//   factory TokenModel({
//     @JsonKey(name: 'token') String? token,
//     @JsonKey(name: 'refresh_token') String? refreshToken,
//     @JsonKey(name: 'refresh_token_expiry_time') DateTime? expireTime,
//   }) = _TokenModel;
//
//   factory TokenModel.fromJson(Map<String, dynamic> json) =>
//       _$TokenModelFromJson(json);
// }
