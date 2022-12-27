import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/history_orders/widgets/order_from_widget.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class HistoryOrdersModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          HistoryOrdersPage.routeName,
          child: (context, args) => HistoryOrdersPage(),
        ),
      ];
}

class HistoryOrdersPage extends StatefulWidget {
  static String routeName = "/history-orders";

  HistoryOrdersPage({Key? key}) : super(key: key);

  @override
  State<HistoryOrdersPage> createState() => _HistoryOrdersPageState();
}

class _HistoryOrdersPageState extends State<HistoryOrdersPage>
    with TickerProviderStateMixin {
  PageController pageController = PageController();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
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
        backgroundColor: ColorName.bgColor,
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorName.primaryColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(12.r),
                ),
              ),
              width: 1.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppWidgets.backButton(() {
                        Modular.to.pop();
                      }),
                      InkWell(
                        onTap: () {
                          // Modular.to.pushNamed(OrderFromWidget.routeName);

                          showModalBottomSheet(
                            enableDrag: false,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return PurchaseHistorySheet(
                                text: 'Фильтр',
                                height: 900,
                                firstDate: '',
                                secondDate: '',
                                firstMoneyStatus: '',
                                secondMoneyStatus: '',
                                // dropdownText: [],
                                save: () {
                                  Modular.to
                                      .pushNamed(OrderFromWidget.routeName);
                                }, dropdownText: [],
                              );
                            },
                          );
                        },
                        child: Container(
                          height: 28.w,
                          width: 28.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: const Color.fromRGBO(255, 255, 255, 0.1),
                          ),
                          child: Center(
                            child: Assets.images.icons.filter.svg(
                              width: 16.w,
                              height: 19.w,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ).paddingSymmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  AppWidgets.textLocale(
                    localeKey: "История заказов",
                    fontSize: 24.sp,
                    color: ColorName.white,
                    fontWeight: FontWeight.w600,
                  ).paddingOnly(
                    bottom: 12.w,
                    left: 20,
                  ),
                  AppTabBar(
                    tabController: tabController,
                    isScrollable: true,
                    tabTitle: const ["Заказы", "Топ"],
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
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  buildOrdersWidget(),
                  buildTopWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOrdersWidget() {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: ((context, index) {
        return Container(
          width: 1.sw,
          decoration: BoxDecoration(
            color: ColorName.white,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      AppWidgets.textLocale(
                        localeKey: "Заказ от",
                        color: ColorName.gray2,
                        fontSize: 12.sp,
                      ).paddingOnly(right: 2.w),
                      AppWidgets.textLocale(
                        localeKey: "12.08.2022",
                        fontSize: 12.sp,
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: ColorName.green.withOpacity(0.18),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: AppWidgets.textLocale(
                      localeKey: "Доставлен",
                      color: ColorName.green,
                      fontSize: 12.sp,
                    ).paddingSymmetric(
                      vertical: 4.w,
                      horizontal: 10.w,
                    ),
                  )
                ],
              ).paddingOnly(bottom: 15.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      AppWidgets.textLocale(
                        localeKey: "Сумма",
                        color: ColorName.gray2,
                        fontSize: 12.sp,
                      ).paddingOnly(right: 2.w),
                      AppWidgets.textLocale(
                        localeKey: "150 000 000",
                        color: ColorName.buttonColor,
                        fontSize: 12.sp,
                      ),
                    ],
                  ),
                  AppWidgets.textLocale(
                    localeKey: "Начисления",
                    color: ColorName.gray2,
                    fontSize: 12.sp,
                  ),
                ],
              ),
            ],
          ).paddingSymmetric(
            horizontal: 12.w,
            vertical: 18.w,
          ),
        ).paddingOnly(
          top: 15.w,
          left: 20.w,
          right: 20.w,
        );
      }),
    );
  }

  Widget buildTopWidget() {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.textLocale(
                    localeKey: "Coca cola 1.5",
                    fontSize: 12.sp,
                  ),
                  AppWidgets.textLocale(
                    localeKey: "10.0",
                    fontSize: 12.sp,
                  ),
                ],
              ).paddingSymmetric(vertical: 10.w),
              const Divider()
            ],
          );
        }),
      ).paddingSymmetric(
        horizontal: 20.w,
        vertical: 10,
      ),
    ).paddingOnly(top: 20.w);
  }
}
