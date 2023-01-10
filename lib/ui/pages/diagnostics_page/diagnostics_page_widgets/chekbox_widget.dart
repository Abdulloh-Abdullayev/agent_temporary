import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.gen.dart';

class ChekBoxWidget extends StatefulWidget {
  const ChekBoxWidget({super.key, required this.text});

  final String text;

  @override
  _ChekBoxWidgetState createState() => _ChekBoxWidgetState();
}

class _ChekBoxWidgetState extends State<ChekBoxWidget> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 20.w,
                width: 20.w,
                child: Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  activeColor: ColorName.green,
                  value: value,
                  onChanged: (value) {
                    setState(() {
                      this.value = value!;
                    });
                  },
                ),
              ),
            ).paddingOnly(right: 10.w),
            AppWidgets.textLocale(
                localeKey: widget.text,
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: ColorName.gray3,
                isRichText: true)
          ],
        ),
        const Divider().paddingOnly(top: 5.w)
      ],
    );
  }
}
