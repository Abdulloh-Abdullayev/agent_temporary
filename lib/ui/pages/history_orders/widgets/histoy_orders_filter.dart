import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HistoryOrdersBottomSheet extends StatefulWidget {
  const HistoryOrdersBottomSheet({Key? key}) : super(key: key);

  @override
  State<HistoryOrdersBottomSheet> createState() => _HistoryOrdersBottomSheetState();
}

class _HistoryOrdersBottomSheetState extends State<HistoryOrdersBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(),
              Assets.images.icons.downIcon.svg(
                color: ColorName.gray2,
              ),
              Assets.images.icons.remove.svg(
                color: ColorName.gray2,
              )
            ],
          ).paddingSymmetric(vertical: 15.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.textLocale(
                localeKey: "Фильтр",
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
              InkWell(
                onTap: () {},
                child: AppWidgets.textLocale(
                  localeKey: "Сброс фильтра",
                  color: ColorName.red,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.textLocale(
                localeKey: "Выберите дату",
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: ColorName.gray3,
              ),
              InkWell(
                onTap: () {},
                child: AppWidgets.textLocale(
                  localeKey: "Текущий месяц",
                  color: ColorName.button,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ).paddingOnly(
            top: 24.w,
            bottom: 12.w,
          ),
        ],
      ).paddingSymmetric(horizontal: 20.w),
    );
  }
}