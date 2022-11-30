import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'map_list_item_widget.dart';

class OutletsBottomSheet extends StatelessWidget {
  const OutletsBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.textLocale(
                    localeKey: LocaleKeys.show_on_map,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ).paddingOnly(left: 20.w),
                  ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    itemCount: 2,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => MapListItem(
                      title: 'Osiyo market',
                      index: index,
                      categoryName: 'Супермаркет',
                      dept: 100,
                      imgUrl: '',
                      percent: '40-50 %',
                    ),
                  ),
                  AppWidgets.textLocale(
                    localeKey: LocaleKeys.no_show_on_map,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ).paddingOnly(left: 20.w,top: 20.w),
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    itemCount: 2,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => MapListItem(
                      title: 'Osiyo market',
                      index: index,
                      categoryName: 'Супермаркет',
                      dept: 100,
                      imgUrl: '',
                      percent: '40-50 %',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: ColorName.white,
        ),
        const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: ColorName.gray2,
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Assets.images.icons.remove.svg(),
        ),
      ],
    ).paddingSymmetric(horizontal: 23.w, vertical: 26.w);
  }
}
