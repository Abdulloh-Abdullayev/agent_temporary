import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'return_item_widget.dart';

class AboutReturnWidget extends StatelessWidget {
  const AboutReturnWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: ColorName.gray),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.textLocale(
                        localeKey: "Общая объем",
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: ColorName.gray2,
                        isRichText: true),
                    AppWidgets.textLocale(
                        localeKey: "1365 о",
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: ColorName.black,
                        isRichText: true),
                  ],
                ).paddingSymmetric(vertical: 12.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.textLocale(
                        localeKey: "Общее кол-во",
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: ColorName.gray2,
                        isRichText: true),
                    AppWidgets.textLocale(
                        localeKey: "1365 sht",
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: ColorName.black,
                        isRichText: true),
                  ],
                ).paddingOnly(bottom: 12.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.textLocale(
                        localeKey: "Общее summa",
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: ColorName.gray2,
                        isRichText: true),
                    AppWidgets.textLocale(
                        localeKey: "150 000 000 UZS",
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: ColorName.button,
                        isRichText: true),
                  ],
                ).paddingOnly(bottom: 12.w),
              ],
            ).paddingSymmetric(horizontal: 20.w),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.builder(
                padding: EdgeInsets.only(top: 10.w),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const ReturnItemWidget();
                },
              )
            ],
          ).paddingSymmetric(horizontal: 20),
        ],
      ),
    );
  }
}

