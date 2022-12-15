import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class ReturnWidget {
  static Widget bookingItems({
    required String firstName,
    required String secondName,
    TextStyle firstStyle = const TextStyle(
      color: ColorName.gray2,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    TextStyle secondStyle = const TextStyle(
      color: ColorName.black,
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AppWidgets.text(
              text: firstName,
              textStyle: const TextStyle(
                color: ColorName.gray2,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            AppWidgets.text(
              text: secondName,
              textStyle: const TextStyle(
                color: ColorName.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 16),
          height: 1.h,
          width: 1.sw,
          color: ColorName.gray,
        ),
      ],
    );
  }

  static Widget appBar(
          {required String title,
          required BuildContext context,
          required Function(String key) ontap}) =>
      Container(
        height: 139.h,
        width: 1.sw,
        padding: const EdgeInsets.only(top: 19, left: 20, right: 20),
        decoration: const BoxDecoration(
          color: ColorName.primaryColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 28.h,
                  width: 28.h,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.10),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Modular.to.pop();
                    },
                    child: Center(
                      child: Assets.images.icons.backIcon.svg(height: 9.5),
                    ),
                  ),
                ),
                Container(
                  height: 28.w,
                  width: 28.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.10),
                    borderRadius: BorderRadius.circular(4),
                  ),
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
                      LocaleKeys.delete.tr()
                    ],
                    icons: [
                      Assets.images.icons.edit.svg(),
                      Assets.images.icons.chat.svg(),
                      Assets.images.icons.clock.svg(),
                      Assets.images.icons.remove.svg(),
                      SizedBox.shrink(),
                    ],
                    textColor: const [
                      ColorName.button,
                      ColorName.black,
                      ColorName.black,
                      ColorName.red,
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            AppWidgets.textLocale(
              color: ColorName.white,
              localeKey: title,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      );

  static Widget cocaColaItems() {
    return Container(
      height: 64.h,
      // margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppWidgets.text(
                  text: "Coca cola 1.5",
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: ColorName.black)
              .marginOnly(top: 14, left: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textBuilder("Обьем", "15"),
              textBuilder("Обьем", "15"),
              textBuilder(
                "Обьем",
                "100 000 00",
                color: ColorName.button,
              ),
            ],
          ).paddingOnly(top: 8, left: 12, right: 12),
        ],
      ),
    );
  }

  static Widget textBuilder(
    String text1,
    String text2, {
    Color? color,
    TextStyle? textStyle,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
  }) =>
      Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppWidgets.text(
            text: text1,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: ColorName.gray2,
          ),
          AppWidgets.text(
            text: text2,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color ?? ColorName.black,
          ).marginOnly(
            left: 4,
          ),
        ],
      );
}
