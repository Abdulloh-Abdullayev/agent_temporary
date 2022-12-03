import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.gen.dart';

/// onTap key "0" = menu ontap, "1" = search ontap, "2" = location ontap
class VisitWidgets {
  /// onTap key "0" = menu ontap, "1" = search ontap, "2" = location ontap
  static Widget Appbar({
    required String title,
    required Function(String key) ontap,
  }) =>
      Container(
        height: 107.h,
        width: 1.sw,
        decoration: BoxDecoration(
          color: ColorName.primaryColor,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppWidgets.buttonBuilder(
                  backColor: ColorName.buttonBackColor,
                  child: Assets.images.icons.menu.svg(),
                  onTap: () {
                    print("object");
                    ontap("0");
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.buttonBuilder(
                      backColor: ColorName.buttonBackColor,
                      child: Assets.images.icons.ping.svg().paddingAll(2),
                      padding: EdgeInsets.all(3),
                      onTap: () => ontap("0"),
                    ),
                    SizedBox(width: 12),
                    AppWidgets.buttonBuilder(
                      backColor: ColorName.buttonBackColor,
                      child: Assets.images.icons.search.svg(),
                      padding: EdgeInsets.all(3),
                      onTap: () => ontap("1"),
                    ),
                    SizedBox(width: 12),
                    AppWidgets.buttonBuilder(
                      backColor: ColorName.buttonBackColor,
                      child: Assets.images.icons.mapLocation.svg(),
                      onTap: () => ontap("2"),
                      padding: EdgeInsets.all(2),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 18),
            AppWidgets.textLocale(
              color: ColorName.white,
              localeKey: title,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            )
          ],
        ).paddingLTRB(20, 19, 20, 0),
      );

  static Widget items({
    required int index,
    required String url,
    required String name,
    required String type,
    required String percent,
    required String sum,
    required Function() onTap,
  }) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          height: 105.h,
          width: 1.sw,
          decoration: BoxDecoration(
            color: ColorName.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50.w,
                    width: 50.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: ColorName.background,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        AppWidgets.networkImage(
                          url: url,
                          height: 50.w,
                          width: 50.w,
                          radius: 8,
                          errorChild: Assets.images.market.image(),
                        ),
                        Transform(
                          alignment: Alignment.topLeft,
                          transform: Matrix4.identity()
                            ..setTranslationRaw(-4, -4, 0),
                          child: indexWidget(index),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppWidgets.text(text: name),
                              AppWidgets.text(text: percent)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppWidgets.text(text: type),
                              AppWidgets.text(text: sum)
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ).marginLTRB(12, 12, 12, 8),
              divider(),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        for (var i = 0; i < [1, 2, 3, 4, 5].length; i++)
                          Row(
                            children: [
                              i == 0 || i == [1, 2, 3, 4, 5].length
                                  ? SizedBox.shrink()
                                  : dot().marginSymmetric(horizontal: 5),
                              AppWidgets.text(text: "text"),
                            ],
                          ),
                        SizedBox(width: 10),
                        AppWidgets.text(
                          text: "+1",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorName.button,
                        )
                      ],
                    ).marginSymmetric(horizontal: 12),
                  ),
                ),
              )
            ],
          ),
        ),
      );

  static Widget divider() => Container(
        height: 1,
        width: 1.sw,
        color: ColorName.gray,
      );
  static Widget dot() => Container(
        height: 5.w,
        width: 5.w,
        decoration: BoxDecoration(
          color: ColorName.gray3,
          shape: BoxShape.circle,
        ),
      );
  static Widget indexWidget(int index) => Container(
        height: 18.w,
        width: 21.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ColorName.primaryColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: AppWidgets.text(
          text: (index + 1).toString(),
          fontSize: 12,
          color: ColorName.white,
        ),
      );
}


// Заказ
// Обмен
// Возврат
// Возврат тары
