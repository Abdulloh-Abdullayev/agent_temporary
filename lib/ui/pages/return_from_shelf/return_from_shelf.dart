import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/return_from_shelf/widget/about_return_widget.dart';
import 'package:agent/ui/pages/return_from_shelf/widget/app_bar_icon_return.dart';
import 'package:agent/ui/pages/return_from_shelf/widget/debt_widget.dart';
import 'package:agent/ui/pages/return_from_shelf/widget/percent_widget.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget/floating_dialog_return_widget.dart';
import 'widget/market_image_return_widget.dart';
import 'widget/order_tabbar_page.dart';
import 'widget/photo_info_page.dart';

class ReturnFromShelfModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          ReturnFromShelf.routeName,
          child: (context, args) => const ReturnFromShelf(),
        )
      ];
}

class ReturnFromShelf extends StatefulWidget {
  const ReturnFromShelf({Key? key}) : super(key: key);
  static const String routeName = "/returnFromShelf";

  @override
  State<ReturnFromShelf> createState() => _ReturnFromShelfState();
}

class _ReturnFromShelfState extends State<ReturnFromShelf> {
  late TabController tabController;


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Stack(
        children: [
          Scaffold(
            body:
                SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                            color: ColorName.primaryColor),
                        height: 133.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppBarIconReturn.backButtonShelf(() {}),
                            AppBarIconReturn.menuButtonShelf(),
                          ],
                        ).paddingSymmetric(horizontal: 20.w),
                      ),
                      SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
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
                                  ).paddingOnly(top: 12.w, bottom: 18.w),
                                ],
                              ).paddingSymmetric(horizontal: 20),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DebtWidget(
                                  money: 0,
                                  title: 'Задолженности',
                                  width: 163.w,
                                ),
                                PercentWidget(
                                  width: 163.w,
                                  forecast: 60,
                                  fact: 60,
                                ),
                              ],
                            ).paddingSymmetric(
                              horizontal: 20.w,
                              vertical: 12.w,
                            ),
                            Container(
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
                                            localeKey: "Фото отчёт",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                            color: ColorName.button,
                                            isRichText: true),
                                      ),
                                      Tab(
                                        child: AppWidgets.textLocale(
                                            localeKey: "Возврат",
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14.sp,
                                            color: ColorName.button,
                                            isRichText: true),
                                      )
                                    ],

                                    padding: EdgeInsets.only(
                                        right: MediaQuery.of(context).size.width *
                                            0.32
                                    ),
                                    unselectedLabelColor: ColorName.gray3,
                                    indicatorWeight: 3,
                                    indicatorPadding:
                                        const EdgeInsets.symmetric(horizontal: 7),
                                    indicatorColor: ColorName.button,
                                  ).paddingOnly(left: 10.w),
                                  SingleChildScrollView(
                                    physics: NeverScrollableScrollPhysics(),
                                    child: SizedBox(
                                      height: 400.w,
                                      child:  const TabBarView(
                                        children: [
                                          OrderTabBarPage(),
                                          PhotoInfoPage(),
                                          AboutReturnWidget()
                                        ],
                                      ).paddingOnly(bottom: 135.w),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

            floatingActionButton:
                FloatingDialogReturn().paddingOnly(bottom: 160.w),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: ColorName.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.08),
                    blurRadius: 10,
                  ),
                ],
              ),
              height: 80.w,
              width: 1.sw,
              child: AppWidgets.appButton(
                title: "Добавить заказ", onTap: () {  },

              ).paddingSymmetric(
                horizontal: 20.w,
                vertical: 18.w,
              ),
            ),
          ),
          Positioned(
              top: 80.w,
              left: 0,
              right: 0,
              child:
              const MarketImageReturn(image: "assets/images/market.png")),

        ],
      ),
    );
  }
}
