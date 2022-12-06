import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/act_reconciliation_page/widgets/act_widgets.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActReconciliationPageModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          ActReconciliationPage.routeName,
          child: (context, args) => const ActReconciliationPage(),
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

class ActReconciliationPage extends StatefulWidget {
  static const String routeName = "/act_reconciliation_page";
  const ActReconciliationPage({super.key});

  @override
  State<ActReconciliationPage> createState() => _ActReconciliationPageState();
}

class _ActReconciliationPageState extends State<ActReconciliationPage> {
  var columnTitles = ["Дата", "Тип", "Сумма"];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: ColorName.bgColor,
          child: Column(
            children: [
              ActWidget.AppBar(
                title: "booking",
                backOnTap: () {},
                buttonOnTap: () {},
                firstDataOnTap: () {},
                secondDataOnTap: () {},
                dropDownText: "dropDownText",
                firstText: "firstText",
                buttonText: "Применить",
                firstDate: "01.02.2022",
                secondDate: "18.02.2022",
              ),
              AppWidgets.textLocale(
                localeKey: "Запросить историю",
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: ColorName.black,
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
                                for (var columnTitle in columnTitles)
                                  ActWidget.dataColumn(
                                    columnTitle,
                                    align: columnTitle == columnTitles.last
                                        ? Alignment.centerRight
                                        : Alignment.centerLeft,
                                  ),
                              ],
                              rows: [
                                for (var dataRow in [
                                  [
                                    '21.10.2022',
                                    'Оплата на заказ',
                                    '+100 000 000 UZS'
                                  ],
                                  [
                                    '21.10.2022',
                                    'Оплата на заказ',
                                    '100 000 000 UZS'
                                  ],
                                  [
                                    '21.10.2022',
                                    'Оплата на заказ',
                                    '100 000 000 UZS'
                                  ],
                                  [
                                    '21.10.2022',
                                    'Оплата на заказ',
                                    '100 000 000 UZS'
                                  ],
                                  [
                                    '21.10.2022',
                                    'Оплата на заказ',
                                    '100 000 000 UZS'
                                  ],
                                  [
                                    '21.10.2022',
                                    'Оплата на заказ',
                                    '100 000 000 UZS'
                                  ],
                                  [
                                    '21.10.2022',
                                    'Оплата на заказ',
                                    '100 000 000 UZS'
                                  ],
                                  [
                                    '21.10.2022',
                                    'Оплата на заказ',
                                    '100 000 000 UZS'
                                  ],
                                  [
                                    '21.10.2022',
                                    'Оплата на заказ',
                                    '100 000 000 UZS'
                                  ],
                                  ['Заказ на сумму', '', '100 000 000 UZS'],
                                  ['Оплата на заказ', '', '+100 000 000 UZS'],
                                  ['Итоговый долг', '', '-0'],
                                ])
                                  ActWidget.dataRow(dataRow),
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
