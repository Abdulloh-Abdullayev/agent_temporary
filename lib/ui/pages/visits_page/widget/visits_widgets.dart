import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.gen.dart';

/// onTap key "0" = menu ontap, "1" = search ontap, "2" = location ontap
class VisitWidgets {
  /// onTap key "0" = menu ontap, "1" = search ontap, "2" = location ontap
  static Widget Appbar(
          {required String title, required Function(String key) ontap}) =>
      Container(
        padding: const EdgeInsets.all(20),
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
                  onTap: () => ontap("0"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.buttonBuilder(
                      backColor: ColorName.buttonBackColor,
                      child: Assets.images.icons.search.svg(),
                      padding: EdgeInsets.all(5),
                      onTap: () => ontap("1"),
                    ),
                    SizedBox(width: 12),
                    AppWidgets.buttonBuilder(
                      backColor: ColorName.buttonBackColor,
                      child: Assets.images.icons.mapLocation.svg(),
                      onTap: () => ontap("2"),
                      padding: EdgeInsets.all(3),
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
        ),
      );

  static Widget items({
    required String url,
    required String name,
    required String percent,
    required String sum,
  }) =>
      Container(
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
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: ColorName.background,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Assets.images.market.image(),
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
                            AppWidgets.text(text: LocaleKeys.order.tr()),
                            AppWidgets.text(text: LocaleKeys.exchange.tr())
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppWidgets.text(text: LocaleKeys.return_.tr()),
                            AppWidgets.text(
                                text: LocaleKeys.return_of_containers.tr())
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
}

// Возврат
// Возврат тары
