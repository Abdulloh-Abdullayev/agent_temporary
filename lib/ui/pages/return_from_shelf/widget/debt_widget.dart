import 'package:agent/core/utils/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class DebtWidget extends StatelessWidget {
  const DebtWidget({
    Key? key, required this.money, required this.title, required this.width,
  }) : super(key: key);
  final int money;
  final String title;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            "${Widgets().num(money.toString())} UZS",
            style: TextStyle(
              color: ColorName.green,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            textAlign: TextAlign.center,
            title,
            style: TextStyle(
              color: ColorName.gray2,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
