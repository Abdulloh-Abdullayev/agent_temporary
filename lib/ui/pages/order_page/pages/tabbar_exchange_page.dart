import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/exchange/widget/edit_exchange_widget.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import '../../../../core/utils/assets.gen.dart';

class TabBarExchangePage extends StatelessWidget {
  const TabBarExchangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: ColorName.gray),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.textLocale(
                    localeKey: LocaleKeys.total_volume,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: ColorName.gray2,
                  ),
                  AppWidgets.textLocale(
                    localeKey: "1365 о",
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: ColorName.black,
                  ),
                ],
              ).paddingSymmetric(vertical: 12.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.textLocale(
                    localeKey: LocaleKeys.total_qty,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: ColorName.gray2,
                  ),
                  AppWidgets.textLocale(
                    localeKey: "1365 sht",
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: ColorName.black,
                  ),
                ],
              ).paddingOnly(bottom: 12.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.textLocale(
                    localeKey: LocaleKeys.total_amount,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: ColorName.gray2,
                  ),
                  AppWidgets.textLocale(
                    localeKey: "150 000 000 UZS",
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: ColorName.button,
                  ),
                ],
              ).paddingOnly(bottom: 12.w),
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return Container(
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: ColorName.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: ColorName.gray),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 12,
                      bottom: 9,
                      left: 12,
                      right: 12,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AppWidgets.textLocale(
                                    localeKey: LocaleKeys.order_in,
                                    fontWeight: FontWeight.w600,
                                    color: ColorName.black,
                                    fontSize: 12),
                                AppWidgets.textLocale(
                                        localeKey: "17:08",
                                        fontWeight: FontWeight.w400,
                                        color: ColorName.black,
                                        fontSize: 12)
                                    .paddingSymmetric(horizontal: 8.w),
                                AppWidgets.textLocale(
                                    localeKey: LocaleKeys.completed,
                                    fontWeight: FontWeight.w400,
                                    color: ColorName.green,
                                    fontSize: 12),
                              ],
                            ),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: ColorName.bgColor,
                              ),
                              child: Center(
                                child: PopupMenuTools(
                                  onTap: (p0) {
                                    if (p0 == 0) {
                                      Modular.to.pushNamed(
                                          EditExchangeWidget.routeName);
                                    } else if (p0 == 1) {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: DateTimeDialog(
                                              title: LocaleKeys
                                                  .add_shipping_date
                                                  .tr(),
                                              closeTitle: LocaleKeys.close.tr(),
                                              addTitle: LocaleKeys.add.tr(),
                                              addTap: () {}),
                                        ),
                                      );
                                    } else if (p0 == 2) {}
                                  },
                                  textName: [
                                    LocaleKeys.edit.tr(),
                                    LocaleKeys.comments_to_order.tr(),
                                    LocaleKeys.delete.tr(),
                                  ],
                                  icons: [
                                    Assets.images.icons.editeAlt.svg(
                                      fit: BoxFit.cover,
                                      color: ColorName.button,
                                    ),
                                    Assets.images.icons.chat.svg(
                                      fit: BoxFit.cover,
                                      color: ColorName.gray2,
                                    ),
                                    Assets.images.icons.trashCan.svg(
                                      fit: BoxFit.cover,
                                      color: ColorName.red,
                                    ),
                                    const SizedBox.shrink(),
                                  ],
                                  textColor: const [
                                    ColorName.button,
                                    ColorName.black,
                                    ColorName.red,
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ).paddingOnly(bottom: 15.w),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                AppWidgets.textLocale(
                                  localeKey: LocaleKeys.amount,
                                  fontWeight: FontWeight.w400,
                                  color: ColorName.gray2,
                                  fontSize: 12,
                                ).paddingOnly(right: 8.w),
                                AppWidgets.textLocale(
                                  localeKey: "150 000 000",
                                  fontWeight: FontWeight.w400,
                                  color: ColorName.button,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                AppWidgets.textLocale(
                                        localeKey: LocaleKeys.cause,
                                        fontWeight: FontWeight.w400,
                                        color: ColorName.gray2,
                                        fontSize: 12)
                                    .paddingOnly(right: 8.w),
                                AppWidgets.textLocale(
                                  localeKey: "Товар не продается",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ).paddingSymmetric(horizontal: 20.w),
      ],
    );
  }
}
