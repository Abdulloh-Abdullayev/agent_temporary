import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/ui/pages/diagnostics_page/diagnostics_page_widgets/mark_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.gen.dart';
import '../../../widgets/app_widgets.dart';

class TabbarFirstWidget extends StatelessWidget {
  const TabbarFirstWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: ColorName.gray),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Column(
                      children: [
                        AppWidgets.textLocale(
                                localeKey: "5",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                isRichText: true,
                                color: ColorName.black)
                            .paddingOnly(bottom: 4.w),
                        AppWidgets.textLocale(
                            localeKey: LocaleKeys.plan,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            isRichText: true,
                            color: ColorName.gray2)
                      ],
                    ).paddingOnly(top: 15.w, bottom: 39.w),
                    AppWidgets.textLocale(
                            localeKey: "${"10"}%",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            isRichText: true,
                            color: ColorName.black)
                        .paddingOnly(bottom: 40.w),
                    AppWidgets.textLocale(
                            localeKey: "${"10"}%",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            isRichText: true,
                            color: ColorName.black)
                        .paddingOnly(bottom: 23.w)
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: ColorName.gray),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    Column(
                      children: [
                        AppWidgets.textLocale(
                                localeKey: "5",
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                isRichText: true,
                                color: ColorName.black)
                            .paddingOnly(bottom: 4.w),
                        AppWidgets.textLocale(
                            localeKey: LocaleKeys.in_a_day,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            isRichText: true,
                            color: ColorName.gray2)
                      ],
                    ).paddingOnly(top: 15.w, bottom: 39.w),
                    AppWidgets.textLocale(
                            localeKey: "${"10"}%",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            isRichText: true,
                            color: ColorName.black)
                        .paddingOnly(bottom: 40.w),
                    AppWidgets.textLocale(
                            localeKey: "${"10"}%",
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            isRichText: true,
                            color: ColorName.black)
                        .paddingOnly(bottom: 23.w)
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 52.w),
          child: const Divider(
            color: ColorName.gray2,
          ),
        ),
        MarkWidget(
          text: LocaleKeys.fact.tr(),
          ptop: 60.w,
          pleft: 120,
          width: 76.w,
        ),
        Padding(
          padding: EdgeInsets.only(top: 110.w),
          child: const Divider(
            color: ColorName.gray2,
          ),
        ),
        MarkWidget(
          text: LocaleKeys.forecast.tr(),
          ptop: 118.w,
          pleft: 105,
          width: 108.w,
        )
      ],
    );
  }
}
