import 'package:agent/ui/pages/act_reconciliation_oder_page/act_reconciliation_oder_page.dart';
import 'package:agent/ui/pages/act_reconciliation_page/act_reconciliation_page.dart';
import 'package:agent/ui/pages/visits_page/visits_page.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:agent/core/bloc/language/language_cubit.dart';
import 'package:agent/core/services/db/db_service.dart';
import 'package:agent/core/services/hive_service.dart';
import 'package:agent/core/services/http/http_service.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(actReconciliationOderPage.routeName);
    Modular.setObservers([BotToastNavigatorObserver()]);
    return BlocBuilder<LanguageCubit, Locale>(
      bloc: LanguageCubit.to,
      buildWhen: (previous, current) {
        Future.sync(() => context.setLocale(current));
        return true;
      },
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(375, 817),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => MaterialApp.router(
            title: "ThinkBooking",
            debugShowCheckedModeBanner: false,
            locale: context.locale,
            builder: EasyLoading.init(
              builder: BotToastInit(),
            ),
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routeInformationParser: Modular.routeInformationParser,
            routerDelegate: Modular.routerDelegate,
          ),
        );
      },
    );
  }
}

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton<HttpService>((i) => HttpService.init()),
        Bind.singleton<LanguageCubit>(
          (i) => LanguageCubit(),
          onDispose: (v) => v.close(),
        ),
        AsyncBind<HiveService>((i) => HiveService.init()),
        AsyncBind<DBService>((i) => DBService.init()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute("/", module: VisitsPageModule()),
        ModuleRoute("/", module: ActReconciliationOderPageModule()),
        ModuleRoute("/", module: ActReconciliationPageModule()),
      ];
}
