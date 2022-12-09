import 'package:agent/core/utils/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketImage extends StatelessWidget {
  const MarketImage({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 90.w,
        width: 90.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: ColorName.primaryDark,
        ),
        child: SizedBox(
          height: 37.w,
          width: 43.w,
          child: Image.asset(image),
        ),
      ),
    );
  }
}