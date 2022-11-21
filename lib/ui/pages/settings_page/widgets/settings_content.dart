import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsContent extends StatelessWidget {
  final String title;
  final List<Widget> items;
  final bool isDisable;

  const SettingsContent({
    required this.title,
    required this.items,
    this.isDisable = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isDisable,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isDisable
              ? AppWidgets.textLocale(
                  localeKey: "Эти настройки может изменить только модератор!",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorName.gray2,
                ).paddingOnly(
                  left: 20.w,
                  right: 20.w,
                  top: 18.w,
                )
              : const SizedBox(),
          Container(
            margin: EdgeInsets.only(top: 18.w),
            padding: EdgeInsets.symmetric(
              vertical: 18.w,
              horizontal: 20.w,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.textLocale(
                  localeKey: title,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorName.buttonColor,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: items,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
