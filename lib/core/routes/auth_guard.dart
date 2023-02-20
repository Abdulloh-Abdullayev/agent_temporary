import 'dart:async';

import 'package:agent/core/services/hive_service.dart';
import 'package:agent/ui/pages/left_menu/accounts_cubit/accounts_cubit.dart';
import 'package:agent/ui/pages/login_page/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: LoginPage.routeName);

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    // check login here
    if (HiveService.to.getIsLoggedIn()) {
      await AccountsCubit.to.load();
    }
    return HiveService.to.getIsLoggedIn();
  }
}
