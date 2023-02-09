import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddImgButton extends StatelessWidget {
  final VoidCallback onTap;
  final double borderRadius;
  final double height;
  final double width;
  final EdgeInsets padding;

  const AddImgButton({
    required this.onTap,
    this.borderRadius = 8,
    this.height = 84,
    this.width = 104,
    this.padding = const EdgeInsets.all(5),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius.r),
        color: ColorName.buttonColor.withOpacity(0.1),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius.r),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(borderRadius.r),
              border: Border.all(
                color: ColorName.buttonColor,
              ),
            ),
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.add,
                  color: ColorName.primaryColor,
                ),
                AppWidgets.textLocale(
                  localeKey: LocaleKeys.add.tr(),
                  color: ColorName.primaryColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ).paddingOnly(top: 10.w)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
