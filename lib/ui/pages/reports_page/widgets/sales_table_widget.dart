import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';

import 'sales_table_item.dart';

class SalesTableWidget extends StatelessWidget {
  const SalesTableWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppWidgets.textLocale(
          localeKey: "Продажи",
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ).paddingOnly(bottom: 16.sp),
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: 60.w),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            if (index == 0) {
              return tableTitle();
            } else if (index == 7) {
              return tableTotal();
            }
            return const SaleTableItem();
          },
          separatorBuilder: (context, index) => Container(
            height: 1,
            color: ColorName.gray,
          ),
          itemCount: 8,
        ),
      ],
    ).paddingOnly(top: 24.w);
  }

  Widget tableTitle() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: ColorName.input,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.r),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: AppWidgets.text(
              text: LocaleKeys.category.tr(),
              maxLines: 1,
              color: ColorName.gray2,
              fontSize: 12.sp,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: AppWidgets.text(
              text: "План",
              maxLines: 1,
              color: ColorName.gray2,
              fontSize: 12.sp,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: AppWidgets.text(
              text: "Факт",
              maxLines: 1,
              color: ColorName.gray2,
              fontSize: 12.sp,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: AppWidgets.text(
              text: "Прогноз",
              maxLines: 1,
              color: ColorName.gray2,
              fontSize: 12.sp,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget tableTotal() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(8.r),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: AppWidgets.text(
              text: "Итого",
              maxLines: 1,
              color: ColorName.buttonColor,
              fontSize: 12.sp,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
            ),
          ),
          Expanded(
            flex: 1,
            child: AppWidgets.text(
              text: "30 шт",
              maxLines: 1,
              color: ColorName.buttonColor,
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: AppWidgets.text(
              text: "-",
              maxLines: 1,
              color: ColorName.buttonColor,
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: AppWidgets.text(
              text: "100 000 000",
              maxLines: 1,
              color: ColorName.buttonColor,
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
