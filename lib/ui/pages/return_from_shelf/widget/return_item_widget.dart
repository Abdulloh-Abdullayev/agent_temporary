import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/return_about_page/return_about_page.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_rich_text/super_rich_text.dart';
import 'package:uikit/uikit.dart';

class ReturnItemWidget extends StatelessWidget {
  const ReturnItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed(ReturnAboutPage.routeName);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 11.w),
        decoration: BoxDecoration(
          color: ColorName.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: ColorName.gray),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      AppWidgets.textLocale(
                        localeKey: "Возврат в",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ).paddingOnly(right: 8.w),
                      AppWidgets.textLocale(
                        localeKey: "17:18",
                        fontSize: 12.sp,
                      ).paddingOnly(right: 8.w),
                      AppWidgets.textLocale(
                        localeKey: LocaleKeys.completed,
                        fontSize: 12.sp,
                        color: ColorName.green,
                      ).paddingOnly(right: 8.w),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: ColorName.bgColor,
                    ),
                    height: 26.w,
                    width: 26.w,
                    child: PopupMenuTools(
                      onTap: (p0) {
                        if (p0 == 1) {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              content: CommitTextField(
                                text: LocaleKeys.adding_comments.tr(),
                              ),
                            ),
                          );
                        } else if (p0 == 2) {
                          showDialog(
                            context: context,
                            builder: (ctx) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: DateTimeDialog(
                                  title: LocaleKeys.add_shipping_date.tr(),
                                  closeTitle: LocaleKeys.close.tr(),
                                  addTitle: LocaleKeys.add.tr(),
                                  addTap: () {}),
                            ),
                          );
                        } else if (p0 == 3) {
                          showDialog(
                            context: context,
                            builder: (ctx) => Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: DateTimeDialog(
                                  title: LocaleKeys.add_consignment.tr(),
                                  closeTitle: LocaleKeys.close.tr(),
                                  addTitle: LocaleKeys.add.tr(),
                                  addTap: () {}),
                            ),
                          );
                        }
                      },
                      textName: [
                        LocaleKeys.edit.tr(),
                        LocaleKeys.comments_to_order.tr(),
                        LocaleKeys.shipping_date.tr(),
                        LocaleKeys.term_consignment.tr(),
                        LocaleKeys.pin_photo.tr(),
                        LocaleKeys.cancel.tr(),
                      ],
                      icons: [
                        Assets.images.icons.editeAlt
                            .svg(fit: BoxFit.cover, color: ColorName.button),
                        Assets.images.icons.chat
                            .svg(fit: BoxFit.cover, color: ColorName.gray2),
                        Assets.images.icons.calender
                            .svg(fit: BoxFit.cover, color: ColorName.gray2),
                        Assets.images.icons.clock
                            .svg(fit: BoxFit.cover, color: ColorName.gray2),
                        Assets.images.icons.fileUpload
                            .svg(fit: BoxFit.cover, color: ColorName.gray2),
                        const SizedBox.shrink(),
                      ],
                      textColor: const [
                        ColorName.button,
                        ColorName.black,
                        ColorName.black,
                        ColorName.black,
                        ColorName.black,
                        ColorName.red,
                      ],
                    ),
                  ).paddingOnly(
                    top: 10.w,
                    bottom: 5.w,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.textLocale(
                    localeKey: "${LocaleKeys.volume.tr()}  //15//",
                    color: ColorName.gray2,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    isRichText: true,
                    othersMarkers: [
                      MarkerText(
                        marker: "//",
                        style: const TextStyle(color: ColorName.black),
                      )
                    ],
                  ),
                  AppWidgets.textLocale(
                    localeKey: "${LocaleKeys.volume.tr()}  //15//",
                    color: ColorName.gray2,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    isRichText: true,
                    othersMarkers: [
                      MarkerText(
                        marker: "//",
                        style: const TextStyle(color: ColorName.black),
                      )
                    ],
                  ),
                  AppWidgets.textLocale(
                    localeKey: "${LocaleKeys.amount.tr()}  //150 000 000//",
                    color: ColorName.gray2,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    isRichText: true,
                    othersMarkers: [
                      MarkerText(
                        marker: "//",
                        style: const TextStyle(
                          color: ColorName.buttonColor,
                        ),
                      )
                    ],
                  ),
                ],
              ).paddingOnly(bottom: 8.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.textLocale(
                    localeKey:
                        "${LocaleKeys.cause.tr()}  //Товар не продается //",
                    color: ColorName.gray2,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    isRichText: true,
                    othersMarkers: [
                      MarkerText(
                        marker: "//",
                        style: const TextStyle(color: ColorName.black),
                      )
                    ],
                  ),
                ],
              ).paddingOnly(bottom: 8.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.textLocale(
                    localeKey:
                        "${LocaleKeys.shipping_date.tr()} //15.10.2022//",
                    color: ColorName.gray2,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    isRichText: true,
                    othersMarkers: [
                      MarkerText(
                        marker: "//",
                        style: const TextStyle(color: ColorName.black),
                      )
                    ],
                  ),
                ],
              ).paddingOnly(bottom: 10.w),
            ],
          ),
        ),
      ),
    );
  }
}
