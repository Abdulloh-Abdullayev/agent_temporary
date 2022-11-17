import 'package:agent/core/extensions/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.gen.dart';
import '../../../widgets/app_widgets.dart';

class TableWidget extends StatelessWidget {
  const TableWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 81.w),
      height: 197.w,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: ColorName.gray),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 67.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12)
                  )
                ),
                child: Column(
                  children: [
                    AppWidgets.textLocale(
                        localeKey: "День",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorName.gray2,
                        isRichText: true
                    ).paddingOnly(top: 12.w,),
                    AppWidgets.textLocale(
                        localeKey: "Объем",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorName.gray2,
                        isRichText: true
                    ).paddingOnly(top: 24.w,),
                    AppWidgets.textLocale(
                        localeKey: "Strike",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorName.gray2,
                        isRichText: true
                    ).paddingOnly(top: 24.w,),
                    AppWidgets.textLocale(
                        localeKey: "АКБ",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorName.gray2,
                        isRichText: true
                    ).paddingOnly(top: 24.w,bottom: 11.w),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
