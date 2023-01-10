import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/ui/pages/orders_page/orders_page_widgets/order_id_card_widget.dart';
import 'package:agent/ui/pages/orders_page/orders_page_widgets/orders_id_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.gen.dart';
import '../../../widgets/app_widgets.dart';
import '../../order_page/order_page_widget/order_appbar_icon_widget.dart';
import '../bloc/orders_page_cubit.dart';

class OrderIdPageModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<OrdersPageCubit>(
          (i) => OrdersPageCubit(),
          onDispose: (v) => v.close(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          OrderIdPage.routeName,
          child: (context, args) => const OrderIdPage(),
        ),
      ];
}

class OrderIdPage extends StatelessWidget {
  const OrderIdPage({Key? key}) : super(key: key);
  static const String routeName = "/OrderIdPage";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    color: ColorName.primaryColor),
                height: 120.h,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppBarIcon.backButton(() {
                        Modular.to.pop();
                      }).paddingOnly(
                        left: 20.w,
                        right: 20.w,
                        top: 19.w,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppWidgets.textLocale(
                              localeKey: "Заказ ID 1259",
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorName.white,
                              isRichText: true)
                          .paddingOnly(top: 18.w, left: 20.w),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    color: ColorName.white),
                child: Column(
                  children: [
                    OrderIdCards.OrdersIdRowWidget(
                        "Торговая точка", "Osiyo market"),
                    Divider().paddingSymmetric(vertical: 13.w),
                    OrderIdCards.OrdersIdStatusRowWidget(
                      "Статус",
                      "status",
                      ColorName.green.withOpacity(0.2),
                      ColorName.green,
                    ),
                    Divider().paddingSymmetric(vertical: 13.w),
                    OrderIdCards.OrdersIdRowWidget("Склад", "Основной склад"),
                    Divider().paddingSymmetric(vertical: 13.w),
                    OrderIdCards.OrdersIdRowWidget("Дата", "16 окт, 1:43"),
                    Divider().paddingSymmetric(vertical: 13.w),
                    OrderIdCards.OrdersIdRowWidget("Скидка", "${0}%"),
                    Divider().paddingSymmetric(vertical: 13.w),
                    OrderIdCards.OrdersIdRowWidget("Сумма", "100 000"),
                    Divider().paddingSymmetric(vertical: 13.w),
                    OrderIdCards.OrdersIdRowWidget(
                        "Итого", "100 000", ColorName.button),
                    Divider().paddingSymmetric(vertical: 13.w),
                  ],
                ).paddingAll(20.w),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppWidgets.textLocale(
                            localeKey: "Товары",
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorName.black,
                            isRichText: true)
                        .paddingOnly(top: 24.w, bottom: 16.w),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppWidgets.textLocale(
                            localeKey: "Напитки",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorName.black,
                            isRichText: true)
                        .paddingOnly(bottom: 15.w),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return order_id_card(
                        name: "Coca cola 1.5",
                        volume: "volume",
                        volumeNumber: "15",
                        count: "count",
                        countNumber: "15",
                        summa: "summa",
                        summaNumber: "150 000 000",
                        card_onTap: () {},
                        context: context,
                      ).paddingOnly(bottom: 11.w);
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 29.w, top: 31),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorName.cyne),
                    height: 44.w,
                    width: 179.w,
                    child: Row(
                      children: [
                        Assets.images.exel.image(),
                        SizedBox(
                          width: 11.w,
                        ),
                        AppWidgets.textLocale(
                            localeKey: "Экспорт в Excel",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorName.darkGreen,
                            isRichText: true)
                      ],
                    ).paddingOnly(
                      left: 30.w,
                      right: 18.w,
                      top: 12.w,
                      bottom: 12.w,
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20.w),
            ],
          ),
        ),
      ),
    );
  }
}
