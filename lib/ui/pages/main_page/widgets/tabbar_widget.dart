import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.gen.dart';


class TabBarWidget extends StatelessWidget {
  TabBarWidget(this._controller,this.title1,this.title2,this.function);
 static int index = 0;
  TabController _controller;
  String title1;
  String title2;
  Function function;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: ColorName.white,
              borderRadius: BorderRadius.circular(50.r)),
          alignment: Alignment.center,
          child: DefaultTabController(
            initialIndex: 0,
            length: 2,
            child: Container(
              height: 46.w,
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.symmetric(
                horizontal: 3.w,
              ),
              decoration: BoxDecoration(
                  color: ColorName.white,
                  borderRadius: BorderRadius.circular(50.r),

              ),
              child: TabBar(
                controller: _controller,
                unselectedLabelColor: ColorName.gray3,
                labelColor: ColorName.white,
                onTap: (i) {
                  function(i);

                },
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  color: ColorName.button,
                ),
                tabs: [
                  Tab(
                    child: Text(
                      title1,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                     title2,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
