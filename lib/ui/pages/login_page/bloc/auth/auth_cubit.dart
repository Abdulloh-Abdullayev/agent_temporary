import 'package:agent/core/bloc/loader/loader_cubit.dart';
import 'package:agent/core/bloc/sync_bloc%20/sync_bloc.dart';
import 'package:agent/core/constants/api_const.dart';
import 'package:agent/core/models/token_model/token_model.dart';
import 'package:agent/core/models/user/user_model.dart';
import 'package:agent/core/services/account_service/account_service.dart';
import 'package:agent/core/services/db/db_service.dart';
import 'package:agent/core/services/hive_service.dart';
import 'package:agent/core/services/http/user_service.dart';
import 'package:agent/core/utils/app_logger_util.dart';
import 'package:agent/ui/pages/left_menu/accounts_cubit/accounts_cubit.dart';
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
      final tokenModel = TokenModel.fromJson((await authService.login(
        url: APIConst.tokenUrl(serverName),
        login: login,
        password: password,
      ))!);
      var user = await UserService.to.getCurrentUser(tokenModel.token ?? "");
      if (user == null) {
        LoaderCubit.to.hide();
        return;
      }
      UserModel newUser = user.copyWith(
        token: tokenModel.token,
        refreshToken: tokenModel.refreshToken,
        expireTime: tokenModel.expireTime,
        serverName: serverName,
      );
      AppLoggerUtil.i("${newUser.toString()}");
      HiveService.to.setCurrentUserId(newUser.id);
      await AccountService.to.addUserDB(newUser);
      await DBService.to.createDB(newUser.id);
      await AccountsCubit.to.load();
      LoaderCubit.to.hide();
      HiveService.to.setIsLoggedIn(true);
      SyncBloc.to.add(SyncLoaded(dbName: "dbName"));
    } catch (e) {
      AppLoggerUtil.e("$e");
      LoaderCubit.to.hide();
    }
  }
}
