import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class BookingWidgets {
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
              textStyle: firstStyle,
            ),
            AppWidgets.text(text: secondName, textStyle: secondStyle),
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
          {required String title, required Function(String key) ontap}) =>
      Container(
        height: 139.h,
        width: 1.sw,
        padding: const EdgeInsets.only(top: 19, left: 20, right: 20),
        decoration: const BoxDecoration(
          color: ColorName.primary,
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
                    onTap: () {},
                    child: Center(
                      child: Assets.icons.left.svg(height: 9.5),
                    ),
                  ),
                ),
                Container(
                  height: 28.w,
                  width: 28.w,
                  padding: EdgeInsets.only(bottom: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.10),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: PopupMenuTools(
                    textName: const [
                      "Редактрировать",
                      "Комментария к заказу",
                      "Дата отгрузки",
                      "Срок Консигнация",
                      "Закрепить фото",
                      'Удалить',
                    ],
                    icons: [
                      Assets.icons.edit.svg(),
                      Assets.icons.chat.svg(),
                      Assets.icons.calendar.svg(),
                      Assets.icons.clock.svg(),
                      Assets.icons.uploadingFile.svg(),
                      Assets.icons.trash.svg(),
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
