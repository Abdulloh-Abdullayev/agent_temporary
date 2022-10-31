import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_rich_text/super_rich_text.dart';

import '../../core/utils/assets.gen.dart';
import '../../core/utils/colors.gen.dart';
import 'app_widgets.dart';

class AppBarMain extends StatelessWidget {
  AppBarMain({
    required this.text,
    required this.onTapButton,
    Key? key,
  }) : super(key: key);

  String text;
  VoidCallback onTapButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 30.w,
        left: 20,
        right: 20,
      ),
      height: 90.w,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        color: ColorName.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppWidgets.textLocale(
              localeKey: text,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
              color: ColorName.black,
              isRichText: true,
              othersMarkers: [
                MarkerText(
                  marker: "//",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorName.green,
                  ),
                )
              ]),
          Container(
            height: 28.w,
            width: 28.w,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: ColorName.green, borderRadius: BorderRadius.circular(6)),
            child: InkWell(
              onTap: onTapButton,
              child: Assets.images.icons.notification.svg(),
            ),
          )
        ],
      ),
    );
  }
}
