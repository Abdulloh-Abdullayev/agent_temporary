import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/ui/pages/act_reconciliation_oder_page/cubit/act_oder_cubit.dart';
import 'package:agent/ui/pages/act_reconciliation_oder_page/widget/act_oder_widget.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import '../../../core/utils/colors.gen.dart';
import '../act_reconciliation_page/widgets/act_widgets.dart';

class ActReconciliationOderPageModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          ActReconciliationOderPage.routeName,
          child: (context, args) => const ActReconciliationOderPage(),
        ),
      ];

  @override
  List<Bind<Object>> get binds => [
        Bind<ActOderCubit>(
          (i) => ActOderCubit(),
          onDispose: (value) => value.close(),
        ),
      ];
}

class ActReconciliationOderPage extends StatefulWidget {
  static const String routeName = "/act_reconciliation_oder_page";

  const ActReconciliationOderPage({super.key});

  @override
  State<ActReconciliationOderPage> createState() =>
      _ActReconciliationOderPageState();
}

class _ActReconciliationOderPageState extends State<ActReconciliationOderPage> {
  // var columnTitles = ["Склад", "Дата", "Долг", "Оплачено", "Осталось"];
  var _cubit = ActOderCubit.to;
  var list = <String>[
    "item1",
    "item2",
    "item3",
    "item4",
    "item5",
    "item6",
    "item7"
  ];
  var list2 = <String>["item1", "item2", "item3", "item4", "item5"];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActOderCubit, ActOderState>(
      bloc: _cubit,
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              color: ColorName.bgColor,
              child: Column(
                children: [
                  ActWidget.AppBar(
                    title: LocaleKeys.order_reconciliation_act,
                    firstText: LocaleKeys.select_date,
                    buttonText: LocaleKeys.apply,
                    dropDownText: LocaleKeys.current_month,
                    backOnTap: () {
                      Modular.to.pop();
                    },
                    firstDataOnTap: () {
                      openDatePicker('1');
                    },
                    secondDataOnTap: () {
                      openDatePicker('2');
                    },
                    buttonOnTap: () {},
                    firstDate: DateFormat("dd.MM.yyyy").format(state.firstDate),
                    secondDate:
                        DateFormat("dd.MM.yyyy").format(state.secondDate),
                    actions: [
                      AppWidgets.buttonBuilder(
                        height: 28.w,
                        width: 28.w,
                        radius: 4,
                        child: Assets.images.icons.filter.svg().paddingAll(4),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            barrierColor: Colors.black.withOpacity(.5),
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return Container(
                                color: Colors.transparent,
                                child: ActOderWidget.filterWidget(
                                  firstItemName: LocaleKeys.filter,
                                  item1: list,
                                  item1onTap: (key, index, check) {
                                    print(key);

                                    print(check);
                                  },
                                  secondItemName: LocaleKeys.reset_filter,
                                  item2: list2,
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  AppWidgets.textLocale(
                    localeKey: LocaleKeys.request_history,
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
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                width: 1.sw +
                                    (1.sw / state.tableColumns.length * 2),
                                child: Column(
                                  children: [
                                    ActWidget.customDataTableTabs(
                                      list: state.tableColumns,
                                      itemOnTap: (p0) {
                                        _cubit.baseSort(p0);
                                      },
                                      alins: List<Alignment>.generate(
                                        state.tableColumns.length,
                                        (i) {
                                          if (state.tableColumns.length - 1 ==
                                              i) {
                                            return Alignment.centerRight;
                                          } else {
                                            return Alignment.centerLeft;
                                          }
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: ActWidget.customDataTable(
                                          list: state.tempTableChildren,
                                          alins: List<List<Alignment>>.generate(
                                            state.tempTableChildren.length,
                                            (index) {
                                              return List<Alignment>.generate(
                                                state.tableColumns.length,
                                                (i) {
                                                  if (state.tableColumns
                                                              .length -
                                                          1 ==
                                                      i) {
                                                    return Alignment
                                                        .centerRight;
                                                  } else {
                                                    return Alignment.centerLeft;
                                                  }
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ActWidget.sumWidgetBuilder(state.allSum)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  openDatePicker(String key) {
    showDialog(
      context: context,
      builder: (context) {
        return DateTimeDialog(
          title: "Sanani tanlang",
          closeTitle: "cancle",
          addTitle: "Add",
          addTap: (DateTime dateTime) {
            _cubit.changeDate(key, dateTime);
          },
        );
        ;
      },
    );
  }
}
