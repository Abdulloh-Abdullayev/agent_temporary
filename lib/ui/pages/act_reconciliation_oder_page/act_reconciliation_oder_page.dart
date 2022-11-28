import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
<<<<<<< HEAD
=======
import 'package:agent/ui/pages/act_reconciliation_page/widgets/act_widgets.dart';
>>>>>>> 9a902f021936cbe3f375107ade3850ceadb47082
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.gen.dart';
<<<<<<< HEAD
import '../act_reconciliation_page/widgets/act_widgets.dart';
=======
>>>>>>> 9a902f021936cbe3f375107ade3850ceadb47082

class ActReconciliationOderPageModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          actReconciliationOderPage.routeName,
          child: (context, args) => const actReconciliationOderPage(),
        ),
      ];

  @override
  List<Bind<Object>> get binds => [
        // Bind<AppNavigationBloc>(
        //   (i) => AppNavigationBloc(),
        //   onDispose: (value) => value.close(),
        // ),
      ];
}

class actReconciliationOderPage extends StatefulWidget {
  static const String routeName = "/act_reconciliation_oder_page";
  const actReconciliationOderPage({super.key});

  @override
  State<actReconciliationOderPage> createState() =>
      _actReconciliationOderPageState();
}

class _actReconciliationOderPageState extends State<actReconciliationOderPage> {
  var columnTitles = ["Склад", "Дата", "Долг", "Оплачено", "Осталось"];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: ColorName.bgColor,
          child: Column(
            children: [
              ActWidget.AppBar(
                title: "title",
                firstText: "firstText",
                buttonText: "buttonText",
                dropDownText: "dropDownText",
                backOnTap: () {},
                firstDataOnTap: () {},
                secondDataOnTap: () {},
                buttonOnTap: () {},
                firstDate: "05.05.2022",
                secondDate: "10.05.2023",
                actions: [
                  AppWidgets.buttonBuilder(
                    height: 28.w,
                    width: 28.w,
                    redius: 4,
                    child: Assets.images.icons.filter.svg(),
                    onTap: () {},
                  ),
                ],
              ),
              AppWidgets.textLocale(
                localeKey: "Запросить историю",
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: ColorName.button,
              ).marginSymmetric(vertical: 18),
              Expanded(
                child: Container(
                  width: 1.sw,
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 50),
                  decoration: BoxDecoration(
                    color: ColorName.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columnSpacing: 24,
                              horizontalMargin: 12,
                              columns: [
                                for (var e in columnTitles)
                                  ActWidget.dataColumn(
                                    e,
                                    align: e == columnTitles.last
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                  ),
                              ],
                              rows: [
                                for (var e in [
                                  [
                                    "Основной склад",
                                    '21.10.2022',
                                    "5 000",
                                    'Оплата на заказ',
                                    '+100 000 000 UZS',
                                  ],
                                  [
                                    "Основной склад",
                                    '21.10.2022',
                                    "5 000",
                                    'Оплата на заказ',
                                    '100 000 000 UZS',
                                  ],
                                  [
                                    "Основной склад",
                                    '21.10.2022',
                                    "5 000",
                                    'Оплата на заказ',
                                    '100 000 000 UZS',
                                  ],
                                  [
                                    "Основной склад",
                                    '21.10.2022',
                                    "5 000",
                                    'Оплата на заказ',
                                    '100 000 000 UZS',
                                  ],
                                  [
                                    "Основной склад",
                                    '21.10.2022',
                                    "5 000",
                                    'Оплата на заказ',
                                    '100 000 000 UZS',
                                  ],
                                  [
                                    "Основной склад",
                                    '21.10.2022',
                                    "5 000",
                                    'Оплата на заказ',
                                    '100 000 000 UZS',
                                  ],
                                  [
                                    "Основной склад",
                                    '21.10.2022',
                                    "5 000",
                                    'Оплата на заказ',
                                    '100 000 000 UZS',
                                  ],
                                  [
                                    "Основной склад",
                                    '21.10.2022',
                                    "5 000",
                                    'Оплата на заказ',
                                    '100 000 000 UZS',
                                  ],
                                  [
                                    "Основной склад",
                                    '21.10.2022',
                                    "5 000",
                                    'Оплата на заказ',
                                    '100 000 000 UZS',
                                  ],
                                  [
                                    'Заказ на сумму',
                                    '',
                                    "5 000",
                                    "",
                                    '100 000 000 UZS',
                                  ],
                                  [
                                    'Оплата на заказ',
                                    '',
                                    "5 000",
                                    '',
                                    '+100 000 000 UZS'
                                  ],
                                  ['Итоговый долг', '', "5 000", '', '-0'],
                                ])
                                  ActWidget.dataRow(e),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
