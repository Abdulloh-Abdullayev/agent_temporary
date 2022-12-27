import 'package:agent/core/extensions/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import '../../../../core/utils/assets.gen.dart';
import '../../../../core/utils/colors.gen.dart';
import '../../../widgets/app_widgets.dart';

class TabbarFirstItem extends StatelessWidget {
  const TabbarFirstItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.textLocale(
                  localeKey: "Заказы",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorName.black,
                  isRichText: true),
              DropDown(
                width: 234.w,
                items: [
                  "Все статусы",
                  "Выполненные",
                  "Доставленные",
                  "Возвраты",
                  "Отмененные",
                  "Новые"
                ],
                title: "Все статусы",
                onChange: () {},
              )
            ],
          ).paddingSymmetric(horizontal: 20.w),
          ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 18.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: ColorName.white),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppWidgets.textLocale(
                          localeKey: "Заказы",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorName.black,
                          isRichText: true),
                    ).paddingOnly(bottom: 18.w),
                    Column(
                      children: [
                        Cards.cards_4_5(
                          cardId: "ID 1535",
                          time: "14:15 ",
                          date: "21.10.2022",
                          name: "Osiyo market",
                          itogo: "Итого",
                          itogoNumber: "123 000 000",
                          status: "Новый",
                          bonus: "Бонус",
                          bonusNumber: "8",
                          statusButtonWidth: 59.w,
                          icon_1: Assets.images.icons.checkIcon
                              .svg(fit: BoxFit.cover, color: ColorName.green),
                          statusColor: Colors.deepPurple.withOpacity(0.2),
                          statusTextColor: Colors.deepPurple,
                          card_onTap: () {},
                        ).paddingOnly(bottom: 12.w),
                        Cards.cards_4_5(
                          cardId: "ID 1535",
                          time: "14:15 ",
                          date: "21.10.2022",
                          name: "Osiyo market",
                          itogo: "Итого",
                          itogoNumber: "123 000 000",
                          status: "Новый",
                          bonus: "Бонус",
                          bonusNumber: "8",
                          statusButtonWidth: 59.w,
                          icon_1: Assets.images.icons.xIcon
                              .svg(fit: BoxFit.cover, color: ColorName.red),
                          statusColor: Colors.deepPurple.withOpacity(0.2),
                          statusTextColor: Colors.deepPurple,
                          card_onTap: () {},
                        ),
                      ],
                    )
                  ],
                ).paddingSymmetric(
                  horizontal: 20.w,
                  vertical: 18.w,
                ),
              );
            },
          ).paddingOnly(top: 18.w),
        ],
      ),
    );
  }
}
