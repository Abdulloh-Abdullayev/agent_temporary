import 'package:agent/core/bloc/app_navigation/app_navigation_bloc.dart';
import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/add_outlets_page/add_outlets_page.dart';
import 'package:agent/ui/pages/all_tasks_page/all_tasks_page.dart';
import 'package:agent/ui/pages/debtors_page/debtors_page.dart';
import 'package:agent/ui/pages/diagnostics_page/diagnostics_page.dart';
import 'package:agent/ui/pages/left_menu/account_item_widget.dart';
import 'package:agent/ui/pages/left_menu/accounts_cubit/accounts_cubit.dart';
import 'package:agent/ui/pages/left_menu/left_menu.dart';
import 'package:agent/ui/pages/order_page/order_page.dart';
import 'package:agent/ui/pages/profile_page/profile_page.dart';
import 'package:agent/ui/pages/remain_stock_page/remain_stock_page.dart';
import 'package:agent/ui/pages/salary_page/salary_page.dart';
import 'package:agent/ui/pages/settings_page/settings_page.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'add_account_button.dart';

class LeftMenuWidget extends StatelessWidget {
  const LeftMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountsCubit, AccountsState>(
      bloc: AccountsCubit.to,
      builder: (context, state) {
        return SafeArea(
          child: Drawer(
            width: 323.w,
            backgroundColor: ColorName.primaryColor,
            child: Column(
              children: [
                buildAccounts(state),
                Expanded(
                  child: SingleChildScrollView(
                    child: buildMenus(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Column buildMenus() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrawerItem(
          onTap: () {
            AppNavigationBloc.to.add(
              const AppNavigationChanged(
                appNavigationType: AppNavigationType.MAIN,
              ),
            );
          },
          text: LocaleKeys.main.tr(),
          icon: Assets.images.icons.homeIcon.svg(),
        ),
        DrawerItem(
          onTap: () {
            Modular.to.pushNamed(AddOutletsPage.routeName);
          },
          text: LocaleKeys.add_outlet.tr(),
          icon: Assets.images.icons.homeIcon2.svg(),
        ),
        DrawerItem(
          onTap: () {
            Modular.to.pushNamed(OrderPage.routeName);
          },
          text: LocaleKeys.orders.tr(),
          icon: Assets.images.icons.shopMenu.svg(),
        ),
        DrawerItem(
          onTap: () {
            Modular.to.pushNamed(RemainStockPage.routeName);
          },
          text: LocaleKeys.leftovers_warehouse.tr(),
          icon: Assets.images.icons.note.svg(),
        ),
        DrawerItem(
          onTap: () {
            Modular.to.pushNamed(DebtorsPage.routeName);
          },
          text: LocaleKeys.debtors_on_orders.tr(),
          icon: Assets.images.icons.user.svg(),
        ),
        DrawerItem(
          onTap: () {
            Modular.to.pushNamed(DebtorsPage.routeName);
          },
          text: LocaleKeys.debtors.tr(),
          icon: Assets.images.icons.userTimer.svg(),
        ),
        DrawerItem(
          onTap: () {},
          text: LocaleKeys.my_location.tr(),
          icon: Assets.images.icons.locationIcon.svg(),
        ),
        DrawerItem(
          onTap: () {
            Modular.to.pushNamed(AllTasksPage.routeName);
          },
          text: LocaleKeys.tasks.tr(),
          icon: Assets.images.icons.pinned.svg(),
        ),
        DrawerItem(
          onTap: () {
            Modular.to.pushNamed(SalaryPage.routeName);
          },
          text: LocaleKeys.kpi.tr(),
          icon: Assets.images.icons.pieIcon.svg(),
        ),
        DrawerItem(
          onTap: () {
            Modular.to.pushNamed(DiagnosticsPage.routeName);
          },
          text: LocaleKeys.diagnostics.tr(),
          icon: Assets.images.icons.pie2Chart.svg(),
        ),
        DrawerItem(
          onTap: () {
            Modular.to.pushNamed(SettingsPage.routeName);
          },
          text: LocaleKeys.settings.tr(),
          icon: Assets.images.icons.setting.svg(),
        ),
        DrawerItem(
          onTap: () {},
          text: LocaleKeys.share.tr(),
          icon: Assets.images.icons.share.svg(),
        ),
        AppWidgets.textLocale(
          localeKey: "${LocaleKeys.version.tr()} 12.3.8.7",
          color: ColorName.white.withOpacity(0.3),
        ).paddingOnly(
          top: 30.w,
          bottom: 30.w,
          left: 20.w,
        ),
      ],
    );
  }

  Widget buildAccounts(AccountsState state) {
    return Container(
      color: ColorName.drawerColor,
      padding: EdgeInsets.symmetric(
        vertical: 25.w,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Modular.to.pushNamed(ProfilePage.routeName);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppWidgets.circularAvatar(
                      imgUrl: state.selectedAccount!.imgUrl,
                    ).paddingOnly(right: 10.w),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppWidgets.text(
                          text: state.selectedAccount!.name,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorName.white,
                        ).paddingOnly(bottom: 4.w),
                        AppWidgets.text(
                          text:
                              "${LocaleKeys.server.tr()}: ${state.selectedAccount!.serverName}",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorName.white.withOpacity(0.5),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              AppWidgets.iconButton(
                onPressed: () {
                  AccountsCubit.to.onExpand();
                },
                icon: Assets.images.icons.downIcon,
                iconColor: Colors.white,
                content: AnimatedRotation(
                  duration: const Duration(milliseconds: 500),
                  turns: state.isExpended ? 0.5 : 1,
                  child: Assets.images.icons.downIcon
                      .svg(
                        color: ColorName.white,
                      )
                      .paddingAll(7),
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 20.w),
          AnimatedContainer(
            height: state.isExpended ? (state.accounts.length + 1) * 55 : 0,
            duration: const Duration(milliseconds: 300),
            child: ListView.separated(
              itemCount: state.accounts.length + 1,
              addSemanticIndexes: true,
              itemBuilder: (context, index) {
                if (index == state.accounts.length) {
                  return const AddAccountButton();
                }
                return AccountItemWidget(
                  accountModel: state.accounts[index],
                ).paddingSymmetric(horizontal: 20.w);
              },
              separatorBuilder: (BuildContext context, int index) {
                return AppWidgets.divider(
                  margin: EdgeInsets.symmetric(horizontal: 18.w),
                  color: Colors.white.withOpacity(0.1),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
