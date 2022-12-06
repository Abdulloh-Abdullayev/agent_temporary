import 'package:agent/core/extensions/app_extensions.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.gen.dart';
import '../../../widgets/app_widgets.dart';

class TableDioModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          TableDio.routeName,
          child: (context, args) => const TableDio(),
        ),
      ];
}

class TableDio extends StatefulWidget {
  const TableDio({Key? key}) : super(key: key);
  static String routeName = "/TableDio";

  @override
  State<TableDio> createState() => _TableDioState();
}

class _TableDioState extends State<TableDio> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 81.w,
      ),
      width: 335.w,
      decoration: BoxDecoration(
        border: Border.all(color: ColorName.gray),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 67.w,
                height: 210.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 2,
                      child: AppWidgets.textLocale(
                              localeKey: "День",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorName.gray2,
                              isRichText: true)
                          .paddingOnly(
                        top: 12.w,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: AppWidgets.textLocale(
                              localeKey: "Объем",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorName.gray2,
                              isRichText: true)
                          .paddingOnly(
                        top: 24.w,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: AppWidgets.textLocale(
                              localeKey: "Strike",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorName.gray2,
                              isRichText: true)
                          .paddingOnly(
                        top: 24.w,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: AppWidgets.textLocale(
                        localeKey: "АКБ",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorName.gray2,
                        isRichText: true,
                      ).paddingOnly(
                        top: 24.w,
                        bottom: 11.w,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 210.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DataTable2(
                    scrollController: scrollController,
                    columnSpacing: 12.w,
                    minWidth: 500.w,
                    horizontalMargin: 12.w,
                    columns: List<DataColumn>.generate(
                      9,
                      (index) => DataColumn(
                        label: AppWidgets.textLocale(
                          localeKey: "19 okt",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorName.gray3,
                          isRichText: true,
                        ),
                      ),
                    ),
                    rows: <DataRow>[
                      DataRow(
                        cells: List.generate(
                          9,
                          (index) => DataCell(
                            AppWidgets.textLocale(
                              localeKey: "0",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorName.gray3,
                              isRichText: true,
                            ),
                          ),
                        ),
                      ),
                      DataRow(
                        cells: List.generate(
                          9,
                          (index) => DataCell(
                            AppWidgets.textLocale(
                              localeKey: "0",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorName.gray3,
                              isRichText: true,
                            ),
                          ),
                        ),
                      ),
                      DataRow(
                        cells: List.generate(
                          9,
                          (index) => DataCell(
                            AppWidgets.textLocale(
                              localeKey: "0",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorName.gray3,
                              isRichText: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
