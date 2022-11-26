import 'package:agent/core/extensions/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.gen.dart';

class OrderTabbarWidget extends StatelessWidget {
  OrderTabbarWidget(
      this._controller,
      this.title1,
      this.title2,
      this.function,
      );

  static int index = 0;
  final TabController _controller;
  String title1;
  String title2;
  Function function;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Container(
            height: 46.w,

            child: TabBar(
              controller: _controller,
              unselectedLabelColor: ColorName.button,
              labelColor: ColorName.button,
              onTap: (i) {
                function(i);
              },
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: ColorName.button,
              ),
              tabs: [
                Tab(
                  child: Text(
                    title1,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: "Gilroy"),
                  ),
                ),
                Tab(
                  child: Text(
                    title2,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14.sp,
                        overflow: TextOverflow.ellipsis,
                        fontFamily: "Gilroy"),
                  ),
                ),
              ],
            )
          ),
        ),
      ],
    );
  }
}
