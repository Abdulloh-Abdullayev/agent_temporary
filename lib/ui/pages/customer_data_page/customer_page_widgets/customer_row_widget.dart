import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget rowWidget(String text_1, String text_2,
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
