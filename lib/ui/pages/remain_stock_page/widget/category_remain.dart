import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryRemain extends StatelessWidget {
  const CategoryRemain({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: ColorName.gray, height: 1.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppWidgets.textLocale(
              localeKey: "Coca cola",
              color: ColorName.gray3,
              fontSize: 12.sp,
            ),
            AppWidgets.textLocale(
              localeKey: "100 100",
              color: ColorName.gray3,
              fontSize: 12.sp,
            ).paddingOnly(right: 50),
            AppWidgets.textLocale(
              localeKey: "1",
              color: ColorName.green,
              fontSize: 12.sp,
            ),
          ],
        ).paddingAll(12.w)
      ],
    );
  }
}
