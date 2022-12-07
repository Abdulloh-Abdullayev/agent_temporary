import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/ui/pages/diagnostics_page/bloc/diagnostic_page_cubit.dart';
import 'package:agent/ui/pages/diagnostics_page/diagnostics_page_widgets/tabbar_third_widget.dart';
import 'package:agent/ui/pages/diagnostics_page/diagnostics_page_widgets/table_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import '../../../core/utils/colors.gen.dart';
import '../../widgets/app_widgets.dart';
import '../order_page/order_page_widget/order_appbar_icon_widget.dart';
import 'diagnostics_page_widgets/filter_bottom_sheet.dart';
import 'diagnostics_page_widgets/tabbar_first_widget.dart';
import 'diagnostics_page_widgets/tabbar_second_widget.dart';
import 'diagnostics_page_widgets/tabbar_widget.dart';

class DiagnosticsPageModule extends Module {

  @override
  List<Bind> get binds => [
        Bind.singleton<DiagnosticPageCubit>(
          (i) => DiagnosticPageCubit(),
          onDispose: (v) => v.close(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          DiagnosticsPage.routeName,
          child: (context, args) => const DiagnosticsPage(),
        ),
      ];
}

class DiagnosticsPage extends StatefulWidget {
  const DiagnosticsPage({Key? key}) : super(key: key);
  static const String routeName = "/DiagnosticsPage";

  static int tabChange = 0;

  @override
  State<DiagnosticsPage> createState() => _DiagnosticsPageState();
}

class _DiagnosticsPageState extends State<DiagnosticsPage>
    with TickerProviderStateMixin {
  late TabController _controller;
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(_handleTabSelection);
    scrollController = ScrollController();
    super.initState();
  }

  void _handleTabSelection() {
    if (_controller.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiagnosticPageCubit, DiagnosticPageState>(
      bloc: Modular.get<DiagnosticPageCubit>(),
      builder: (context, state) {
        return buildSafeArea(context);
      },
    );
  }

  Widget buildSafeArea(BuildContext context) {
    return SafeArea(
    child: Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                color: ColorName.primaryColor),
            height: 133.h,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppBarIcon.backButton(() {
                      Modular.to.pop();
                    }),
                    AppBarIcon.filterButton(() {
                      showModalBottomSheet(
                        enableDrag: true,
                        isDismissible: false,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                            )),
                        context: context,
                        builder: (context) {
                          return const FilterBottomSheet();
                        },
                      );
                    })
                  ],
                ).paddingOnly(
                  left: 20.w,
                  right: 20.w,
                  top: 19.w,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppWidgets.textLocale(
                          localeKey: "Диагностика",
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorName.white,
                          isRichText: true)
                      .paddingOnly(top: 18.w, left: 20),
                )
              ],
            ),
          ).paddingOnly(bottom: 18.w),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Widgets.showData(
                          count: "28",
                          title: "Всего дней",
                          color: ColorName.white),
                      SizedBox(
                        width: 12.w,
                      ),
                      Widgets.showData(
                          count: "28",
                          title: "Отработано",
                          color: ColorName.white),
                      SizedBox(
                        width: 12.w,
                      ),
                      Widgets.showData(
                        count: "28",
                        title: "Осталось",
                        color: ColorName.white,
                      ),
                    ],
                  ).paddingOnly(bottom: 24.w),
                  DiagnosticTabBarWidget(
                      _controller,
                      "Объем", "Strike", "Акб",
                          (int i) {
                        if (i == 0) {
                        } else if (i == 1) {
                        } else {}
                      }).paddingOnly(bottom: 15.w),
                  Container(
                    child: [
                      const TabbarFirstWidget(),
                      const TabbarSecondWidget(),
                      const TabbarThirdWidget(),
                    ][_controller.index],
                  ).paddingOnly(bottom: 24.w),
                  const TableDio(),

                ],
              ).paddingSymmetric(horizontal: 20.w),
            ),
          )
        ],
      ),
    ),
  );
  }
}

