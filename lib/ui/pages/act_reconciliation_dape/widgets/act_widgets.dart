import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActWidget {
  static Widget AppBar() {
    return Container(
      height: 267.w,
      width: 1.sw,
      decoration: BoxDecoration(
        color: ColorName.primaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              AppWidgets.appButton(
                title: "",
                width: 28,
                height: 28,
                onTap: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
