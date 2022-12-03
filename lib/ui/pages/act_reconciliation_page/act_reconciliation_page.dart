import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/act_reconciliation_page/cubit/act_cubit.dart';
import 'package:agent/ui/pages/act_reconciliation_page/widgets/act_widgets.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        Bind<ActCubit>(
          (i) => ActCubit(),
          onDispose: (value) => value.close(),
        ),
      ];
}

class ActReconciliationPage extends StatefulWidget {
  static const String routeName = "/act_reconciliation_page";
  const ActReconciliationPage({super.key});

  @override
  State<ActReconciliationPage> createState() => _ActReconciliationPageState();
}

class _ActReconciliationPageState extends State<ActReconciliationPage> {
  var scrollController = ScrollController();
  var _cubit = ActCubit.to;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActCubit, ActState>(
      bloc: _cubit,
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              color: ColorName.bgColor,
              child: Column(
                children: [
                  ActWidget.AppBar(
                    title: LocaleKeys.act_of_reconciliation,
                    backOnTap: () {
                      Modular.to.pop();
                    },
                    buttonOnTap: () {
                      // dateListSorter(mayll.first);
                    },
                    firstDataOnTap: () {},
                    secondDataOnTap: () {},
                    firstText: LocaleKeys.select_date,
                    dropDownText: LocaleKeys.current_month,
                    buttonText: LocaleKeys.apply,
                    firstDate: "01.02.2022",
                    secondDate: "18.02.2022",
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
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 50),
                      decoration: BoxDecoration(
                        color: ColorName.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          ActWidget.customDataTableTabs(
                            list: state.tableColumns,
                            alins: List<Alignment>.generate(
                              state.tableColumns.length,
                              (i) => state.tableColumns.last ==
                                      state.tableColumns[i]
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                            ),
                            itemOnTap: (p0) {
                              _cubit.baseSort(p0);
                            },
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              child: ActWidget.customDataTable(
                                list: state.tempTableChildren,
                                alins: List<List<Alignment>>.generate(
                                  state.tempTableChildren.length,
                                  (i) => List<Alignment>.generate(
                                    state.tempTableChildren[i].length,
                                    (j) =>
                                        state.tempTableChildren[i].length - 1 ==
                                                j
                                            ? Alignment.centerRight
                                            : Alignment.centerLeft,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ActWidget.sumWidgetBuilder(state.allSum)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
