import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import 'widgets/basic_settings_widget.dart';
import 'widgets/general_settings_widget.dart';

class SettingsPageModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          SettingsPage.routeName,
          child: (context, args) => const SettingsPage(),
        )
      ];
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const String routeName = '/settingsPage';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.background,
      body: SafeArea(
        child: Column(
          children: [
            outletsAppBar(),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  BasicSettingsWidget(),
                  GeneralSettingsWidget()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget outletsAppBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 20.w, 20.w, 0),
      decoration: BoxDecoration(
        color: ColorName.primaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.backButton(
                () {
                  Modular.to.pop();
                },
              )
            ],
          ),
          AppWidgets.textLocale(
            localeKey: LocaleKeys.settings,
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
            color: Colors.white,
          ).paddingOnly(top: 20.w),
          AppTabBar(
            tabController: _tabController,
            onTap: (int index) {},
            disable: false,
            tabTitle: [
              LocaleKeys.main_settings.tr(),
              LocaleKeys.all_settings.tr(),
            ],
          )
        ],
      ),
    );
  }
}
