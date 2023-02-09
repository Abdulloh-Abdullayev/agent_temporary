import 'package:freezed_annotation/freezed_annotation.dart';


part 'user_model.freezed.dart';
part 'user_model.g.dart';
@freezed
class UserModel with _$UserModel {
 const factory UserModel({
    @JsonKey(name: "name")String? name,
   @JsonKey(name: "age") int? age,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
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
