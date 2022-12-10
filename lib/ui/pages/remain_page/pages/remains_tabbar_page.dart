import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/remain_page/pages/remains_edit_page.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class RemainsTabbarPage extends StatelessWidget {
  const RemainsTabbarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 18.w),
          decoration: BoxDecoration(
            border: Border.all(color: ColorName.gray),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.textLocale(
                      localeKey: "Общая объем",
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: ColorName.gray2,
                      isRichText: true),
                  AppWidgets.textLocale(
                      localeKey: "1365 о",
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: ColorName.black,
                      isRichText: true),
                ],
              ).paddingSymmetric(vertical: 12.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.textLocale(
                      localeKey: "Общее кол-во",
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: ColorName.gray2,
                      isRichText: true),
                  AppWidgets.textLocale(
                      localeKey: "1258 шт",
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: ColorName.black,
                      isRichText: true),
                ],
              ).paddingOnly(bottom: 12.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.textLocale(
                      localeKey: "Общая сумма",
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: ColorName.gray2,
                      isRichText: true),
                  AppWidgets.textLocale(
                      localeKey: "150 000 000 UZS",
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: ColorName.button,
                      isRichText: true),
                ],
              ).paddingOnly(bottom: 12.w),
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
        Column(
          children: List.generate(
            3,
            (index) => SingleChildScrollView(
              child: remainsItems(context),
            ),
          ),
        ).marginOnly(
          bottom: 11,
        ),
      ],
    );
  }

  Widget remainsItems(BuildContext context) {
    return Container(
      height: 63.w,
      padding: EdgeInsets.only(
        top: 13.w,
        left: 12.w,
        right: 12.w,
      ),
      margin: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        bottom: 11.w,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorName.gray,
          )),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  AppWidgets.textLocale(
                      localeKey: "Остатки",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                  SizedBox(
                    width: 8.w,
                  ),
                  AppWidgets.textLocale(
                      localeKey: "17:18",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400),
                ],
              ),
              Container(
                height: 20.w,
                width: 20.w,
                decoration: BoxDecoration(
                  color: ColorName.background,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: PopupMenuTools(
                  onTap: (p0) {
                    if (p0 == 0) {
                      Modular.to.pushNamed(RemainsEditPage.routeName);
                    } else if (p0 == 1) {
                      showDialog(
                        context: context,
                        builder: (ctx) => const AlertDialog(
                          content: CommitTextField(
                            text: "Добавление комментарии",
                          ),
                        ),
                      );
                    }
                  },
                  popupMenuIconColor: ColorName.black,
                  textName: const [
                    "Редактрировать",
                    "Комментария к заказу",
                    'Отменить',
                  ],
                  icons: [
                    Assets.images.icons.editeAlt
                        .svg(fit: BoxFit.cover, color: ColorName.button),
                    Assets.images.icons.chat
                        .svg(fit: BoxFit.cover, color: ColorName.gray2),
                    Assets.images.icons.trash
                        .svg(fit: BoxFit.cover, color: ColorName.red),
                  ],
                  textColor: const [
                    ColorName.button,
                    ColorName.black,
                    ColorName.red,
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.w,
          ),
          Row(
            children: [
              AppWidgets.textLocale(
                localeKey: "Кол-во",
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: ColorName.gray2,
              ),
              SizedBox(
                width: 8.w,
              ),
              AppWidgets.textLocale(
                localeKey: " 1259 шт",
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: ColorName.button,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
