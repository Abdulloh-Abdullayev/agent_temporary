import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
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

class HistoryOrdersPage extends StatelessWidget {
  static String routeName = "/history-orders";

  const HistoryOrdersPage({Key? key}) : super(key: key);

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
                      AppWidgets.iconButton(
                        onPressed: () {},
                        icon: Assets.images.icons.filtrIcon,
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
                    tabTitle: const ["Заказы", "Топ"],
                    onTap: (i) {
                      Tab(child: buildOrdersWidget());
                      Tab(child: buildOrdersWidget());
                    },
                    tabs: [],
                  )
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
      itemCount: 8,
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
                    localeKey: "Доставлен",
                    color: ColorName.gray2,
                  ).paddingSymmetric(
                    vertical: 4.w,
                    horizontal: 10.w,
                  )
                ],
              ),
            ],
          ).paddingSymmetric(
            horizontal: 12.w,
            vertical: 18.w,
          ),
        );
      }),
    );
  }
}
