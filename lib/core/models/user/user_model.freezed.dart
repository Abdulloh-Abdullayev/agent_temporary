// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: "first_name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'middle_name')
  String? get middleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'login')
  String get login => throw _privateConstructorUsedError;
  @JsonKey(name: 'agent_type')
  String? get agentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'apk_version')
  String? get apkVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_sync')
  DateTime? get lastSync => throw _privateConstructorUsedError;
  @JsonKey(name: 'color')
  String get color => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  String get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;
  DateTime? get expireTime => throw _privateConstructorUsedError;
  String? get serverName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: 'middle_name') String? middleName,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'login') String login,
      @JsonKey(name: 'agent_type') String? agentType,
      @JsonKey(name: 'apk_version') String? apkVersion,
      @JsonKey(name: 'last_sync') DateTime? lastSync,
      @JsonKey(name: 'color') String color,
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'id') String id,
      String? token,
      String? refreshToken,
      DateTime? expireTime,
      String? serverName});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middleName = freezed,
    Object? phone = freezed,
    Object? login = null,
    Object? agentType = freezed,
    Object? apkVersion = freezed,
    Object? lastSync = freezed,
    Object? color = null,
    Object? code = null,
    Object? fullName = freezed,
    Object? id = null,
    Object? token = freezed,
    Object? refreshToken = freezed,
    Object? expireTime = freezed,
    Object? serverName = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      agentType: freezed == agentType
          ? _value.agentType
          : agentType // ignore: cast_nullable_to_non_nullable
              as String?,
      apkVersion: freezed == apkVersion
          ? _value.apkVersion
          : apkVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSync: freezed == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expireTime: freezed == expireTime
          ? _value.expireTime
          : expireTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      serverName: freezed == serverName
          ? _value.serverName
          : serverName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_UserModelCopyWith(
          _$_UserModel value, $Res Function(_$_UserModel) then) =
      __$$_UserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: 'middle_name') String? middleName,
      @JsonKey(name: 'phone') String? phone,
      @JsonKey(name: 'login') String login,
      @JsonKey(name: 'agent_type') String? agentType,
      @JsonKey(name: 'apk_version') String? apkVersion,
      @JsonKey(name: 'last_sync') DateTime? lastSync,
      @JsonKey(name: 'color') String color,
      @JsonKey(name: 'code') String code,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'id') String id,
      String? token,
      String? refreshToken,
      DateTime? expireTime,
      String? serverName});
}

/// @nodoc
class __$$_UserModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_UserModel>
    implements _$$_UserModelCopyWith<$Res> {
  __$$_UserModelCopyWithImpl(
      _$_UserModel _value, $Res Function(_$_UserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? middleName = freezed,
    Object? phone = freezed,
    Object? login = null,
    Object? agentType = freezed,
    Object? apkVersion = freezed,
    Object? lastSync = freezed,
    Object? color = null,
    Object? code = null,
    Object? fullName = freezed,
    Object? id = null,
    Object? token = freezed,
    Object? refreshToken = freezed,
    Object? expireTime = freezed,
    Object? serverName = freezed,
  }) {
    return _then(_$_UserModel(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      login: null == login
          ? _value.login
          : login // ignore: cast_nullable_to_non_nullable
              as String,
      agentType: freezed == agentType
          ? _value.agentType
          : agentType // ignore: cast_nullable_to_non_nullable
              as String?,
      apkVersion: freezed == apkVersion
          ? _value.apkVersion
          : apkVersion // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSync: freezed == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      expireTime: freezed == expireTime
          ? _value.expireTime
          : expireTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      serverName: freezed == serverName
          ? _value.serverName
          : serverName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserModel implements _UserModel {
  _$_UserModel(
      {@JsonKey(name: "first_name") this.firstName = "",
      @JsonKey(name: "last_name") this.lastName = "",
      @JsonKey(name: 'middle_name') this.middleName = "",
      @JsonKey(name: 'phone') this.phone = "",
      @JsonKey(name: 'login') this.login = "",
      @JsonKey(name: 'agent_type') this.agentType = "",
      @JsonKey(name: 'apk_version') this.apkVersion,
      @JsonKey(name: 'last_sync') this.lastSync,
      @JsonKey(name: 'color') this.color = "",
      @JsonKey(name: 'code') this.code = "",
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'id') this.id = "",
      this.token,
      this.refreshToken,
      this.expireTime,
      this.serverName});

  factory _$_UserModel.fromJson(Map<String, dynamic> json) =>
      _$$_UserModelFromJson(json);

  @override
  @JsonKey(name: "first_name")
  final String? firstName;
  @override
  @JsonKey(name: "last_name")
  final String? lastName;
  @override
  @JsonKey(name: 'middle_name')
  final String? middleName;
  @override
  @JsonKey(name: 'phone')
  final String? phone;
  @override
  @JsonKey(name: 'login')
  final String login;
  @override
  @JsonKey(name: 'agent_type')
  final String? agentType;
  @override
  @JsonKey(name: 'apk_version')
  final String? apkVersion;
  @override
  @JsonKey(name: 'last_sync')
  final DateTime? lastSync;
  @override
  @JsonKey(name: 'color')
  final String color;
  @override
  @JsonKey(name: 'code')
  final String code;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  final String? token;
  @override
  final String? refreshToken;
  @override
  final DateTime? expireTime;
  @override
  final String? serverName;

  @override
  String toString() {
    return 'UserModel(firstName: $firstName, lastName: $lastName, middleName: $middleName, phone: $phone, login: $login, agentType: $agentType, apkVersion: $apkVersion, lastSync: $lastSync, color: $color, code: $code, fullName: $fullName, id: $id, token: $token, refreshToken: $refreshToken, expireTime: $expireTime, serverName: $serverName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserModel &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.login, login) || other.login == login) &&
            (identical(other.agentType, agentType) ||
                other.agentType == agentType) &&
            (identical(other.apkVersion, apkVersion) ||
                other.apkVersion == apkVersion) &&
            (identical(other.lastSync, lastSync) ||
                other.lastSync == lastSync) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.expireTime, expireTime) ||
                other.expireTime == expireTime) &&
            (identical(other.serverName, serverName) ||
                other.serverName == serverName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      middleName,
      phone,
      login,
      agentType,
      apkVersion,
      lastSync,
      color,
      code,
      fullName,
      id,
      token,
      refreshToken,
      expireTime,
      serverName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      __$$_UserModelCopyWithImpl<_$_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserModelToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {@JsonKey(name: "first_name") final String? firstName,
      @JsonKey(name: "last_name") final String? lastName,
      @JsonKey(name: 'middle_name') final String? middleName,
      @JsonKey(name: 'phone') final String? phone,
      @JsonKey(name: 'login') final String login,
      @JsonKey(name: 'agent_type') final String? agentType,
      @JsonKey(name: 'apk_version') final String? apkVersion,
      @JsonKey(name: 'last_sync') final DateTime? lastSync,
      @JsonKey(name: 'color') final String color,
      @JsonKey(name: 'code') final String code,
      @JsonKey(name: 'full_name') final String? fullName,
      @JsonKey(name: 'id') final String id,
      final String? token,
      final String? refreshToken,
      final DateTime? expireTime,
      final String? serverName}) = _$_UserModel;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$_UserModel.fromJson;

  @override
  @JsonKey(name: "first_name")
  String? get firstName;
  @override
  @JsonKey(name: "last_name")
  String? get lastName;
  @override
  @JsonKey(name: 'middle_name')
  String? get middleName;
  @override
  @JsonKey(name: 'phone')
  String? get phone;
  @override
  @JsonKey(name: 'login')
  String get login;
  @override
  @JsonKey(name: 'agent_type')
  String? get agentType;
  @override
  @JsonKey(name: 'apk_version')
  String? get apkVersion;
  @override
  @JsonKey(name: 'last_sync')
  DateTime? get lastSync;
  @override
  @JsonKey(name: 'color')
  String get color;
  @override
  @JsonKey(name: 'code')
  String get code;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  String? get token;
  @override
  String? get refreshToken;
  @override
  DateTime? get expireTime;
  @override
  String? get serverName;
  @override
  @JsonKey(ignore: true)
  _$$_UserModelCopyWith<_$_UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
