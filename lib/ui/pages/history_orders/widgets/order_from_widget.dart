import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderFromModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          OrderFromWidget.routeName,
          child: (context, args) => const OrderFromWidget(),
        )
      ];
}

class OrderFromWidget extends StatelessWidget {
  const OrderFromWidget({Key? key}) : super(key: key);
  static String routeName = "/order-from";

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
                  AppWidgets.backButton(() {
                    Modular.to.pop();
                  }).paddingSymmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  AppWidgets.textLocale(
                    localeKey: "${LocaleKeys.order_from.tr()} 12.08.2022",
                    fontSize: 24.sp,
                    color: ColorName.white,
                    fontWeight: FontWeight.w600,
                  ).paddingOnly(
                    bottom: 25.w,
                    left: 20,
                  ),
                ],
              ),
            ),
            buildOrdersWidget(),
          ],
        ),
      ),
    );
  }

  Widget buildOrdersWidget() {
    return ListView(
      shrinkWrap: true,
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: 5,
          itemBuilder: ((context, index) {
            return Container(
              width: 1.sw,
              decoration: BoxDecoration(
                color: ColorName.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.textLocale(
                    localeKey: "Coca cola 1.5",
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                  ),
                  Row(
                    children: [
                      AppWidgets.textLocale(
                        localeKey: LocaleKeys.spot,
                        color: ColorName.gray2,
                        fontSize: 12.sp,
                      ).paddingOnly(right: 17.w),
                      AppWidgets.textLocale(
                        localeKey: LocaleKeys.no_bonus,
                        fontSize: 12.sp,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          AppWidgets.textLocale(
                            localeKey: "Обьем",
                            color: ColorName.gray2,
                            fontSize: 12.sp,
                          ).paddingOnly(right: 3.w),
                          AppWidgets.textLocale(
                            localeKey: "15",
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AppWidgets.textLocale(
                            localeKey: "Кол-во",
                            color: ColorName.gray2,
                            fontSize: 12.sp,
                          ).paddingOnly(right: 3.w),
                          AppWidgets.textLocale(
                            localeKey: "15",
                            fontSize: 12.sp,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          AppWidgets.textLocale(
                            localeKey: LocaleKeys.amount,
                            color: ColorName.gray2,
                            fontSize: 12.sp,
                          ).paddingOnly(right: 3.w),
                          AppWidgets.textLocale(
                            localeKey: "150 000 000",
                            fontSize: 12.sp,
                            color: ColorName.button,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ).paddingSymmetric(
                horizontal: 12.w,
                vertical: 18.w,
              ),
            ).paddingOnly(top: 15.w);
          }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppWidgets.textLocale(
              localeKey: LocaleKeys.total_volume.tr(),
              color: ColorName.gray2,
              fontSize: 12.sp,
            ).paddingOnly(right: 17.w),
            AppWidgets.textLocale(
              localeKey: "1365 о",
              fontSize: 12.sp,
            ),
          ],
        ).paddingOnly(top: 25.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppWidgets.textLocale(
              localeKey: LocaleKeys.total_qty,
              color: ColorName.gray2,
              fontSize: 12.sp,
            ).paddingOnly(right: 17.w),
            AppWidgets.textLocale(
              localeKey: "1258 шт",
              fontSize: 12.sp,
            ),
          ],
        ).paddingSymmetric(vertical: 15.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppWidgets.textLocale(
              localeKey: LocaleKeys.total_amount,
              color: ColorName.gray2,
              fontSize: 12.sp,
            ).paddingOnly(right: 17.w),
            AppWidgets.textLocale(
              localeKey: "150 000 000 UZS",
              fontSize: 12.sp,
              color: ColorName.button,
            ),
          ],
        ),
      ],
    ).paddingOnly(
      top: 15.w,
      left: 20.w,
      right: 20.w,
    );
  }
}
