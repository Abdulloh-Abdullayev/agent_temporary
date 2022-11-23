import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/order_page/order_page_widget/floating_dialog_widget.dart';
import 'package:agent/ui/pages/order_page/order_page_widget/market_image_widget.dart';
import 'package:agent/ui/pages/order_page/order_page_widget/order_appbar_icon_widget.dart';
import 'package:agent/ui/pages/order_page/pages/photo_report_page.dart';
import 'package:agent/ui/pages/order_page/pages/tabbar_order_page.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderPageModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          OrderPage.routeName,
          child: (context, args) => const OrderPage(),
        ),
      ];
}

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);
  static const String routeName = "/OrderPage";

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
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
                            AppBarIcon.backButton(
                              () {
                                Modular.to.pop();
                              },
                            ),
                            Row(
                              children: [
                                AppBarIcon.telephoneButton(() {}),
                                const SizedBox(
                                  width: 12,
                                ),
                                AppBarIcon.menuButtpon()
                              ],
                            )
                          ],
                        ).paddingSymmetric(horizontal: 20.w),
                      ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      localeKey: "Обмен товара",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.sp,
                                      color: ColorName.button,
                                      isRichText: true),
                                ),
                              ],
                              controller: tabController,
                              indicator: BoxDecoration(),
                              indicatorWeight: 3,
                              indicatorPadding:
                                  const EdgeInsets.symmetric(horizontal: 7),
                              indicatorColor: ColorName.button,
                            ).paddingOnly(left: 20.w),
                            SizedBox(
                              height: 800,
                              child: TabBarView(
                                controller: tabController,
                                children: [
                                  const TabbarOrderPage(),
                                  const PhotoReportPage(),
                                  Container(),
                                ],
                              ),
                            )
                          ],
                        ).paddingOnly(bottom: 70),
                      ),
                    ],
                  ),
                  const MarketImage(image: "assets/images/market.png")
                      .paddingOnly(top: 70.w, left: 140.w)
                ],
              ),
            ),
            floatingActionButton: FloatingDialog().paddingOnly(bottom: 160.w),
          ),
          // const BottomButtonWidget(),
        ],
      ),
    );
  }
}
