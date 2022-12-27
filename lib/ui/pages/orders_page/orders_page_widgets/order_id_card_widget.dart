import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.gen.dart';

Widget order_id_card(
    {double? height,
    double? width,
    required String name,
    required String volume,
    required String volumeNumber,
    required String count,
    required String countNumber,
    required String summa,
    required String summaNumber,
    required VoidCallback card_onTap,
    required BuildContext context}) {
  return InkWell(
    onTap: card_onTap,
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorName.gray),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: AppWidgets.textLocale(
                  localeKey: name,
                  fontWeight: FontWeight.w600,
                  color: ColorName.black,
                  fontSize: 12.sp),
            ),
            SizedBox(
              height: 8.w,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        AppWidgets.textLocale(
                            localeKey: "${volume}: ",
                            fontWeight: FontWeight.w400,
                            color: ColorName.gray2,
                            fontSize: 12.sp),
                        AppWidgets.textLocale(
                            localeKey: volumeNumber,
                            fontWeight: FontWeight.w400,
                            color: ColorName.black,
                            fontSize: 12.sp),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Row(
                      children: [
                        AppWidgets.textLocale(
                            localeKey: "${count}: ",
                            fontWeight: FontWeight.w400,
                            color: ColorName.gray2,
                            fontSize: 12.sp),
                        AppWidgets.textLocale(
                            localeKey: countNumber,
                            fontWeight: FontWeight.w400,
                            color: ColorName.black,
                            fontSize: 12.sp),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    AppWidgets.textLocale(
                        localeKey: "${summa}: ",
                        fontWeight: FontWeight.w400,
                        color: ColorName.gray2,
                        fontSize: 12.sp),
                    AppWidgets.textLocale(
                        localeKey: summaNumber,
                        fontWeight: FontWeight.w400,
                        color: ColorName.button,
                        fontSize: 12.sp),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
