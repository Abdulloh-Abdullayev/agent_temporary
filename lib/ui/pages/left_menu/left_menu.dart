import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/history_orders/history_orders_page.dart';
import 'package:agent/ui/pages/left_menu/bloc/left_menu_bloc.dart';
import 'package:agent/ui/pages/left_menu/widget/create_account_widget.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeftMenuModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          LeftMenuPage.routeName,
          child: (context, args) => LeftMenuPage(),
        ),
      ];
}

class LeftMenuPage extends StatelessWidget {
  static String routeName = "/left-menu";
  var bloc = LeftMenuBloc.to;

  LeftMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<LeftMenuBloc, LeftMenuState>(
        bloc: bloc,
        builder: (context, state) {
          return Drawer(
            backgroundColor: ColorName.primaryColor,
            width: 325.w,
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  width: 325.w,
                  decoration: const BoxDecoration(
                    color: ColorName.drawerColor,
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 27.r,
                                child: CachedNetworkImage(
                                  width: 54,
                                  height: 54,
                                  imageUrl: "",
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => Icon(
                                    Icons.person,
                                    color: ColorName.white,
                                    size: 50.w,
                                  ),
                                ),
                              ).paddingOnly(right: 10.w),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppWidgets.text(
                                    text: "Agent 007",
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: ColorName.white,
                                  ).paddingOnly(bottom: 4.w),
                                  AppWidgets.text(
                                    text: "Сервер: Distr",
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: ColorName.white.withOpacity(0.5),
                                  ),
                                ],
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              bloc.add(HideShowed(!state.hideShow));
                            },

                            child: Container(
                              height: 28.w,
                              width: 28.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color.fromRGBO(255, 255, 255, 0.1),
                              ),
                              child: Center(
                                child: AnimatedRotation(
                                  duration: const Duration(milliseconds: 400),
                                  turns: state.hideShow ? 0.5 : 1,
                                  child: Assets.images.icons.downIcon.svg(
                                    width: 14.w,
                                    height: 8.w,
                                    color: ColorName.white,
                                  ),
                                ),
                              ),
                            ),

                            // AppWidgets.iconButton(onPressed: (){}, icon:  Assets.images.icons.downIcon)
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 20.w, vertical: 25.w),
                      state.hideShow
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: listAccounts.length,
                              itemBuilder: (context, index) =>
                                  listAccounts[index],
                            ).paddingSymmetric(horizontal: 20.w)
                          : const SizedBox(),
                      state.hideShow
                          ? Column(
                              children: [
                                Divider(
                                  color: ColorName.white.withOpacity(0.1),
                                ).paddingSymmetric(vertical: 12.w),
                                DrawerItem(
                                  text: LocaleKeys.add_account.tr(),
                                  textColor: ColorName.textAddAccount,
                                  onTap: () {
                                    Modular.to.pushNamed(
                                        CreateAccountWidget.routeName);
                                  },
                                  icon: const Icon(
                                    Icons.add,
                                    color: ColorName.textAddAccount,
                                  ).paddingOnly(left: 20.w),
                                ),
                              ],
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
                buildMenus(),
                AppWidgets.textLocale(
                  localeKey: "Версия 12.3.8.7",
                  color: ColorName.white.withOpacity(0.3),
                ).paddingOnly(
                  top: 30.w,
                  bottom: 30.w,
                  left: 20.w,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Column buildMenus() {
    return Column(
      children: [
        DrawerItem(
          onTap: () {},
          text: "Главная",
          icon: Assets.images.icons.homeIcon.svg(),
        ),
        DrawerItem(
          onTap: () {},
          text: "Добавить торговую точку",
          icon: Assets.images.icons.plus.svg(),
        ),
        DrawerItem(
          onTap: () {
            Modular.to.pushNamed(HistoryOrdersPage.routeName);
          },
          text: "Заказы",
          icon: Assets.images.icons.card.svg(),
        ),
        DrawerItem(
          onTap: () {},
          text: "Остатки",
          icon: Assets.images.icons.note.svg(),
        ),
        DrawerItem(
          onTap: () {},
          text: "Должники по заказам",
          icon: Assets.images.icons.user.svg(),
        ),
        DrawerItem(
          onTap: () {},
          text: "Должники",
          icon: Assets.images.icons.userTimer.svg(),
        ),
        DrawerItem(
          onTap: () {},
          text: "Моя локация",
          icon: Assets.images.icons.locationIcon.svg(),
        ),
        DrawerItem(
          onTap: () {},
          text: "Задачи",
          icon: Assets.images.icons.pinned.svg(),
        ),
        DrawerItem(
          onTap: () {},
          text: "KPI",
          icon: Assets.images.icons.pieIcon.svg(),
        ),
        DrawerItem(
          onTap: () {},
          text: "Диагностика",
          icon: Assets.images.icons.pie2Chart.svg(),
        ),
        DrawerItem(
          onTap: () {},
          text: "Настройки",
          icon: Assets.images.icons.setting.svg(),
        ),
        DrawerItem(
          onTap: () {},
          text: "Поделиться",
          icon: Assets.images.icons.share.svg(),
        ),
      ],
    );
  }

  List<Widget> listAccounts = [
    Column(
      children: [
        Divider(color: ColorName.white.withOpacity(0.1))
            .paddingOnly(bottom: 12.w),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 15.r,
                  child: CachedNetworkImage(
                    width: 30.w,
                    height: 30.w,
                    imageUrl: "",
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(
                      Icons.person,
                      color: ColorName.white,
                      size: 27.w,
                    ),
                  ),
                ).paddingOnly(right: 8.w),
                AppWidgets.text(
                  text: "Agent 007",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorName.white,
                )
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Assets.images.icons.edit.svg(
                    width: 24.w,
                    height: 24.w,
                  ),
                ).paddingOnly(right: 12.w),
                InkWell(
                  onTap: () {},
                  child: Assets.images.icons.logout.svg(
                    width: 24.w,
                    height: 24.w,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    )
  ];
}

class DrawerItem extends StatelessWidget {
  final String text;
  final Function onTap;
  final Widget icon;
  final Color textColor;

  const DrawerItem({
    Key? key,
    required this.text,
    required this.onTap,
    required this.icon,
    this.textColor = ColorName.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: SizedBox(
        height: 55,
        child: Row(
          children: [
            icon.paddingOnly(right: 15.w),
            AppWidgets.textLocale(
              localeKey: text,
              color: textColor,
            ),
          ],
        ).paddingOnly(left: 20.w),
      ),
    );
  }
}
