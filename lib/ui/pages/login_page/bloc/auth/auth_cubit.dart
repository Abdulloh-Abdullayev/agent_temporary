import 'package:agent/core/bloc/loader/loader_cubit.dart';
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
      // final authModel = await authService.login(
      //   url: APIConst.loginUrl(serverName),
      //   login: login,
      //   password: password,
      // );
      // if (authModel == null) {
      //   LoaderCubit.to.hide();
      //   BotToast.showText(text: "Login yoki parol xato!");
      //   return;
      // }
      LoaderCubit.to.hide();
      Modular.to.pushNamed(HomePage.routeName);
    } catch (e) {
      LoaderCubit.to.hide();
    }
  }
}
