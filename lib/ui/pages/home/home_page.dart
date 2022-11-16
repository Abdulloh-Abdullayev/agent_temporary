import 'package:agent/core/bloc/app_navigation/app_navigation_bloc.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/ui/pages/Interesting_page/Interesting_page.dart';
import 'package:agent/ui/pages/communication_page/communication_page.dart';
import 'package:agent/ui/pages/home/widgets/app_navigation_bar.dart';
import 'package:agent/ui/pages/home/widgets/app_navigation_bar_item.dart';
import 'package:agent/ui/pages/left_menu/bloc/left_menu_bloc.dart';
import 'package:agent/ui/pages/left_menu/left_menu.dart';
import 'package:agent/ui/pages/main_page/bloc/main_cubit.dart';
import 'package:agent/ui/pages/main_page/main_page.dart';
import 'package:agent/ui/pages/profile_page/profile_page.dart';
import 'package:agent/ui/pages/main_page/bloc/main_cubit.dart';
import 'package:agent/ui/pages/main_page/main_page.dart';
import 'package:agent/ui/pages/outlets_page/outlets_page.dart';
import 'package:agent/ui/pages/saved_ones_page/saved_ones_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePageModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          HomePage.routeName,
          child: (context, args) => const HomePage(),
        ),
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
              body: bodyBuilder(state.appNavigationType, context),
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
                    title: "Главная",
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
                    title: "Визиты",
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
                    title: "Отчёт",
                    isActive:
                        state.appNavigationType == AppNavigationType.REPORT,
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
                    title: "Черновик",
                    isActive: state.appNavigationType ==
                        AppNavigationType.DRAFT,
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
                    title: "Тор. точки",
                    isActive:
                        state.appNavigationType == AppNavigationType.POINTS,
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget bodyBuilder(
    AppNavigationType appNavigationType,
    BuildContext context,
  ) {
    switch (appNavigationType) {
      case AppNavigationType.MAIN:
        return  MainPage();
      case AppNavigationType.VISITS:
        return  SavedOnesPage();
      case AppNavigationType.REPORT:
        return  InterestingPage();
      case AppNavigationType.DRAFT:
        return  CommunicationPage();
      case AppNavigationType.POINTS:
        return  OutletsPage();
      default:
        return Container();
    }
  }
}
