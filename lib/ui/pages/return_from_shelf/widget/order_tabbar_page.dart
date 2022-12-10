import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/about_order/about_order.dart';
import 'package:agent/ui/pages/about_order/widgets/about_order_widgets.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import '../../../../core/utils/assets.gen.dart';

class OrderTabBarPage extends StatelessWidget {
  const OrderTabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                        localeKey: "1365 sht",
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
                        localeKey: "Общее summa",
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
            mainAxisSize: MainAxisSize.min,
            children: [
              ListView.builder(
                padding: EdgeInsets.only(top: 10.w),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 20,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 11.w),
                    child: Cards.cards_2(
                      context: context,
                      name: "name",
                      time: "time",
                      icon: PopupMenuTools(
                        onTap: (p0) {
                          if (p0 == 1) {
                            showDialog(
                              context: context,
                              builder: (ctx) => const AlertDialog(
                                content: CommitTextField(
                                  text: "Добавление комментарии",
                                ),
                              ),
                            );
                          } else if (p0 == 2) {
                            showDialog(
                              context: context,
                              builder: (ctx) => Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: DateTimeDialog(
                                    title: "Добавить дату отгрузки",
                                    closeTitle: "Закрыть",
                                    addTitle: "Добавить",
                                    addTap: () {}),
                              ),
                            );
                          } else if (p0 == 3) {
                            showDialog(
                              context: context,
                              builder: (ctx) => Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: DateTimeDialog(
                                    title: "Добавить консигнация",
                                    closeTitle: "Закрыть",
                                    addTitle: "Добавить",
                                    addTap: () {}),
                              ),
                            );
                          }
                        },
                        textName: const [
                          "Редактрировать",
                          "Комментария к заказу",
                          "Дата отгрузки",
                          "Срок Консигнация",
                          "Закрепить фото",
                          'Отменить',
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
                      nalichniy: "nalichniy",
                      bezbonus: "bezbonus",
                      obem: "obem",
                      obemNumber: "15",
                      soni: "soni",
                      soniNumber: "15",
                      summa: "summa",
                      summaNumber: "1000000",
                      card_onTap: () {
                        Modular.to.pushNamed(AboutOrderPage.routeName);
                      },
                      status: 'status',
                      statusColor: ColorName.green,
                    ),
                  );
                  // child: Cards.cards_2(
                  //   name: "name",
                  //   time: "time",
                  //   icon: PopupMenuTools(
                  //     onTap: (p0) {
                  //       if (p0 == 1) {
                  //         showDialog(
                  //           context: context,
                  //           builder: (ctx) => const AlertDialog(
                  //             content: CommitTextField(
                  //               text: "Добавление комментарии",
                  //             ),
                  //           ),
                  //         );
                  //       } else if (p0 == 2) {
                  //         showDialog(
                  //           context: context,
                  //           builder: (ctx) => Padding(
                  //             padding: const EdgeInsets.all(4.0),
                  //             child: DateTimeDialog(
                  //                 title: "Добавить дату отгрузки",
                  //                 closeTitle: "Закрыть",
                  //                 addTitle: "Добавить",
                  //                 addTap: () {}),
                  //           ),
                  //         );
                  //       } else if (p0 == 3) {
                  //         showDialog(
                  //           context: context,
                  //           builder: (ctx) => Padding(
                  //             padding: const EdgeInsets.all(4.0),
                  //             child: DateTimeDialog(
                  //                 title: "Добавить консигнация",
                  //                 closeTitle: "Закрыть",
                  //                 addTitle: "Добавить",
                  //                 addTap: () {}),
                  //           ),
                  //         );
                  //       }
                  //     },
                  //     textName: const [
                  //       "Редактрировать",
                  //       "Комментария к заказу",
                  //       "Дата отгрузки",
                  //       "Срок Консигнация",
                  //       "Закрепить фото",
                  //       'Отменить',
                  //     ],
                  //     icons: [
                  //       Assets.images.icons.editeAlt.svg(
                  //           fit: BoxFit.cover, color: ColorName.button),
                  //       Assets.images.icons.chat
                  //           .svg(fit: BoxFit.cover, color: ColorName.gray2),
                  //       Assets.images.icons.calender
                  //           .svg(fit: BoxFit.cover, color: ColorName.gray2),
                  //       Assets.images.icons.clock
                  //           .svg(fit: BoxFit.cover, color: ColorName.gray2),
                  //       Assets.images.icons.fileUpload
                  //           .svg(fit: BoxFit.cover, color: ColorName.gray2),
                  //       const SizedBox.shrink(),
                  //     ],
                  //     textColor: const [
                  //       ColorName.button,
                  //       ColorName.black,
                  //       ColorName.black,
                  //       ColorName.black,
                  //       ColorName.black,
                  //       ColorName.red,
                  //     ],
                  //   ),
                  //   nalichniy: "nalichniy",
                  //   bezbonus: "bezbonus",
                  //   dostavlen: "dostavlen",
                  //   obem: "obem",
                  //   obemNumber: "15",
                  //   soni: "soni",
                  //   soniNumber: "15",
                  //   summa: "summa",
                  //   summaNumber: "1000000",
                  //   context: context,
                  // );
                },
              )
            ],
          ).paddingSymmetric(horizontal: 20),
        ],
      ),
    );
  }
}
