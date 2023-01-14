import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/order_page/bloc/order_page_cubit.dart';
import 'package:agent/ui/pages/order_page/order_page_widget/market_image_function_widget.dart';
import 'package:agent/ui/pages/order_page/order_page_widget/order_appbar_icon_widget.dart';
import 'package:agent/ui/pages/order_page/pages/photo_report_page.dart';
import 'package:agent/ui/pages/order_page/pages/tabbar_order_page.dart';
import 'package:agent/ui/pages/remain_page/pages/remains_tabbar_page.dart';
import 'package:agent/ui/pages/remain_page/widgets/floating_show_widget.dart';

import 'package:agent/ui/pages/return_from_shelf/widget/about_return_widget.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_page_widget/bottom_button_widget.dart';
import 'order_page_widget/order_tabbar_widget.dart';

class OrderPageModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<OrderPageCubit>(
          (i) => OrderPageCubit(),
          onDispose: (v) => v.close(),
        ),
      ];

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

  static int tabChange = 0;

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  late TabController _controller;
  late ScrollController scrolController;

  dynamic appTitle = marketImage();

  @override
  void initState() {
    _controller = TabController(length: 6, vsync: this);
    _controller.addListener(_handleTabSelection);

    scrolController = ScrollController();
    scrolController.addListener(scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
    return DefaultTabController(
      length: 6,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SafeArea(
            child: BlocBuilder<OrderPageCubit, OrderPageState>(
              bloc: Modular.get<OrderPageCubit>(),
              builder: (context, state) {
                return buildScaffold(context);
              },
            ),
          ),
          BottomButtonWidget(
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget buildScaffold(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                height: 113.h,
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
                        AppBarIcon.menuButton()
                      ],
                    )
                  ],
                ).paddingOnly(
                  left: 20.w,
                  right: 20.w,
                  bottom: 20.w,
                ),
              ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        "${LocaleKeys.territory.tr()} : ",
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
                                    localeKey: "${LocaleKeys.debts.tr()} : ",
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
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            topLeft: Radius.circular(8),
                          ),
                        ),
                        child: Column(
                          children: [
                            OrderTabbarWidget(
                                _controller,
                                LocaleKeys.orders.tr(),
                                LocaleKeys.photo_report.tr(),
                                LocaleKeys.return_.tr(),
                                LocaleKeys.return_of_containers,
                                LocaleKeys.exchange.tr(),
                                LocaleKeys.remains.tr(), (int i) {
                              if (i == 0) {
                              } else if (i == 1) {
                              } else {}
                            }),
                            Container(
                              child: [
                                const TabbarOrderPage(),
                                const PhotoReportPage(),
                                const AboutReturnWidget(),
                                Container(),
                                Container(),
                                   RemainsTabbarPage(),
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
          appTitle
        ],
      ),
      floatingActionButton:
           FloatingShowDialog().paddingOnly(bottom: 160.w),
    );
  }
}
