import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/remains_page/pages/remains_edit_page.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
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
                      localeKey: LocaleKeys.total_qty,
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
                      localeKey: LocaleKeys.total_amount,
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
            1,
            (index) => Container(
              margin: EdgeInsets.only(bottom: 11.w),
              child: Cards.cards_2(
                name: "Заказ в",
                time: "17:18",
                icon: PopupMenuTools(
                  onTap: (p0) {
                    if (p0 == 0) {
                      Modular.to.pushNamed(RemainsEditPage.routeName);
                    } else if (p0 == 1) {
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          content: CommitTextField(
                            text: LocaleKeys.adding_comments.tr(),
                          ),
                        ),
                      );
                    }
                  },
                  popupMenuIconColor: ColorName.black,
                  textName: [
                    LocaleKeys.edit.tr(),
                    LocaleKeys.comments_to_order.tr(),
                    LocaleKeys.cancel.tr(),
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
                nalichniy: "spot",
                bezbonus: "noBonus",
                obem: "volume",
                obemNumber: "15",
                soni: "count",
                soniNumber: "325",
                summa: "summa",
                summaNumber: "150 000 000",
                dostavlen: '',
                context: context,
              ),
            ),
          ),
        ).paddingSymmetric(horizontal: 20),
      ],
    );
  }
}
