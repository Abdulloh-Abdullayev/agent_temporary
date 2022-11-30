import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/colors.gen.dart';
import '../act_reconciliation_page/widgets/act_widgets.dart';

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
                secondDate: "10.05.2024",
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
              Text("data"),
              AppWidgets.textLocale(
                localeKey: "Запросить историю",
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: ColorName.button,
              ).marginSymmetric(vertical: 18),
              Expanded(
                child: Container(
                  width: 1.sw,
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 50),
                  decoration: BoxDecoration(
                    color: ColorName.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      width: 1.sw + (1.sw / tabsList.length * 2),
                      child: Column(
                        children: [
                          ActWidget.customDataTableTabs(
                            list: tabsList,
                            itemOnTap: (p0) {},
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: ActWidget.customDataTable(list: childlist),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static List<String> tabsList = [
    'Склад',
    'Дата',
    'Долг',
    'Оплачено',
    'Осталось',
  ];
  static List<List<String>> childlist = [
    [
      "Основной Долг Долг",
      '21.10.2022',
      "5 000",
      '+50 000',
      '+100 000 000 UZS',
    ],
    [
      "Основной склад",
      '21.10.2022',
      "5 000",
      '+50 000',
      '100 000 000 UZS',
    ],
    [
      "Основной склад",
      '21.10.2022',
      "5 000",
      '+50 000',
      '100 000 000 UZS',
    ],
    [
      "Основной склад",
      '21.10.2022',
      "5 000",
      '+50 000',
      '100 000 000 UZS',
    ],
    [
      "Основной склад",
      '21.10.2022',
      "5 000",
      '+50 000',
      '100 000 000 UZS',
    ],
    [
      "Основной склад",
      '21.10.2022',
      "5 000",
      '+50 000',
      '100 000 000 UZS',
    ],
    [
      "Основной склад",
      '21.10.2022',
      "5 000",
      '+50 000',
      '100 000 000 UZS',
    ],
    [
      "Основной склад",
      '21.10.2022',
      "5 000",
      '+50 000',
      '100 000 000 UZS',
    ],
    [
      "Основной склад",
      '21.10.2022',
      "5 000",
      '-',
      '100 000 000 UZS',
    ],
    ['Оплата на за', '', "", '', '100 000 000 UZS'],
    ['Оплата на заказ', '', "", '', '+100 000 000 UZS'],
    ['Итоговый долг', '', "", '', '-0'],
  ];
}
