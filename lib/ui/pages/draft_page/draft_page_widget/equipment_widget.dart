import 'package:agent/core/extensions/app_extensions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.gen.dart';
import '../../../widgets/app_widgets.dart';

class EquipmentWidget extends StatelessWidget {
  const EquipmentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: AppWidgets.textLocale(
              localeKey: "Оборудование",
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              color: ColorName.black,
              isRichText: true
          ),
        ).marginOnly(bottom: 12.w),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.only(bottom: 10.w),
              width: double.infinity,
              height: 118.w,
              decoration: BoxDecoration(
                color: ColorName.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppWidgets.textLocale(
                          localeKey: "Osiyo market",
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: ColorName.black,
                          isRichText: true
                      ),
                    ).marginOnly(bottom: 8.w),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            height: 67,
                            width: 72,
                            child: CachedNetworkImage(
                              imageUrl: "https://www.sciencealert.com/images/2022/08/RidiculouslyDetailedMoonPictureInFull-642x642.jpeg",
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                              const CupertinoActivityIndicator(),
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                            ),
                          ),
                        ),

                        SizedBox(width: 12,),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppWidgets.textLocale(
                                localeKey: "Artel холодильник",
                                fontWeight: FontWeight.w600,
                                color: ColorName.black,
                                fontSize: 16.sp,
                                isRichText: true
                            ),
                            SizedBox(height: 8,),
                            Row(
                              children: [
                                AppWidgets.textLocale(
                                    localeKey: "Тип: Холодильник",
                                    fontWeight: FontWeight.w400,
                                    color: ColorName.gray2,
                                    fontSize: 12.sp,
                                    isRichText: true
                                ).paddingOnly(right: 8.w),
                                AppWidgets.textLocale(
                                    localeKey: "Черновик",
                                    fontWeight: FontWeight.w400,
                                    color: ColorName.red,
                                    fontSize: 12.sp,
                                    isRichText: true
                                ),

                              ],
                            ),
                            SizedBox(height: 8,),
                            Row(
                              children: [
                                AppWidgets.textLocale(
                                    localeKey: "Дата прикрепления ",
                                    fontWeight: FontWeight.w400,
                                    color: ColorName.gray2,
                                    fontSize: 12.sp,
                                    isRichText: true
                                ),
                                AppWidgets.textLocale(
                                    localeKey: "12.10.2022",
                                    fontWeight: FontWeight.w600,
                                    color: ColorName.black,
                                    fontSize: 12.sp,
                                    isRichText: true
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
