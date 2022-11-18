import 'package:flutter/material.dart';
import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/colors.gen.dart';

class TableFactModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      TableFact.routeName,
      child: (context, args) => const TableFact(),
    ),
  ];
}

class TableFact extends StatelessWidget {
  const TableFact({Key? key}) : super(key: key);
  static String routeName = "/TableFact";

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        if (index == 0) {
          return tableTitle().paddingOnly(top: 40.w);
        } else {
          return tableItem(isLast: index == 7);
        }
      },
      separatorBuilder: (context, index) => Container(
        height: 1,
        color: ColorName.gray,
      ),
      itemCount: 4,
    );
  }


  Widget tableTitle() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: ColorName.buttonColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.r),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: AppWidgets.text(
              text: "Категория",
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