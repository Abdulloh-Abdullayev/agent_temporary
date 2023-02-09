import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widget/return_widget.dart';

class ReturnAboutPageModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          ReturnAboutPage.routeName,
          child: (context, args) => const ReturnAboutPage(),
        ),
      ];

// @override
// List<Bind<Object>> get binds => [
//       Bind<AppNavigationBloc>(
//         (i) => AppNavigationBloc(),
//         onDispose: (value) => value.close(),
//       ),
//     ];
}

class ReturnAboutPage extends StatefulWidget {
  static const String routeName = "/returnAboutPage";

  const ReturnAboutPage({Key? key}) : super(key: key);

  @override
  State<ReturnAboutPage> createState() => _ReturnAboutPageState();
}

class _ReturnAboutPageState extends State<ReturnAboutPage> {
  final List<String> firstTextNameItems = [
    LocaleKeys.discount.tr(),
    LocaleKeys.direction_type.tr(),
    LocaleKeys.price_type.tr(),
    LocaleKeys.stock.tr(),
    LocaleKeys.bonus.tr(),
    LocaleKeys.order_added.tr(),
    LocaleKeys.shipping_date.tr(),
    LocaleKeys.term_consignment.tr(),
  ];
  final List<String> secondTextNameItems = [
    LocaleKeys.without_discount.tr(),
    LocaleKeys.trade_directions.tr(),
    LocaleKeys.enumerations.tr(),
    LocaleKeys.main_warehouse.tr(),
    "10%",
    "16 окт, 1:43",
    "12.10.2022",
    "12.10.2022",
  ];
  String? selectedMenu;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorName.background,
        body: Column(
          children: [
            ReturnWidget.appBar(
              title: LocaleKeys.about_return.tr(),
              ontap: (key) {},
              context: context,
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var i = 0; i < firstTextNameItems.length; i++)
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 21),
                                ReturnWidget.bookingItems(
                                  firstName: firstTextNameItems[i],
                                  secondName: secondTextNameItems[i],
                                ),
                              ],
                            ),
                          AppWidgets.text(
                            text: LocaleKeys.order_comments.tr(),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: ColorName.gray2,
                          ).marginOnly(top: 16),
                          AppWidgets.text(
                            text:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,",
                            fontSize: 14,
                          ).marginOnly(top: 12, bottom: 15),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppWidgets.text(
                          text: LocaleKeys.returned_goods.tr(),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: ColorName.black,
                        ).marginOnly(top: 18),
                        AppWidgets.text(
                          text: "Напитки",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: ColorName.black,
                        ).marginOnly(top: 16),
                        const SizedBox(
                          height: 15,
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return ReturnWidget.cocaColaItems().paddingOnly(
                                bottom: 12.w,
                              );
                            }),
                        const SizedBox(
                          height: 18,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ReturnWidget.textBuilder(
                              LocaleKeys.total_volume.tr(),
                              "1365 о",
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ReturnWidget.textBuilder(
                              LocaleKeys.total_qty.tr(),
                              "1258 шт",
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ReturnWidget.textBuilder(
                              LocaleKeys.total_amount.tr(),
                              "150 000 000 UZS",
                              color: ColorName.button,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
