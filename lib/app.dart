import 'package:agent/core/bloc/language/language_cubit.dart';
import 'package:agent/core/bloc/loader/loader_cubit.dart';
import 'package:agent/core/bloc/sync_data_bloc/sync_data_bloc.dart';
import 'package:agent/core/services/account_service/account_service.dart';
import 'package:agent/core/services/db/db_service.dart';
import 'package:agent/core/services/hive_service.dart';
import 'package:agent/core/services/http/http_service.dart';
import 'package:agent/core/services/http/user_service.dart';
import 'package:agent/ui/pages/about_order/about_order.dart';
import 'package:agent/ui/pages/act_reconciliation_oder_page/act_reconciliation_oder_page.dart';
import 'package:agent/ui/pages/act_reconciliation_page/act_reconciliation_page.dart';
import 'package:agent/ui/pages/all_tasks_page/all_tasks_page.dart';
import 'package:agent/ui/pages/all_tasks_page/widgets/clicked_item.dart';
import 'package:agent/ui/pages/visits_page/visits_page.dart';
import 'package:agent/ui/pages/customer_data_editing_page/customer_data_editing_page.dart';
import 'package:agent/ui/pages/customer_data_page/customer_data_page.dart';
import 'package:agent/ui/pages/debtors_page/debtors_page.dart';
import 'package:agent/ui/pages/diagnostics_page/diagnostics_page.dart';
import 'package:agent/ui/pages/draft_page/draft_page.dart';
import 'package:agent/ui/pages/equipment_page/equipment_page.dart';
import 'package:agent/ui/pages/equipment_page/pages/add_equipment_page.dart';
import 'package:agent/ui/pages/history_orders/history_orders_page.dart';
import 'package:agent/ui/pages/history_orders/widgets/order_from_widget.dart';
import 'package:agent/ui/pages/home/home_page.dart';
import 'package:agent/ui/pages/left_menu/left_menu.dart';
import 'package:agent/ui/pages/left_menu/widget/create_account_widget.dart';
import 'package:agent/ui/pages/login_page/login_page.dart';
import 'package:agent/ui/pages/order_page/order_page.dart';
import 'package:agent/ui/pages/remain_page/pages/remains_edit_page.dart';
import 'package:agent/ui/pages/remain_page/pages/remains_item_page.dart';
import 'package:agent/ui/pages/remain_stock_page/remain_stock_page.dart';
import 'package:agent/ui/pages/return_from_shelf/return_order_page.dart';
import 'package:agent/ui/pages/salary_page/salary_page.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'ui/pages/add_order_page/add_order_page.dart';
import 'ui/pages/balance_page/balance_page.dart';
import 'ui/pages/left_menu/accounts_cubit/accounts_cubit.dart';
import 'ui/pages/outlets_page/outlets_map_page.dart';
import 'ui/pages/profile_page/profile_page.dart';
import 'ui/pages/refund_page/refund_page.dart';
import 'ui/pages/rest_of_container_page/rest_of_container_page.dart';
import 'ui/pages/return_about_page/return_about_page.dart';
import 'ui/pages/return_from_shelf/return_from_shelf.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute(HomePage.routeName);
    // Modular.setInitialRoute(LoginPage.routeName);
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
            title: "PS Agent",
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
        AsyncBind<AccountService>((i) => AccountService.init()),
        AsyncBind<DBService>((i) => DBService.init()),
        Bind.lazySingleton<UserService>((i) => UserService()),
        Bind<LoaderCubit>(
          (i) => LoaderCubit(),
          onDispose: (v) => v.close(),
        ),
        Bind<AccountsCubit>(
          (i) => AccountsCubit(),
          onDispose: (value) => value.close(),
        ),
        Bind<SyncDataBloc>(
          (i) => SyncDataBloc(),
          onDispose: (v) => v.close(),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute("/", module: VisitsPageModule()),
        ModuleRoute("/", module: ActReconciliationOderPageModule()),
        ModuleRoute("/", module: ActReconciliationPageModule()),
        ModuleRoute("/", module: HomePageModule()),
        ModuleRoute("/", module: LoginPageModule()),
        ModuleRoute("/", module: BalancePageModule()),
        ModuleRoute("/", module: RefundPageModule()),
        ModuleRoute("/", module: AboutOrderModule()),
        ModuleRoute("/", module: EquipmentModule()),
        ModuleRoute("/", module: AddEquipmentModule()),
        ModuleRoute("/", module: OutletsMapModule()),
        ModuleRoute("/", module: LeftMenuModule()),
        ModuleRoute("/", module: CreateAccountModule()),
        ModuleRoute("/", module: CustomerDataEditingPageModule()),
        ModuleRoute("/", module: DiagnosticsPageModule()),
        ModuleRoute("/", module: DebtorsPageModule()),
        ModuleRoute("/", module: RemainStockPageModel()),
        // ModuleRoute("/", module: DebtorsHistoryModule()),

        ModuleRoute("/", module: OrderPageModule()),
        ModuleRoute("/", module: AllTasksModule()),
        ModuleRoute("/", module: CustomerDataPageModule()),
        ModuleRoute("/", module: RestContainerPageModule()),
        ModuleRoute("/", module: ReturnOrderDatePageModule()),
        ModuleRoute("/", module: ReturnFromShelfModule()),
        ModuleRoute("/", module: RemainsEditPageModule()),
        ModuleRoute("/", module: ReturnAboutPageModule()),
        ModuleRoute("/", module: EquipmentModule()),
        ModuleRoute("/", module: HistoryOrdersModule()),
        ModuleRoute("/", module: OrderFromModule()),
        ModuleRoute("/", module: AddOrderPageModule()),
        ModuleRoute("/", module: ClickedItemModule()),
        ModuleRoute("/", module: AddEquipmentModule()),
        ModuleRoute("/", module: RemainsItemPageModule()),
        ModuleRoute("/", module: ActReconciliationOderPageModule()),
        ModuleRoute("/", module: ActReconciliationPageModule()),
        ModuleRoute("/", module: DraftPageModule()),
        ModuleRoute("/", module: SalaryPageModule()),
        ModuleRoute("/", module: ProfilePageModule()),
      ];
}
