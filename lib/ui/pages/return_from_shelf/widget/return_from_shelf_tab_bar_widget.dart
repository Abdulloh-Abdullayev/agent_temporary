import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.gen.dart';

class ReturnFromShelfTabBarWidget extends StatelessWidget {
  ReturnFromShelfTabBarWidget(
      this._controller,
      this.title1,
      this.title2,
      this.title3,
      this.function,
      );

  static int index = 0;
  final TabController _controller;
  String title1;
  String title2;
  String title3;
  Function function;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DefaultTabController(
          initialIndex: 0,
          length: 3,
          child: SizedBox(
              height: 46.w,
              child: TabBar(
                controller: _controller,
                unselectedLabelColor: ColorName.button,
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
                ],
              )
          ),
        ),
      ],
    );
  }
}
