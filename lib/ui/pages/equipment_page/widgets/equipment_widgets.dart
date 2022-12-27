import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
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
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            height: 28.w,
            width: 28.w,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.10),
              borderRadius: BorderRadius.circular(4),
            ),
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
      height: 119.w,
      width: 1.sw,
      padding:  EdgeInsets.only(
        top: 19.w,
        left: 20.w,
        right: 20.w,
      ),
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
          padding:  EdgeInsets.only(
            top: 12.w,
            left: 20.w,
            right: 20.w,
          ),
          child: Container(
            height: 91.w,
            width: 335.sw,
            decoration: BoxDecoration(
              color: ColorName.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(12),
                  height: 67.w,
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
                          "Черновик",
                        ),
                        textBuilder(
                          "Дата прикрепления",
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
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: ColorName.gray2,
          ),
          AppWidgets.textLocale(
            localeKey: text2,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: ColorName.gray2,
          ),
          AppWidgets.text(
            text: text3,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: color ?? ColorName.red,
          ).marginOnly(
            left: 4.w,
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
