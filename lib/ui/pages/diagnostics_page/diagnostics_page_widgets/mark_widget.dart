import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarkWidget extends StatelessWidget {
  const MarkWidget(
      {Key? key,
      required this.text,
      required this.ptop,
      required this.pleft,
      required this.width})
      : super(
          key: key,
        );
  final String text;
  final double ptop;
  final double pleft;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: ptop,
      left: pleft,
      child: Container(
        height: 30.w,
        width: width,
        decoration: const BoxDecoration(
          color: ColorName.gray,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
        ),
        child: Center(
          child: AppWidgets.textLocale(
            localeKey: text,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: ColorName.gray2,
          ),
        ),
      ),
    );
  }
}
