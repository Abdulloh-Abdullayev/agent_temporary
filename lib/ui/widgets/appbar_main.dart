import 'package:agent/core/extensions/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/assets.gen.dart';
import '../../core/utils/colors.gen.dart';
import '../pages/home/home_page.dart';
import 'app_widgets.dart';

class AppBarMain extends StatelessWidget {
  AppBarMain({
    required this.text,
    required this.menuTab,
    this.pinTab,
    this.searchTab,
    this.locationTab,
    this.pinShow = false,
    this.searchShow = false,
    Key? key,
  }) : super(key: key);

  String text;
  VoidCallback menuTab;
  VoidCallback? pinTab;
  VoidCallback? searchTab;
  VoidCallback? locationTab;
  bool pinShow;
  bool searchShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
        color: ColorName.primaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.iconButton(
                onPressed: () {
                  HomePage.globalKey.currentState!.openDrawer();
                },
                icon: Assets.images.icons.menu,
              ),
              Row(
                children: [
                  pinShow
                      ? InkWell(
                          onTap: pinTab,
                          child: Assets.images.icons.pinButton.svg(),
                        )
                      : const SizedBox(),
                  searchShow
                      ? InkWell(
                          onTap: searchTab,
                          child: Assets.images.icons.searchButton.svg(),
                        ).paddingSymmetric(horizontal: 10.w)
                      : const SizedBox(),
                  InkWell(
                    onTap: locationTab,
                    child: Assets.images.icons.locationBuuton.svg(),
                  ),
                ],
              )
            ],
          ),
          AppWidgets.textLocale(
            localeKey: text,
            color: ColorName.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            padding: EdgeInsets.only(top: 15.w),
          )
        ],
      ),
    );
  }
}
