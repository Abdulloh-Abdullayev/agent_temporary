import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TableFact extends StatelessWidget {
  const TableFact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        if (index == 0) {
          return tableTitle();
        } else {
          return tableItem(isLast: index == 7);
        }
      },
      separatorBuilder: (context, index) => Container(
        height: 1,
        color: ColorName.gray,
      ),
      itemCount: 8,
    );
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

  Widget tableItem({bool isLast = false}) {
    return Container(
      height: 40.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: isLast
            ? BorderRadius.vertical(
                bottom: Radius.circular(8.r),
              )
            : null,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: AppWidgets.text(
              text: "Напитки",
              maxLines: 1,
              color: ColorName.gray3,
              fontSize: 12.sp,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: AppWidgets.text(
              text: "30 шт",
              maxLines: 1,
              color: ColorName.gray3,
              fontSize: 12.sp,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: AppWidgets.text(
              text: "33% (10)",
              maxLines: 1,
              color: ColorName.red,
              fontSize: 12.sp,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: AppWidgets.text(
              text: "33% (10)",
              maxLines: 1,
              color: ColorName.green,
              fontSize: 12.sp,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
