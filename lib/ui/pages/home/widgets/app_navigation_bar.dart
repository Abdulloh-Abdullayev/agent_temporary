import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.gen.dart';
import 'app_navigation_bar_item.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key, required this.children});
  final List<AppNavigationBarItem> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.w),
      height: 70.w,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: ColorName.primaryColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.white10,
            blurRadius: 5,
            spreadRadius: -2,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
