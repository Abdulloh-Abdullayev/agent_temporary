import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';

class DebtorsTable extends StatelessWidget {
  const DebtorsTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: 60.w),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            if (index == 0) {
              return tableTitle();
            } else if (index == 7) {
              return tableTotal();
            }
            return const DebtorsItem();
          },
          separatorBuilder: (context, index) => Container(
            height: 1,
            color: ColorName.gray,
          ),
          itemCount: 8,
        ),
      ],
    ).paddingOnly(top: 24.w);
  }

  Widget tableTitle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      height: 40,
      decoration: BoxDecoration(
        color: ColorName.input,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(8.r),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                AppWidgets.text(
                  text: LocaleKeys.data.tr(),
                  maxLines: 1,
                  color: ColorName.gray2,
                  fontSize: 12.sp,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: AppWidgets.text(
              text: LocaleKeys.type.tr(),
              maxLines: 1,
              color: ColorName.gray2,
              fontSize: 12.sp,
              textAlign: TextAlign.start,
            ).paddingOnly(left: 10.w),
          ),
          Expanded(
            flex: 1,
            child: AppWidgets.text(
              text: LocaleKeys.amount.tr(),
              maxLines: 1,
              color: ColorName.gray2,
              fontSize: 12.sp,
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Widget tableTotal() {
    return Container(
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(8.r),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.text(
                text: LocaleKeys.order_for_amount.tr(),
                maxLines: 1,
                color: ColorName.gray2,
                fontSize: 12.sp,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
              ),
              AppWidgets.text(
                text: "100 000 000 UZS",
                maxLines: 1,
                color: ColorName.black,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                textAlign: TextAlign.center,
              ),
            ],
          ).paddingSymmetric(
            horizontal: 15.w,
            vertical: 10.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.text(
                text: LocaleKeys.pay_to_order.tr(),
                maxLines: 1,
                color: ColorName.gray2,
                fontSize: 12.sp,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
              ),
              AppWidgets.text(
                text: "+100 000 000 UZS",
                maxLines: 1,
                color: ColorName.green,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                textAlign: TextAlign.center,
              ),
            ],
          ).paddingSymmetric(
            horizontal: 15.w,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.text(
                text: LocaleKeys.total_debt.tr(),
                maxLines: 1,
                color: ColorName.gray2,
                fontSize: 12.sp,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w400,
              ),
              AppWidgets.text(
                text: "0",
                maxLines: 1,
                color: ColorName.red,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                textAlign: TextAlign.center,
              ),
            ],
          ).paddingSymmetric(
            horizontal: 15.w,
            vertical: 10.w,
          ),
        ],
      ),
    );
  }
}

class DebtorsItem extends StatelessWidget {
  const DebtorsItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.w, horizontal: 15.w),
      color: ColorName.white,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                AppWidgets.text(
                  text: "21.10.2022",
                  maxLines: 1,
                  color: ColorName.gray3,
                  fontSize: 12.sp,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: AppWidgets.text(
              text: LocaleKeys.pay_to_order.tr(),
              maxLines: 1,
              color: ColorName.gray3,
              fontSize: 12.sp,
              textAlign: TextAlign.start,
            ),
          ),
          Expanded(
            flex: 1,
            child: AppWidgets.text(
              text: "100 000 000 UZS",
              maxLines: 1,
              color: ColorName.black,
              fontSize: 12.sp,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
