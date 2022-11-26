import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SwitchButton extends StatelessWidget {
  final String title;
  final bool initialValue;
  final Function onChange;

  const SwitchButton({
    required this.title,
    required this.onChange,
    this.initialValue = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppWidgets.textLocale(
          localeKey: title,
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
        ).paddingOnly(right: 8),
        SizedBox(
          height: 17,
          width: 30,
          child: FittedBox(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: ColorName.gray,
              ),
              child: CupertinoSwitch(
                value: false,
                activeColor: CupertinoColors.white,
                trackColor: CupertinoColors.white,
                thumbColor: ColorName.buttonColor,
                onChanged: (v) => onChange(v),
              ),
            ),
          ),
        )
      ],
    );
  }
}
