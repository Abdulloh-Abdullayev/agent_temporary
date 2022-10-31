import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agent/core/bloc/app_navigation/app_navigation_bloc.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/ui/pages/Interesting_page/Interesting_page.dart';
import 'package:agent/ui/pages/communication_page/communication_page.dart';
import 'package:agent/ui/pages/home/widgets/app_navigation_bar.dart';
import 'package:agent/ui/pages/home/widgets/app_navigation_bar_item.dart';
import 'package:agent/ui/pages/profile_page/profile_page.dart';
import 'package:agent/ui/pages/saved_ones_page/saved_ones_page.dart';
import 'package:agent/ui/pages/search_page/search_page.dart';

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
      ];
}

class HomePage extends StatelessWidget {
  static const String routeName = "/homePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = Modular.get<AppNavigationBloc>();
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            extendBody: true,
            body: bodyBuilder(state.appNavigationType, context),
            bottomNavigationBar: AppNavigationBar(
              children: [
                AppNavigationBarItem(
                  onPressed: () {
                    bloc.add(
                      const AppNavigationChanged(
                        appNavigationType: AppNavigationType.SEARCH,
                      ),
                    );
                  },
                  icon: Assets.images.icons.search.svg(),
                  iconOnTap: Assets.images.icons.searchActive.svg(),
                  title: "Qidirish",
                  isActive: state.appNavigationType == AppNavigationType.SEARCH,
                ),
                AppNavigationBarItem(
                  onPressed: () {
                    bloc.add(
                      const AppNavigationChanged(
                        appNavigationType: AppNavigationType.SAVED,
                      ),
                    );
                  },
                  icon: Assets.images.icons.savedOnes.svg(),
                  iconOnTap: Assets.images.icons.savedOnesActive.svg(),
                  title: "Saqlanganlar",
                  isActive: state.appNavigationType == AppNavigationType.SAVED,

                ),
                AppNavigationBarItem(
                  onPressed: () {
                    bloc.add(
                      const AppNavigationChanged(
                        appNavigationType: AppNavigationType.INTERESTING,
                      ),
                    );
                  },
                  icon: Assets.images.icons.interesting.svg(),
                  iconOnTap: Assets.images.icons.interestingActive.svg(),
                  title: "Qiziqarli",
                  isActive:
                      state.appNavigationType == AppNavigationType.INTERESTING,
                ),
                AppNavigationBarItem(
                  onPressed: () {
                    bloc.add(
                      const AppNavigationChanged(
                        appNavigationType: AppNavigationType.COMMUNICATION,
                      ),
                    );
                  },
                  icon: Assets.images.icons.communication.svg(),
                  iconOnTap: Assets.images.icons.communicationActive.svg(),
                  title: "Profil",
                  isActive: state.appNavigationType ==
                      AppNavigationType.COMMUNICATION,
                ),
                AppNavigationBarItem(
                  onPressed: () {
                    bloc.add(
                      const AppNavigationChanged(
                        appNavigationType: AppNavigationType.PROFILE,
                      ),
                    );
                  },
                  icon: Assets.images.icons.profile.svg(),
                  iconOnTap: Assets.images.icons.profileActive.svg(),
                  title: "Qidirish",
                  isActive:
                      state.appNavigationType == AppNavigationType.PROFILE,
                )
              ],
            ),
          );
        });
  }

  Widget bodyBuilder(
    AppNavigationType appNavigationType,
    BuildContext context,
  ) {
    switch (appNavigationType) {
      case AppNavigationType.SEARCH:
        return const SearchPage();
      case AppNavigationType.SAVED:
        return const SavedOnesPage();
      case AppNavigationType.INTERESTING:
        return const InterestingPage();
      case AppNavigationType.COMMUNICATION:
        return const CommunicationPage();
      case AppNavigationType.PROFILE:
        return const ProfilePage();
      default:
        return Container();
    }
  }
}
