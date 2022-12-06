import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class PercentWidget extends StatelessWidget {
  const PercentWidget({
    Key? key,
    required this.width,
    required this.forecast,
    required this.fact,
  }) : super(key: key);
  final double width;
  final int forecast;
  final int fact;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(
                  "${Widgets().num(forecast.toString())} %",
                  style: TextStyle(
                    color: ColorName.buttonColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Прогноз",
                  style: TextStyle(
                    color: ColorName.gray2,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 40.w,
            width: 1,
            color: ColorName.bgColor,
          ).paddingOnly(
            right: 5.w,
            left: 10.w,
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "${Widgets().num(fact.toString())} %",
                  style: TextStyle(
                    color: ColorName.buttonColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Факт",
                  style: TextStyle(
                    color: ColorName.gray2,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
