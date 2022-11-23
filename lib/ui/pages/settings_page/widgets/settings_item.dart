import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final String text;
  final VoidCallback onTap;
  final bool isLast;

  const SettingsItem({
    required this.title,
    required this.text,
    required this.onTap,
    this.isLast = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppWidgets.textLocale(
                        localeKey: text,
                        fontWeight: FontWeight.w500,
                        color: ColorName.gray2,
                      ).paddingOnly(right: 17.w),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 12,
                      )
                    ],
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
        ),
      ),
    );
  }
}
