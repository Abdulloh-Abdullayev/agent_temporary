import 'dart:async';

import 'package:agent/app.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ModuleInitGuard extends RouteGuard {
  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    await Modular.isModuleReady<AppModule>();
    return true;
  }
}
