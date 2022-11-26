import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/utils/colors.gen.dart';

class TableDioModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      TableDio.routeName,
      child: (context, args) => const TableDio(),
    ),
  ];
}

class TableDio extends StatelessWidget {
  const TableDio({Key? key}) : super(key: key);
  static String routeName = "/TableDio";

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        border: Border.all(color: ColorName.black)
      ),
      child: DataTable2(
          columnSpacing: 12,
            minWidth: 600,
            horizontalMargin: 12,
            columns: const <DataColumn>[
              DataColumn(label: Text('19 okt',),),
              DataColumn(label: Text('19 okt',),),
              DataColumn(label: Text('19 okt',),),
              DataColumn(label: Text('19 okt',),),
              DataColumn(label: Text('19 okt',),),
              DataColumn(label: Text('19 okt',),),
              DataColumn(label: Text('19 okt',),),
              DataColumn(label: Text('19 okt',),),
              DataColumn(label: Text('19 okt',),),
            ],
           rows: <DataRow>[
             DataRow(cells: [
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),

             ]),
             DataRow(cells: [
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),
             ]),
             DataRow(cells: [
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),
               DataCell(Text('0')),
             ]),
           ],
          ),
    );
  }
}