import 'package:agent/core/routes/module_init_guard.dart';
import 'package:agent/core/utils/app_logger_util.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'bloc/auth/auth_cubit.dart';
import 'package:uikit/uikit.dart';

class LoginPageModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<AuthCubit>(
          (i) => AuthCubit(),
          onDispose: (value) => value.close(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          LoginPage.routeName,
          child: (context, args) => LoginPage(),
          guards: [
            ModuleInitGuard(),
          ],
        )
      ];
}

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  static const String routeName = "/loginPage";

  @override
  Widget build(BuildContext context) {
    return LoginWidget(
      localeCode: context.locale.languageCode,
      submit: (serverName, login, password) async {
        AppLoggerUtil.i("logs -> $serverName $login $password");
        await AuthCubit.to.login(serverName, login, password);
      },
      noConnectionBuilder: () {
        BotToast.showText(text: "no internet connection");
      },
      fieldsEmptyBuilder: () {
        BotToast.showText(text: "fill all fields");
      },
    );
  }
}
