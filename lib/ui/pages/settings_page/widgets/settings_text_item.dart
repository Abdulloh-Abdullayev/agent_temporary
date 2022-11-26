import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsTextItem extends StatelessWidget {
  final String title;
  final String text;
  final bool isLast;

  const SettingsTextItem({
    required this.title,
    required this.text,
    this.isLast = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppWidgets.textLocale(
                  localeKey: title,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: ColorName.primaryColor,
                ),
              ),
              AppWidgets.textLocale(
                localeKey: text,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: ColorName.primaryColor,
              )
            ],
          ).paddingOnly(top: 16),
          !isLast
              ? Container(
                  height: 1,
                  color: ColorName.background,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
