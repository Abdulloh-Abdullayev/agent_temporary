import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/models/enums/shipping_type.dart';
import 'package:agent/core/utils/app_logger_util.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_radio_button.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class ReportsFilterBottomSheet extends StatelessWidget {
  const ReportsFilterBottomSheet({
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
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppWidgets.textLocale(
                        localeKey: "Фильтр",
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: AppWidgets.textLocale(
                          localeKey: "Сброс фильтра",
                          color: ColorName.red,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  AppRadioButton(
                    initial: ReportsDateType.shipping_date,
                    onChanged: (int v) {},
                  ).paddingOnly(top: 12.w),
                  AppWidgets.textLocale(
                    localeKey: "Статус заказа",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorName.gray3,
                  ).paddingOnly(top: 24.w, bottom: 12.w),
                  DropDown(
                    items: const [
                      'dcsdvsd',
                      'sddf',
                      'dcsdfsdvsd',
                    ],
                    title: "Доставлён",
                    onChange: (s) {
                      AppLoggerUtil.w("$s");
                    },
                    width: 1.sw,
                    height: 38.w,
                  ),
                ],
              ),
            ),
          ),
          AppWidgets.appButton(
            title: LocaleKeys.save.tr(),
            onTap: () {},
          ).paddingSymmetric(horizontal: 20.w, vertical: 23.w)
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
    ).paddingSymmetric(horizontal: 23.w, vertical: 10.w);
  }
}
