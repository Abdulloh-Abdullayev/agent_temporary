import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/ui/pages/diagnostics_page/diagnostics_page_widgets/mark_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.gen.dart';
import '../../../widgets/app_widgets.dart';

class TabbarSecondWidget extends StatelessWidget {
  const TabbarSecondWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: ColorName.gray),
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)),
          width: double.infinity,
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
                      localeKey: "План",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      isRichText: true,
                      color: ColorName.gray2)
                ],
              ).paddingOnly(top: 14.w, bottom: 20.w),
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: AppWidgets.textLocale(
                          localeKey: "${"10"}%",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          isRichText: true,
                          color: ColorName.black),
                    ),
                  ),
                  Container(
                    height: 51,
                    color: ColorName.gray.withOpacity(0.3),
                    width: 12.w,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: AppWidgets.textLocale(
                          localeKey: "${"10"}%",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          isRichText: true,
                          color: ColorName.black),
                    ),
                  ),
                ],
              ),
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
                      localeKey: "Общее количество заказов",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      isRichText: true,
                      color: ColorName.gray2)
                ],
              ).paddingOnly(top: 18.w, bottom: 16.w),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 52.w),
          child: const Divider(
            color: ColorName.gray2,
          ),
        ),
        MarkWidget(
          text: "Факт",
          ptop: 60.w,
          pleft: 125,
          width: 76.w,
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.17),
          child: const Divider(
            color: ColorName.gray2,
          ),
        ),
      ],
    );
  }
}
