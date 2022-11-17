import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/assets.gen.dart';

class SelectPhotoDialaog extends StatelessWidget {
  const SelectPhotoDialaog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AppWidgets.textLocale(
                        localeKey: "Выберите тип фото",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        isRichText: true
                    ),
                  ).paddingOnly(bottom: 4.w),
                ),
                InkWell(
                  onTap: (){
                    Modular.to.pop();
                  },
                  child: Assets.images.icons.xIcon.svg(
                      fit: BoxFit.cover
                  )
                )
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context,index){
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppWidgets.textLocale(
                          localeKey: "Lorem Ipsum",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          isRichText: true
                      ),
                    ).paddingOnly(bottom: 14.w,top: 14.w),
                    Divider()
                  ],
                );
              },
            )
          ],
        ).paddingAll(24.w),
      ),
    );
  }
}
