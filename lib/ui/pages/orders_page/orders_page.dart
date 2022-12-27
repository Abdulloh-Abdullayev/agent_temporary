import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/ui/pages/orders_page/bloc/orders_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import '../../../core/utils/colors.gen.dart';
import '../../widgets/app_widgets.dart';
import '../order_page/order_page_widget/order_appbar_icon_widget.dart';
import 'orders_page_widgets/orders_tabbar_first_item.dart';

class OrdersPageModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<OrdersPageCubit>(
          (i) => OrdersPageCubit(),
          onDispose: (v) => v.close(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          OrdersPage.routeName,
          child: (context, args) => const OrdersPage(),
        ),
      ];
}

class OrdersPage extends StatefulWidget {
  const OrdersPage({Key? key}) : super(key: key);
  static const String routeName = "/OrdersPage";

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> with TickerProviderStateMixin {
  PageController pageController = PageController();
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
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                color: ColorName.primaryColor),
            height: 149.h,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppBarIcon.backButton(() {
                    Modular.to.pop();
                  }).paddingOnly(
                    left: 20.w,
                    right: 20.w,
                    top: 19.w,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppWidgets.textLocale(
                          localeKey: "Заказы",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorName.white,
                          isRichText: true)
                      .paddingOnly(top: 18.w, left: 20),
                ),
                AppTabBar(
                  // labelStyle: TextStyle(fontSize: 16.w),
                  tabController: tabController,
                  tabTitle: [
                    "Все заказы",
                    "Синхронированные",
                    "Не Синхронированные",
                  ],
                  onTap: (i) {
                    pageController.animateToPage(
                      i,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  },
                ),
              ],
            ),
          ).paddingOnly(bottom: 18.w),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                TabbarFirstItem(),
                Container(
                  color: Colors.deepPurple,
                  child: Text("Omborxona Zaxirasi"),
                ),
                Container(
                  color: Colors.yellow,
                  child: Text("Omborxona Zaxirasi"),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
