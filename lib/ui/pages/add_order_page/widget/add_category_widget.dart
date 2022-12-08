import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bonus_type_widget.dart';

class AddOrderCategoryWidget extends StatefulWidget {
  const AddOrderCategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<AddOrderCategoryWidget> createState() => _AddOrderCategoryWidgetState();
}

class _AddOrderCategoryWidgetState extends State<AddOrderCategoryWidget> {
  bool isExist = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorName.background,
        borderRadius: BorderRadius.circular(8.w),
        border: Border.all(
          color: ColorName.gray,
        ),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isExist = !isExist;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppWidgets.textLocale(
                  localeKey: "Mars",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
                Row(
                  children: [
                    AppWidgets.textLocale(
                      localeKey: "0/17",
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ).paddingOnly(right: 8.w),
                    Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 17.w,
                    ),
                  ],
                ),
              ],
            ).paddingSymmetric(
              horizontal: 15.w,
              vertical: 13.w,
            ),
          ),
          AnimatedContainer(
            width: 1.sw,
            height: isExist ? (4 * 35.w) : 0.w,
            duration: const Duration(milliseconds: 600),
            child: ListView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              itemCount: isExist ? 15 : 0,
              itemBuilder: (context, index) {
                return const CategoryListWidget();
              },
            ),
          )
        ],
      ),
    );
  }
}
