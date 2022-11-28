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
import 'package:uikit/uikit.dart';

import '../main_page/widgets/tabbar_widget.dart';
import 'order_page_widget/order_tabbar_widget.dart';

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
  static const String routeName = "/orderPage";


  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
                        AppBarIcon.backButton(() {}),
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

                  TabBarWidget(
                    _tabController,
                    "Заказы",
                    "Другие",
                        (int i) {},
                  ).paddingSymmetric(horizontal: 20.w, vertical: 15.w),
                  Container(
                    child: [

                    ][_tabController.index],
                  )


                  // Container(
                  //   decoration: const BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.only(
                  //       topRight: Radius.circular(8),
                  //       topLeft: Radius.circular(8),
                  //     ),
                  //   ),
                  //  child: Column(
                  //    children: [
                  //      TabBar(
                  //        tabs: [
                  //          Tab(
                  //            child: AppWidgets.textLocale(
                  //                localeKey: "Заказы",
                  //                fontWeight: FontWeight.w600,
                  //                fontSize: 14.sp,
                  //                color: ColorName.button,
                  //                isRichText: true),
                  //          ),
                  //          Tab(
                  //            child: AppWidgets.textLocale(
                  //                localeKey: "Фото отчёт",
                  //                fontWeight: FontWeight.w600,
                  //                fontSize: 14.sp,
                  //                color: ColorName.button,
                  //                isRichText: true),
                  //          )
                  //        ],
                  //        padding: const EdgeInsets.only(right: 166),
                  //        indicatorWeight: 3,
                  //        indicatorPadding:
                  //        const EdgeInsets.symmetric(horizontal: 7),
                  //        indicatorColor: ColorName.button,
                  //      ).paddingOnly(left: 20.w),
                  //      SizedBox(
                  //        height: MediaQuery.of(context).size.height,
                  //        child: const TabBarView(
                  //          children: [
                  //            TabbarOrderPage(),
                  //            PhotoReportPage(),
                  //          ],
                  //        ),
                  //      )
                  //    ],
                  //  ),
                  // ).paddingOnly(bottom: 20),
                ],
              ),
                Positioned(
                 top: 70.w,
                 right: 0,
                 left: 0,
                 child: MarketImage(image: "assets/images/market.png")
               ),
            ],
          ),
        ),
        floatingActionButton:
            const FloatingDialog().paddingOnly(bottom: 160.w),
      ),
    );
  }

}
