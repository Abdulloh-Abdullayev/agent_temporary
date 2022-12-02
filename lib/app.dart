import 'package:agent/core/bloc/language/language_cubit.dart';
import 'package:agent/core/services/db/db_service.dart';
import 'package:agent/core/services/hive_service.dart';
import 'package:agent/core/services/http/http_service.dart';
import 'package:agent/ui/pages/customer_data_editing_page/customer_data_editing_page.dart';
import 'package:agent/ui/pages/customer_data_page/customer_data_page.dart';
import 'package:agent/ui/pages/debtors_page/debtors_page.dart';
import 'package:agent/ui/pages/diagnostics_page/diagnostics_page.dart';
import 'package:agent/ui/pages/history_orders/history_orders_page.dart';
import 'package:agent/ui/pages/history_orders/widgets/order_from_widget.dart';
import 'package:agent/ui/pages/home/home_page.dart';
import 'package:agent/ui/pages/left_menu/left_menu.dart';
import 'package:agent/ui/pages/left_menu/widget/create_account_widget.dart';
import 'package:agent/ui/pages/login_page/login_page.dart';
import 'package:agent/ui/pages/order_page/order_page.dart';
import 'package:agent/ui/pages/return_from_shelf/return_order_page.dart';
import 'package:agent/ui/pages/remain_stock_page/remain_stock_page.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ui/pages/add_order_page/add_order_page.dart';
import 'ui/pages/balance_page/balance_page.dart';
import 'ui/pages/debtors_page/widget/deptors_history.dart';
import 'ui/pages/outlets_page/outlets_map_page.dart';
import 'ui/pages/refund_page/refund_page.dart';
import 'ui/pages/return_about_page/return_about_page.dart';
import 'ui/pages/return_from_shelf/return_from_shelf.dart';
import 'ui/pages/rest_of_container_page/rest_of_container_page.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    this.androidOverscrollIndicator = AndroidOverscrollIndicator.glow,
  }) : super(key: key);

  final AndroidOverscrollIndicator androidOverscrollIndicator;

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(OrderPage.routeName);
    Modular.setObservers([BotToastNavigatorObserver()]
    );
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
            androidOverscrollIndicator:androidOverscrollIndicator,
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
        ModuleRoute("/", module: HomePageModule()),
        ModuleRoute("/", module: LoginPageModule()),
        ModuleRoute("/", module: BalancePageModule()),
        ModuleRoute("/", module: RefundPageModule()),
        ModuleRoute("/", module: OutletsMapModule()),
        ModuleRoute("/", module: LeftMenuModule()),
        ModuleRoute("/", module: CreateAccountModule()),
        ModuleRoute("/", module: OrderPageModule()),
        ModuleRoute("/", module: CustomerDataPageModule()),
        ModuleRoute("/", module: CustomerDataEditingPageModule()),
        ModuleRoute("/", module: DiagnosticsPageModule()),
        ModuleRoute("/", module: DebtorsPageModule()),
        ModuleRoute("/", module: RemainStockPageModel()),
        ModuleRoute("/", module: DebtorsHistoryModule()),
        ModuleRoute("/", module: OrderPageModule()),
        ModuleRoute("/", module: CustomerDataPageModule()),
        ModuleRoute("/", module: CustomerDataEditingPageModule()),
        ModuleRoute("/", module: DiagnosticsPageModule()),
        ModuleRoute("/", module: RestContainerPageModule()),
        ModuleRoute("/", module: ReturnOrderDatePageModule()),
        ModuleRoute("/", module: ReturnFromShelfModule()),
        ModuleRoute("/", module: ReturnAboutPageModule()),
        ModuleRoute("/", module: OrderPageModule()),
        ModuleRoute("/", module: CustomerDataPageModule()),
        ModuleRoute("/", module: CustomerDataEditingPageModule()),
        ModuleRoute("/", module: DiagnosticsPageModule()),
        ModuleRoute("/", module: OrderPageModule()),
        ModuleRoute("/", module: CustomerDataPageModule()),
        ModuleRoute("/", module: CustomerDataEditingPageModule()),
        ModuleRoute("/", module: DiagnosticsPageModule()),
        ModuleRoute("/", module: HistoryOrdersModule()),
        ModuleRoute("/", module: OrderFromModule()),
        ModuleRoute("/", module: AddOrderPageModule()),
      ];
}
