import 'package:agent/core/extensions/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.gen.dart';
import '../../../widgets/app_widgets.dart';

class OrderIdCards {
  static Widget OrdersIdRowWidget(String text_1, String text_2,
      [Color color = ColorName.black]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppWidgets.textLocale(
            localeKey: text_1,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorName.gray2,
            isRichText: true),
        AppWidgets.textLocale(
            localeKey: text_2,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: color,
            isRichText: true),
      ],
    );
  }

  static Widget OrdersIdStatusRowWidget(
    String text_1,
    String text_2,
    Color colorContainer,
    Color statusColor,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppWidgets.textLocale(
            localeKey: text_1,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorName.gray2,
            isRichText: true),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: colorContainer),
          child: Center(
            child: AppWidgets.textLocale(
                localeKey: text_2,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: statusColor,
                isRichText: true).paddingSymmetric(horizontal: 10.w,vertical: 4.w),
          ),
        ),
      ],
    );
  }
}
