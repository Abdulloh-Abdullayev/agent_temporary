import 'package:agent/core/bloc/app_navigation/app_navigation_bloc.dart';
import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/ui/pages/add_outlets_page/add_outlets_page.dart';
import 'package:agent/ui/pages/draft_page/draft_page.dart';
import 'package:agent/ui/pages/home/widgets/app_navigation_bar.dart';
import 'package:agent/ui/pages/home/widgets/app_navigation_bar_item.dart';
import 'package:agent/ui/pages/left_menu/bloc/left_menu_bloc.dart';
import 'package:agent/ui/pages/left_menu/left_menu.dart';
import 'package:agent/ui/pages/main_page/bloc/main_cubit.dart';
import 'package:agent/ui/pages/main_page/main_page.dart';
import 'package:agent/ui/pages/outlets_page/outlets_page.dart';
import 'package:agent/ui/pages/reports_page/reports_page.dart';
import 'package:agent/ui/pages/settings_page/settings_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../all_tasks_page/bloc/all_task_bloc.dart';
import '../visits_page/visits_page.dart';

class HomePageModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          HomePage.routeName,
          child: (context, args) => const HomePage(),
        ),
        ModuleRoute("/", module: AddOutletsModule()),
        ModuleRoute("/", module: SettingsPageModule()),
      ];

  @override
  List<Bind<Object>> get binds => [
        Bind<AppNavigationBloc>(
          (i) => AppNavigationBloc(),
          onDispose: (value) => value.close(),
        ),
        Bind<MainCubit>(
          (i) => MainCubit(),
          onDispose: (value) => value.close(),
        ),
        Bind<LeftMenuBloc>(
          (i) => LeftMenuBloc(),
          onDispose: (value) => value.close(),
        ),
        Bind<AllTaskBloc>(
          (i) => AllTaskBloc(),
          onDispose: (value) => value.close(),
        ),
      ];
}

class HomePage extends StatelessWidget {
  static const String routeName = "/homePage";
  static final GlobalKey<ScaffoldState> globalKey =
      GlobalKey<ScaffoldState>(debugLabel: "globalKey");

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = Modular.get<AppNavigationBloc>();
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
      bloc: bloc,
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            key: HomePage.globalKey,
            drawer: LeftMenuPage(),
            extendBody: true,
            body: bodyBuilder(state.appNavigationType, context).paddingOnly(
              bottom: 70,
            ),
            bottomNavigationBar: AppNavigationBar(
              children: [
                AppNavigationBarItem(
                  onPressed: () {
                    bloc.add(
                      const AppNavigationChanged(
                        appNavigationType: AppNavigationType.MAIN,
                      ),
                    );
                  },
                  icon: Assets.images.icons.home.svg(),
                  iconOnTap: Assets.images.icons.homeActive.svg(),
                  title: LocaleKeys.main.tr(),
                  isActive: state.appNavigationType == AppNavigationType.MAIN,
                ),
                AppNavigationBarItem(
                  onPressed: () {
                    bloc.add(
                      const AppNavigationChanged(
                        appNavigationType: AppNavigationType.VISITS,
                      ),
                    );
                  },
                  icon: Assets.images.icons.location.svg(),
                  iconOnTap: Assets.images.icons.locationActive.svg(),
                  title: LocaleKeys.visits.tr(),
                  isActive: state.appNavigationType == AppNavigationType.VISITS,
                ),
                AppNavigationBarItem(
                  onPressed: () {
                    bloc.add(
                      const AppNavigationChanged(
                        appNavigationType: AppNavigationType.REPORT,
                      ),
                    );
                  },
                  icon: Assets.images.icons.pieChart.svg(),
                  iconOnTap: Assets.images.icons.pieChartActive.svg(),
                  title: LocaleKeys.report.tr(),
                  isActive: state.appNavigationType == AppNavigationType.REPORT,
                ),
                AppNavigationBarItem(
                  onPressed: () {
                    bloc.add(
                      const AppNavigationChanged(
                        appNavigationType: AppNavigationType.DRAFT,
                      ),
                    );
                  },
                  icon: Assets.images.icons.draft.svg(),
                  iconOnTap: Assets.images.icons.draftActive.svg(),
                  title: LocaleKeys.draft.tr(),
                  isActive: state.appNavigationType == AppNavigationType.DRAFT,
                ),
                AppNavigationBarItem(
                  onPressed: () {
                    bloc.add(
                      const AppNavigationChanged(
                        appNavigationType: AppNavigationType.POINTS,
                      ),
                    );
                  },
                  icon: Assets.images.icons.place.svg(),
                  iconOnTap: Assets.images.icons.placeActive.svg(),
                  title: LocaleKeys.outlets.tr(),
                  isActive: state.appNavigationType == AppNavigationType.POINTS,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget bodyBuilder(
    AppNavigationType appNavigationType,
    BuildContext context,
  ) {
    switch (appNavigationType) {
      case AppNavigationType.MAIN:
        return MainPage();
      case AppNavigationType.VISITS:
        return VisitsPage();
      case AppNavigationType.REPORT:
        return ReportsPage();
      case AppNavigationType.DRAFT:
        return DraftPage();
      case AppNavigationType.POINTS:
        return OutletsPage();
      default:
        return Container();
    }
  }
}
