import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/salary_page/widget/salary_info.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:uikit/uikit.dart';

class WorkingDayWidget extends StatelessWidget {
  const WorkingDayWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.textLocale(
                localeKey: LocaleKeys.full_time,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: ColorName.gray2,
              ),
              AppWidgets.textLocale(
                localeKey: LocaleKeys.fact_day,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: ColorName.gray2,
              ),
            ],
          ).paddingOnly(bottom: 5.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.textLocale(
                localeKey: "30",
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: ColorName.black,
              ),
              AppWidgets.textLocale(
                localeKey: "16",
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: ColorName.black,
              ),
            ],
          ).paddingOnly(bottom: 12.w),
          LinearPercentIndicator(
            barRadius: Radius.circular(15),
            animation: true,
            padding: EdgeInsets.all(0),
            lineHeight: 9.h,
            animationDuration: 2000,
            percent: 24 / 30,
            progressColor: ColorName.buttonColor,
            backgroundColor: ColorName.background,
          ).paddingOnly(
            top: 10.w,
            bottom: 25.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SalaryInfoWidget(
                width: 142.w,
                titleFirst: '100000000',
                titleSecond: LocaleKeys.fixed_salary.tr(),
              ).paddingOnly(right: 10.w),
              SalaryInfoWidget(
                width: 142.w,
                titleFirst: '79',
                titleSecond: LocaleKeys.fixed_salary.tr(),
                isPercent: true,
              ),
            ],
          ).paddingOnly(
            bottom: 10.w,
          ),
          SalaryInfoWidget(
            width: 1.sw,
            titleFirst: '100000000',
            titleSecond: LocaleKeys.accrued.tr(),
          ),
          SummaWidget(
            titleFirst: LocaleKeys.total_salary.tr(),
            titleSecond: '10000000',
          ).paddingOnly(top: 25.w),
          SummaWidget(
            titleFirst: LocaleKeys.amount_for_car.tr(),
            titleSecond: '+5000000',
          ).paddingOnly(top: 15.w),
          SummaWidget(
            titleFirst: LocaleKeys.kpi_amount.tr(),
            titleSecond: '15000000',
            color: ColorName.buttonColor,
          ).paddingOnly(top: 15.w),
          SummaWidget(
            titleFirst: LocaleKeys.total.tr(),
            titleSecond: '15000000',
            color: ColorName.buttonColor,
          ).paddingOnly(top: 15.w),
        ],
      ).paddingAll(20.w),
    );
  }
}

class SummaWidget extends StatelessWidget {
  SummaWidget({
    Key? key,
    this.color,
    required this.titleFirst,
    required this.titleSecond,
  }) : super(key: key);
  final String titleFirst;
  final String titleSecond;
  Color? color = ColorName.gray3;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppWidgets.textLocale(
          localeKey: titleFirst,
          color: ColorName.gray2,
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
        ),
        Text(
          "${Widgets().num(titleSecond)} sum",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
