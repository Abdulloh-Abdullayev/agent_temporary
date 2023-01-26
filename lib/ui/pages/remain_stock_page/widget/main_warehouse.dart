import 'package:agent/core/extensions/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'remain_stock_item.dart';

class MainWarehouse extends StatelessWidget {
  const MainWarehouse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return RemainStockItem(index: index).paddingOnly(
                bottom: 8.w,
              );
            },
          ),
        ],
      ),
    );
  }
}
