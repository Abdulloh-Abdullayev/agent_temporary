import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/home/home_page.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';


class ItemLeftMenu extends StatelessWidget {
  final String text;
  final Function onTap;
  final SvgGenImage icon;
  final Color textColor;

  const ItemLeftMenu({
    Key? key,
    required this.text,
    required this.onTap,
    required this.icon,
    this.textColor = ColorName.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HomePage.globalKey.currentState!.closeDrawer();
        onTap();
      },
      child: SizedBox(
        height: 55,
        child: Row(
          children: [
            Container(
              height: 24.w,
              width: 24.w,
              margin: EdgeInsets.only(right: 12.w),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(child: icon.svg(color: Colors.white)),
            ),
            AppWidgets.textLocale(
              localeKey: text,
              color: textColor,
            ),
          ],
        ).paddingOnly(left: 20.w),
      ),
    );
  }
}
