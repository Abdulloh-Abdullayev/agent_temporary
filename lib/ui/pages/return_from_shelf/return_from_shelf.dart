import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/return_from_shelf/widget/about_return_widget.dart';
import 'package:agent/ui/pages/return_from_shelf/widget/app_bar_icon_return.dart';
import 'package:agent/ui/pages/return_from_shelf/widget/debt_widget.dart';
import 'package:agent/ui/pages/return_from_shelf/widget/percent_widget.dart';
import 'package:agent/ui/pages/return_from_shelf/widget/return_from_shelf_tab_bar_widget.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/localization/locale_keys.g.dart';
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
  static int tabChange = 0;

  @override
  State<ReturnFromShelf> createState() => _ReturnFromShelfState();
}

class _ReturnFromShelfState extends State<ReturnFromShelf>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    if (_controller.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Stack(
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
                            AppBarIconReturn.backButtonShelf(() {}),
                            AppBarIconReturn.menuButtonShelf(),
                          ],
                        ).paddingSymmetric(horizontal: 20.w),
                      ),
                      Column(
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
                                        localeKey:
                                            "${LocaleKeys.visits.tr()}:  Пн, Ср, Сб",
                                        fontSize: 12.sp,
                                        color: ColorName.gray2,
                                        fontWeight: FontWeight.w400,
                                        isRichText: true),
                                  ],
                                ).paddingOnly(top: 12.w),
                                Row(
                                  children: [
                                    AppWidgets.textLocale(
                                        localeKey:
                                            "${LocaleKeys.territory.tr()}  : ",
                                        fontSize: 12.sp,
                                        color: ColorName.gray2,
                                        fontWeight: FontWeight.w400,
                                        isRichText: true),
                                    AppWidgets.textLocale(
                                      localeKey: "Yunusobod rayoni",
                                      fontSize: 12.sp,
                                      color: ColorName.black,
                                      fontWeight: FontWeight.w600,
                                      isRichText: true,
                                    ),
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
                                title: LocaleKeys.debts.tr(),
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
                                ReturnFromShelfTabBarWidget(
                                    _controller,
                                    LocaleKeys.orders.tr(),
                                    LocaleKeys.photo_report.tr(),
                                    LocaleKeys.return_.tr(), (int i) {
                                }).paddingOnly(
                                  right:
                                      MediaQuery.of(context).size.width * 0.16,
                                ),
                                Container(
                                  child: [
                                    OrderTabBarPage(),
                                    PhotoInfoPage(),
                                    AboutReturnWidget()
                                  ][_controller.index],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ).paddingOnly(bottom: 80.w),
                  Positioned(
                    top: 80.w,
                    left: 0,
                    right: 0,
                    child: const MarketImageReturn(
                      image: "assets/images/market.png",
                    ),
                  ),
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
                title: LocaleKeys.add_order.tr(),
                onTap: () {},
              ).paddingSymmetric(
                horizontal: 20.w,
                vertical: 18.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
