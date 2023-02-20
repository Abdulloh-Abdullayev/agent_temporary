import 'package:agent/core/constants/api_const.dart';
import 'package:agent/core/models/user/user_model.dart';
import 'package:agent/core/services/http/http_service.dart';
import 'package:agent/core/utils/app_logger_util.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UserService {
  static UserService get to => Modular.get<UserService>();
  final httpService = HttpService.to;

  Future<UserModel?> getCurrentUser(String token) async {
    try {
      final response = await httpService.get(
        path: APIConst.currentUser,
        token: token,
      );
      return UserModel.fromJson(response.data);
    } catch (e) {
      AppLoggerUtil.e("getCurrentUser $e");
      return null;
    }
  }
}
