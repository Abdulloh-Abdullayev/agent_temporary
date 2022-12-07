import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/order_page/pages/photo_report_page.dart';
import 'package:agent/ui/pages/order_page/pages/tabbar_order_page.dart';
import 'package:agent/ui/pages/remains_page/pages/remains_tabbar_page.dart';
import 'package:agent/ui/pages/remains_page/widgets/floating_show_widget.dart';
import 'package:agent/ui/pages/remains_page/widgets/image_market.dart';
import 'package:agent/ui/pages/remains_page/widgets/remains_page_tabbar_widget.dart';
import 'package:agent/ui/pages/remains_page/widgets/remains_page_widgets.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../order_page/order_page_widget/bottom_button_widget.dart';

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

class _RemainsPageState extends State<RemainsPage>
    with TickerProviderStateMixin {
  late TabController _controller;
  late ScrollController scrolController;

  dynamic appTitle = marketImage();
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(_handleTabSelection);

    scrolController = ScrollController();
    scrolController.addListener(scrollListener);
    super.initState();
  }

  void _handleTabSelection() {
    if (_controller.indexIsChanging) {
      setState(() {});
    }
  }

  scrollListener() {
    if (scrolController.offset >= scrolController.position.minScrollExtent &&
        !scrolController.position.outOfRange) {
      setState(() {
        appTitle = SizedBox();
      });
    }
    if (scrolController.offset <= scrolController.position.minScrollExtent &&
        !scrolController.position.outOfRange) {
      setState(() {
        appTitle = marketImage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SafeArea(
            child: Scaffold(
              body: Stack(
                children: [
                  Column(
                    children: [
                      RemainsPageWidgets.appBar(context: context,ontap: (){}, title: "Ostatki"),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: scrolController,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 18.w),
                                decoration: const BoxDecoration(
                                  color: ColorName.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppWidgets.textLocale(
                                            localeKey: "Supermarket",
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
                                            localeKey: "Teritoriya  : ",
                                            fontSize: 12.sp,
                                            color: ColorName.gray2,
                                            fontWeight: FontWeight.w400,
                                            isRichText: true),
                                        AppWidgets.textLocale(
                                            localeKey: "Yunusobod rayoni",
                                            fontSize: 12.sp,
                                            color: ColorName.black,
                                            fontWeight: FontWeight.w600,
                                            isRichText: true),
                                      ],
                                    ).paddingOnly(top: 12.w),
                                    Row(
                                      children: [
                                        AppWidgets.textLocale(
                                            localeKey: "Задолженности : ",
                                            fontSize: 12.sp,
                                            color: ColorName.gray2,
                                            fontWeight: FontWeight.w400,
                                            isRichText: true),
                                        AppWidgets.textLocale(
                                            localeKey: "0 UZS",
                                            fontSize: 12.sp,
                                            color: ColorName.green,
                                            fontWeight: FontWeight.w700,
                                            isRichText: true),
                                      ],
                                    ).paddingOnly(top: 12.w, bottom: 18.w),
                                  ],
                                ).paddingSymmetric(horizontal: 20),
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
                        ).paddingSymmetric(vertical: 12.w, horizontal: 20.w),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    topLeft: Radius.circular(8),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    RemainsTabbarWidget(_controller, "Заказы",
                                        "Фото отчёт", "Остатки", (int i) {
                                      if (i == 0) {
                                      } else if (i == 1) {
                                      } else {}
                                    }).paddingOnly(
                                      right: MediaQuery.of(context).size.width *
                                          0.106,
                                    ),
                                    Container(
                                      child: [
                                        const TabbarOrderPage(),
                                        const PhotoReportPage(),
                                        const RemainsTabbarPage(),
                                        Container()
                                      ][_controller.index],
                                    ),
                                  ],
                                ),
                              ).paddingOnly(bottom: 20),
                            ],
                          ).paddingOnly(bottom: 60.w),
                        ),
                      ),
                    ],
                  ),
                  appTitle,
                ],
              ),
              floatingActionButton:
                  const FloatingShowDialog().paddingOnly(bottom: 160.w),
            ),
          ),
          BottomButtonWidget(
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
