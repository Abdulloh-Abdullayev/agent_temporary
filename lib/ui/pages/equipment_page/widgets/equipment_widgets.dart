import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EquipmentWidgets {
  static Widget appBar(
      {required String title,
      required BuildContext context,
      required Function() ontap}) {
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 28.h,
          width: 28.w,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.10),
            borderRadius: BorderRadius.circular(4),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Assets.images.icons.left.svg(),
            ),
          ),
        ),
        const SizedBox(height: 18),
        AppWidgets.textLocale(
          color: ColorName.white,
          localeKey: title,
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
        ),
      ],
    );
    return Container(
      height: 139.h,
      width: 1.sw,
      padding: const EdgeInsets.only(top: 19, left: 20, right: 20),
      decoration: const BoxDecoration(
        color: ColorName.primaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
      ),
      child: SingleChildScrollView(
        child: column,
      ),
    );
  }

  static Widget items({BuildContext? context, Function(String key)? ontap}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 12,
            left: 20,
            right: 20,
          ),
          child: Container(
            height: 91.h,
            width: 335.sw,
            decoration: BoxDecoration(
              color: ColorName.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(12),
                  height: 67.h,
                  width: 72.w,
                  child: Image.asset('assets/images/person.png'),
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppWidgets.textLocale(
                          localeKey: "Artel холодильник",
                          fontSize: 14,
                        ),
                        textBuilder(
                          "Тип:",
                          " Холодильник",
                          LocaleKeys.draft.tr(),
                        ),
                        textBuilder(
                          LocaleKeys.attachment_date.tr(),
                          "",
                          "12.10.2022",
                          color: ColorName.black,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  static Widget textBuilder(
    String text1,
    String text2,
    String text3, {
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
          AppWidgets.textLocale(
            localeKey: text1,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: ColorName.gray2,
          ),
          AppWidgets.textLocale(
            localeKey: text2,
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: ColorName.gray2,
          ),
          AppWidgets.text(
            text: text3,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: color ?? ColorName.red,
          ).marginOnly(
            left: 4,
          ),
        ],
      );

  static Widget floatingActionButtonWidget(context) {
    return SizedBox(
      height: 42.w,
      width: 42.w,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: ColorName.green2,
          child: Assets.images.icons.plus.svg(),
        ),
      ),
    );
  }
}
