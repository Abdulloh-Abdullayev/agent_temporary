import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/add_order_page/widget/add_bonus_last_widget.dart';
import 'package:agent/ui/pages/add_order_page/widget/bonus_type_widget.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';
import 'package:uikit/uikit.dart';
import 'add_category_widget.dart';

class SelectCategoryWidget extends StatelessWidget {
  const SelectCategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.w),
          height: 620.w,
          width: 1.sw,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.w),
            color: ColorName.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 25.w,
                            color: ColorName.gray2,
                          ).paddingOnly(left: 10.w),
                        ),
                        InkWell(
                          onTap: () {
                            Modular.to.pop();
                          },
                          child: Assets.images.icons.remove.svg(
                            color: ColorName.gray2,
                            height: 30.w,
                          ),
                        ),
                      ],
                    ),
                    AppWidgets.textLocale(
                      localeKey: LocaleKeys.select_category,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.sp,
                    ).paddingOnly(
                      top: 10.w,
                      bottom: 24.w,
                    ),
                    AppWidgets.textLocale(
                      localeKey: LocaleKeys.bonus_type,
                      color: ColorName.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return const BonusTypeWidget().paddingOnly(
                          bottom: 13.w,
                          top: 13.w,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                          height: 1,
                          width: 1.sw,
                          color: ColorName.gray,
                        );
                      },
                      itemCount: 3,
                    ),
                    AppWidgets.textLocale(
                      localeKey: LocaleKeys.category,
                      color: ColorName.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                    ).paddingOnly(
                      bottom: 18.w,
                      top: 5.w,
                    ),
                    ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const AddOrderCategoryWidget()
                              .paddingOnly(bottom: 10.w);
                        }),
                  ],
                ),
              ],
            ).paddingOnly(bottom: 50.w),
          ),
        ),
        Positioned(
          bottom: 15.w,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppButton(
                width: 165.w,
                color: ColorName.gray,
                text: LocaleKeys.close.tr(),
                textSize: 14.sp,
                textColor: ColorName.mainColor,
                onPressed: () {},
              ),
              AppButton(
                width: 165.w,
                color: ColorName.buttonColor,
                text: LocaleKeys.add.tr(),
                textSize: 14.sp,
                textColor: ColorName.white,
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      enableDrag: true,
                      isDismissible: false,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return const AddBonusLastWidget();
                      });
                },
              ),
            ],
          ).paddingSymmetric(horizontal: 15.w),
        ),
      ],
    );
  }
}
