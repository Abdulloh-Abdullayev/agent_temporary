import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsSwitch extends StatelessWidget {
  final String title;
  final bool initial;
  final ValueChanged<bool> onChanged;
  final bool isLast;
  final bool isDisable;

  const SettingsSwitch({
    required this.title,
    required this.onChanged,
    this.initial = false,
    this.isLast = false,
    this.isDisable = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double opacity = isDisable?0.2:1;
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
              SizedBox(
                height: 20.w,
                width: 40.w,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: CupertinoSwitch(
                    value: initial,
                    activeColor: ColorName.button.withOpacity(opacity),
                    trackColor: ColorName.gray.withOpacity(opacity),
                    thumbColor: ColorName.white,
                    onChanged: (v) => onChanged(v),
                  ),
                ),
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
