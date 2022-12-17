import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/order_page/pages/photo_report_page.dart';
import 'package:agent/ui/pages/order_page/pages/tabbar_order_page.dart';
import 'package:agent/ui/pages/remains_page/pages/remains_tabbar_page.dart';
import 'package:agent/ui/pages/remains_page/widgets/floating_show_widget.dart';
import 'package:agent/ui/pages/remains_page/widgets/remains_page_widgets.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class RemainsPageModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          RemainsPage.routeName,
          child: (context, args) => const RemainsPage(),
        ),
      ];

  // @override
  // List<Bind<Object>> get binds => [
  //       Bind<AppNavigationBloc>(
  //         (i) => AppNavigationBloc(),
  //         onDispose: (value) => value.close(),
  //       ),
  //     ];
}

class RemainsPage extends StatefulWidget {
  static const String routeName = "/remains-page";
  const RemainsPage({super.key});

  @override
  State<RemainsPage> createState() => _RemainsPageState();
}

class _RemainsPageState extends State<RemainsPage> {
  late TabController tabController;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorName.background,
          body: Column(
            children: [
              RemainsPageWidgets.appBar(
                title: "",
                ontap: (key) {},
                context: context,
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: ColorName.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AppWidgets.textLocale(
                                  localeKey: "Osiyo Market",
                                  fontSize: 24.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  isRichText: true),
                            ).paddingOnly(top: 50.w),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppWidgets.textLocale(
                                    localeKey: "Супермаркет",
                                    fontSize: 12.sp,
                                    color: ColorName.gray2,
                                    fontWeight: FontWeight.w400,
                                    isRichText: true),
                                AppWidgets.textLocale(
                                    localeKey: "Визиты:  Пн, Ср, Сб",
                                    fontSize: 12.sp,
                                    color: ColorName.gray2,
                                    fontWeight: FontWeight.w400,
                                    isRichText: true),
                              ],
                            ).paddingOnly(top: 12.w),
                            Row(
                              children: [
                                AppWidgets.textLocale(
                                    localeKey: "${LocaleKeys.territory.tr()} : ",
                                    fontSize: 12.sp,
                                    color: ColorName.gray2,
                                    fontWeight: FontWeight.w400,
                                    isRichText: true),
                                AppWidgets.textLocale(
                                    localeKey: "Юнусабадский район",
                                    fontSize: 12.sp,
                                    color: ColorName.black,
                                    fontWeight: FontWeight.w600,
                                    isRichText: true),
                              ],
                            ).paddingOnly(top: 12.w, bottom: 18.w),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 162.w,
                          height: 75.h,
                          decoration: BoxDecoration(
                            color: ColorName.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppWidgets.textLocale(
                                localeKey: "0 UZS",
                                color: ColorName.green,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              AppWidgets.textLocale(
                                localeKey: "Задолженности",
                                color: ColorName.gray2,
                                fontSize: 12,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 162.w,
                          height: 75.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorName.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppWidgets.textLocale(
                                    localeKey: "60%",
                                    color: ColorName.button,
                                    fontSize: 14,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  AppWidgets.textLocale(
                                    localeKey: "Прогноз",
                                    color: ColorName.gray2,
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                              const VerticalDivider(
                                color: ColorName.background,
                                width: 10,
                                thickness: 1,
                                indent: 10,
                                endIndent: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppWidgets.textLocale(
                                    localeKey: "60%",
                                    color: ColorName.button,
                                    fontSize: 14,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  AppWidgets.textLocale(
                                    localeKey: "Факт",
                                    color: ColorName.gray2,
                                    fontSize: 12,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ).paddingSymmetric(vertical: 12, horizontal: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: ColorName.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              topLeft: Radius.circular(8),
                            ),
                          ),
                          child: Column(
                            children: [
                              TabBar(
                                tabs: [
                                  Tab(
                                    child: AppWidgets.textLocale(
                                        localeKey: "Заказы",
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        color: ColorName.button,
                                        isRichText: true),
                                  ),
                                  Tab(
                                    child: AppWidgets.textLocale(
                                        localeKey: LocaleKeys.photo_report,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        color: ColorName.button,
                                        isRichText: true),
                                  ),
                                  Tab(
                                    child: AppWidgets.textLocale(
                                        localeKey: LocaleKeys.remains,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14.sp,
                                        color: ColorName.button,
                                        isRichText: true),
                                  ),
                                ],
                                padding: const EdgeInsets.only(right: 50),
                                indicatorWeight: 3,
                                indicatorPadding:
                                    const EdgeInsets.symmetric(horizontal: 7),
                                indicatorColor: ColorName.button,
                              ).paddingOnly(left: 20.w),
                              const SizedBox(
                                height: 800,
                                child: TabBarView(
                                  children: [
                                    TabbarOrderPage(),
                                    PhotoReportPage(),
                                    RemainsTabbarPage(),
                                  ],
                                ),
                              )
                            ],
                          ).paddingOnly(bottom: 70),
                        ),
                      ),
                    ),
                    Container(
                      height: 83.h,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: ColorName.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 25.0,
                          ),
                        ],
                      ),
                      child: AppButton(
                        onPressed: () {},
                        text: "Добавить заказ",
                        width: 338.w,
                        textColor: ColorName.white,
                        height: 47,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton:
              const FloatingShowDialog().paddingOnly(bottom: 160.w),
        ),
      ),
    );
  }
}
