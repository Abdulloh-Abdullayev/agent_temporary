import 'dart:ui';

import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditExchangeWidgetModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          EditExchangeWidget.routeName,
          child: (context, args) => EditExchangeWidget(),
        ),
      ];
}

class EditExchangeWidget extends StatelessWidget {
  EditExchangeWidget({Key? key}) : super(key: key);

  static String routeName = "/edit-exchange";
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorName.bgColor,
        body: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: ColorName.white,
              child: Container(
                width: 1.sw,
                decoration: BoxDecoration(
                  color: ColorName.primaryColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(12.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppWidgets.backButton(
                          () {
                            Modular.to.pop();
                          },
                        ),
                        AppWidgets.iconButton(
                          onPressed: () {},
                          icon: Assets.images.icons.moreButton,
                        ),
                      ],
                    ),
                    AppWidgets.textLocale(
                      localeKey: "О Обмене",
                      color: ColorName.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                    ).paddingOnly(
                      top: 18.w,
                      bottom: 4.w,
                    ),
                  ],
                ).paddingAll(20.w),
              ),
            ),
            Container(
              width: 1.sw,
              decoration: BoxDecoration(
                color: ColorName.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(8.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppWidgets.textLocale(
                        localeKey: "Тип направления",
                        color: ColorName.gray2,
                      ),
                      AppWidgets.textLocale(
                        localeKey: "Торговое направления",
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppWidgets.textLocale(
                        localeKey: "Тип цены",
                        color: ColorName.gray2,
                      ),
                      AppWidgets.textLocale(
                        localeKey: "Перечисления",
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppWidgets.textLocale(
                        localeKey: "Обмен добавлен",
                        color: ColorName.gray2,
                      ),
                      AppWidgets.textLocale(
                        localeKey: "16 окт, 1:43",
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  const Divider(),
                  AppWidgets.textLocale(
                    localeKey: "Комментарии к возврату",
                    color: ColorName.gray2,
                  ).paddingSymmetric(vertical: 12.w),
                  AppWidgets.textLocale(
                    localeKey:
                        "Lorem Ipsum is simply dummy text of the printing and "
                        "typesetting industry. Lorem Ipsum has been the "
                        "industry's standard dummy text ever since the 1500s,",
                    isRichText: true,
                  ),
                ],
              ).paddingAll(20.w),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppWidgets.textLocale(
                  localeKey: "Обмененные товары",
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Assets.images.icons.smaller
                          .svg()
                          .paddingOnly(right: 25.w),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Assets.images.icons.bigger.svg(),
                    )
                  ],
                ),
              ],
            ).paddingAll(20.w),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 280.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: ColorName.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: ColorName.lightBlue,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(8.r),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppWidgets.textLocale(
                                localeKey: "Возврат",
                                fontWeight: FontWeight.w600,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppWidgets.textLocale(
                                      localeKey: "Дата",
                                      color: ColorName.gray2,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  Expanded(
                                    child: AppWidgets.textLocale(
                                      localeKey: "Кол-во",
                                      color: ColorName.gray2,
                                      fontSize: 12.sp,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: AppWidgets.textLocale(
                                        localeKey: "Сумма",
                                        color: ColorName.gray2,
                                        fontSize: 12.sp,
                                        textAlign: TextAlign.end),
                                  ),
                                ],
                              ),
                            ],
                          ).paddingAll(12.w),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: AppWidgets.textLocale(
                                      localeKey: "Coca cola 1.5",
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  Expanded(
                                    child: AppWidgets.textLocale(
                                      localeKey: "5",
                                      fontSize: 12.sp,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: AppWidgets.textLocale(
                                      localeKey: "500 000",
                                      fontSize: 12.sp,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 12.w),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Assets.images.icons.exchange.svg(),
                  ).paddingSymmetric(horizontal: 8.w),
                  Container(
                    width: 280.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: ColorName.white,
                    ),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: ColorName.lightBlue,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(8.r),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppWidgets.textLocale(
                                localeKey: "Возврат",
                                fontWeight: FontWeight.w600,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppWidgets.textLocale(
                                      localeKey: "Дата",
                                      color: ColorName.gray2,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  Expanded(
                                    child: AppWidgets.textLocale(
                                      localeKey: "Кол-во",
                                      color: ColorName.gray2,
                                      fontSize: 12.sp,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: AppWidgets.textLocale(
                                        localeKey: "Сумма",
                                        color: ColorName.gray2,
                                        fontSize: 12.sp,
                                        textAlign: TextAlign.end),
                                  ),
                                ],
                              ),
                            ],
                          ).paddingAll(12.w),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: AppWidgets.textLocale(
                                      localeKey: "Coca cola 1.5",
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  Expanded(
                                    child: AppWidgets.textLocale(
                                      localeKey: "5",
                                      fontSize: 12.sp,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: AppWidgets.textLocale(
                                      localeKey: "500 000",
                                      fontSize: 12.sp,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 12.w),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20.w),
            ),
          ],
        ),
      ),
    );
  }
}
