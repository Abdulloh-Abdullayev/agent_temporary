import 'package:agent/core/bloc/loader/loader_cubit.dart';
import 'package:agent/core/constants/api_const.dart';
import 'package:agent/core/models/token_model/token_model.dart';
import 'package:agent/core/utils/app_logger_util.dart';
import 'package:agent/ui/pages/home/home_page.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:uikit/uikit.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  static AuthCubit get to => Modular.get<AuthCubit>();

  AuthCubit() : super(AuthState());
  final authService = AuthService();

  Future login(String serverName, String login, String password) async {
    try {
      LoaderCubit.to.show();
      final tokenModel = await authService.login(
        url: APIConst.tokenUrl(serverName),
        login: login,
        password: password,
      );
      if (tokenModel == null) {
        LoaderCubit.to.hide();
        return;
      }
      AppLoggerUtil.i(TokenModel.fromJson(tokenModel).toString());
      LoaderCubit.to.hide();
      Modular.to.pushNamed(HomePage.routeName);
    } catch (e) {
      AppLoggerUtil.e("$e");
      LoaderCubit.to.hide();
    }
  }
}
