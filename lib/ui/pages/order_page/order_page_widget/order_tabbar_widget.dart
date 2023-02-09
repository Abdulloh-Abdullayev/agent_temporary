import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.gen.dart';

class OrderTabbarWidget extends StatelessWidget {
  OrderTabbarWidget(
    this._controller,
    this.title1,
    this.title2,
    this.title3,
    this.title4,
    this.title5,
    this.title6,
    this.function,
  );

  static int index = 0;
  final TabController _controller;
  String title1;
  String title2;
  String title3;
  String title4;
  String title5;
  String title6;
  Function function;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DefaultTabController(
          initialIndex: 0,
          length: 6,
          child: SizedBox(
            height: 46.w,
            child: TabBar(
              isScrollable: true,
              controller: _controller,
              unselectedLabelColor: ColorName.gray3,
              labelColor: ColorName.button,
              onTap: (i) {
                function(i);
              },
              indicatorColor: ColorName.button,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: [
                Tab(
                  child: Text(
                    title1,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    title2,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    title3,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    title4,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    title5,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    title6,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
