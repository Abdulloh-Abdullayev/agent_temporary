import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';
import 'package:uikit/uikit.dart';

class SalaryInfoWidget extends StatelessWidget {
  const SalaryInfoWidget({
    required this.width,
    required this.titleFirst,
    required this.titleSecond,
    this.isPercent = false,
    Key? key,
  }) : super(key: key);
  final double width;
  final String titleFirst;
  final String titleSecond;
  final bool isPercent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        vertical: 17.w,
        horizontal: 10.w,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorName.gray,
            width: 1.w,
          ),),
      child: Column(
        children: [
          Text(
            !isPercent
                ? "${Widgets().num(titleFirst)} sum"
                : "${(titleFirst)} %",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorName.primaryColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
          ).paddingOnly(bottom: 5.w),
          AppWidgets.textLocale(
            localeKey: titleSecond,
            color: ColorName.gray2,
            fontSize: 11.sp,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
