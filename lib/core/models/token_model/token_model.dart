import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.freezed.dart';
part 'token_model.g.dart';

@freezed
class TokenModel with _$TokenModel {
   factory TokenModel({
   @JsonKey(name: 'token') String? token,
   @JsonKey(name: 'refresh_token') String? refreshToken,
   @JsonKey(name: 'refresh_token_expiry_time') DateTime? expireTime,
}) = _TokenModel;

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);
}
