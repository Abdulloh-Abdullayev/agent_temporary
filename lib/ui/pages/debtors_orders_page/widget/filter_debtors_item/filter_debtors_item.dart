import 'package:agent/core/models/user_model.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:uikit/extensions/app_extensions.dart';

class FilterDebtorsItem extends StatelessWidget {
  const FilterDebtorsItem({
    Key? key,
    required this.onTap,
    required this.user,
  }) : super(key: key);

  final Function onTap;
  final Region user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(user.id),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 20.w,
                height: 20.w,
                decoration: BoxDecoration(
                  color: ColorName.background,
                  border: Border.all(
                    width: 1,
                    color: ColorName.gray,
                  ),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: user.isSelected!
                    ? const Icon(
                        Icons.check,
                        color: ColorName.black,
                        size: 18,
                      )
                    : const SizedBox(),
              ),
              AppWidgets.textLocale(
                localeKey: "${user.name}",
                color: ColorName.black,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ).paddingOnly(left: 20.w),
            ],
          ).paddingOnly(bottom: 14.w),
          Container(
            color: ColorName.gray,
            height: 1,
            width: 1.sw,
          ).paddingOnly(
            bottom: 12.w,
          ),
        ],
      ),
    );
  }
}
