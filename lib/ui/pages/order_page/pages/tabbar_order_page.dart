import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import '../../../../core/utils/assets.gen.dart';

class TabbarOrderPage extends StatelessWidget {
  const TabbarOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: ColorName.gray),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.textLocale(
                    localeKey: LocaleKeys.total_volume,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: ColorName.gray2,
                  ),
                  AppWidgets.textLocale(
                    localeKey: "1365 о",
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: ColorName.black,
                  ),
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
                  ),
                  AppWidgets.textLocale(
                    localeKey: "1365 sht",
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: ColorName.black,
                  ),
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
                  ),
                  AppWidgets.textLocale(
                    localeKey: "150 000 000 UZS",
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: ColorName.button,
                  ),
                ],
              ).paddingOnly(bottom: 12.w),
            ],
          ).paddingSymmetric(horizontal: 20.w),
        ),
        SizedBox(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 11.w),
                child: Cards.cards_2(
                  context: context,
                  name: "name",
                  time: "17:02",
                  icon: PopupMenuTools(
                    onTap: (p0) {
                      if (p0 == 1) {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            content: CommitTextField(
                              text: LocaleKeys.adding_comments.tr(),
                            ),
                          ),
                        );
                      } else if (p0 == 2) {
                        showDialog(
                          context: context,
                          builder: (ctx) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: DateTimeDialog(
                              title: LocaleKeys.add_shipping_date.tr(),
                              closeTitle: LocaleKeys.close.tr(),
                              addTitle: LocaleKeys.add.tr(),
                              addTap: () {},
                            ),
                          ),
                        );
                      } else if (p0 == 3) {
                        showDialog(
                          context: context,
                          builder: (ctx) => Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: DateTimeDialog(
                              title: LocaleKeys.add_consignment.tr(),
                              closeTitle: LocaleKeys.close.tr(),
                              addTitle: LocaleKeys.add.tr(),
                              addTap: () {},
                            ),
                          ),
                        );
                      }
                    },
                    textName: [
                      LocaleKeys.edit.tr(),
                      LocaleKeys.comments_to_order.tr(),
                      LocaleKeys.shipping_date.tr(),
                      LocaleKeys.term_consignment.tr(),
                      LocaleKeys.pin_photo.tr(),
                      LocaleKeys.cancel.tr(),
                    ],
                    icons: [
                      Assets.images.icons.editeAlt
                          .svg(fit: BoxFit.cover, color: ColorName.button),
                      Assets.images.icons.chat
                          .svg(fit: BoxFit.cover, color: ColorName.gray2),
                      Assets.images.icons.calender
                          .svg(fit: BoxFit.cover, color: ColorName.gray2),
                      Assets.images.icons.clock
                          .svg(fit: BoxFit.cover, color: ColorName.gray2),
                      Assets.images.icons.fileUpload
                          .svg(fit: BoxFit.cover, color: ColorName.gray2),
                      const SizedBox.shrink(),
                    ],
                    textColor: const [
                      ColorName.button,
                      ColorName.black,
                      ColorName.black,
                      ColorName.black,
                      ColorName.black,
                      ColorName.red,
                    ],
                  ),
                  nalichniy: "spot",
                  bezbonus: "noBonus",
                  obem: "volume",
                  obemNumber: "15",
                  soni: LocaleKeys.qty.tr(),
                  soniNumber: "325",
                  summa: "summa",
                  summaNumber: "150 000 000",
                  fayl: "kostignatsiNumber",
                  komentariya: "komentariya",
                  kostignatsi: "kostignatsi",
                  kostignatsiNumber: "5465",
                  otgruzki: "otgruzki",
                  otgruzkiNumber: "1524",
                  status: 'status',
                  statusColor: ColorName.green,
                  card_onTap: () {},
                ),
              );
            },
          ).paddingSymmetric(horizontal: 20.w),
        ).paddingOnly(bottom: 10.w),
      ],
    );
  }
}
