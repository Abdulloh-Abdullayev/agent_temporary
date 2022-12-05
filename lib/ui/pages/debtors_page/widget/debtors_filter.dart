import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/app_logger_util.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/debtors_page/widget/deptors_history.dart';
import 'package:agent/ui/widgets/app_text_field.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class DebtorsFilterBottomSheet extends StatelessWidget {
  const DebtorsFilterBottomSheet({
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppWidgets.textLocale(
                        localeKey: "Выберите дату",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorName.gray3,
                      ),
                      AppWidgets.textLocale(
                        localeKey: "Текущий месяц",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorName.button,
                      ),
                    ],
                  ).paddingOnly(
                    top: 15.w,
                    bottom: 10.w,
                  ),
                  AppTextField(
                    hintText: "Выбрать",
                    onChanged: (v) {},
                    title: "",
                    hasTitle: false,
                    height: 40.w,
                  ),
                  AppWidgets.textLocale(
                    localeKey: "Выберите территорию",
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
                  AppWidgets.textLocale(
                    localeKey: "Дни посещения",
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
            title: "Применить",
            onTap: () {
              Modular.to.pushNamed(DebtorsHistory.routeName);
            },
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
