import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMapWidget {
  static Widget floatButton({
    required Widget child,
    required Function() onTap,
    Color color = Colors.blue,
    double height = 47,
    double width = 47,
  }) =>
      Container(
        height: height.w,
        width: width.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular((height / 2).w),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular((height / 2).w),
          child: InkWell(
            onTap: onTap,
            radius: height,
            borderRadius: BorderRadius.circular((height / 2).w),
            child: SizedBox(
              height: height.w,
              width: width.w,
              child: Center(child: child),
            ),
          ),
        ),
      );
}
