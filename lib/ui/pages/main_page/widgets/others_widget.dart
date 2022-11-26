import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/helpers/app_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.gen.dart';
import '../../../widgets/app_widgets.dart';

class OthersWidget extends StatelessWidget {
  const OthersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OtherItem1(),
        SizedBox(height: 12.h,),
        OtherItem2(),
      ],
    );
  }
}

class OtherItem1 extends StatelessWidget {
  const OtherItem1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppWidgets.text(
            text: "Проданные товары",
            color: ColorName.gray3,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ).paddingAll(12),
          const Divider(
            height: 1,
            color: ColorName.gray,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.text(
                      text: "Товар  ",
                      color: ColorName.gray2,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    AppWidgets.text(
                      text: "Кол-во",
                      color: ColorName.gray2,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppWidgets.text(
                      text: "Объем",
                      color: ColorName.gray2,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    AppWidgets.text(
                      text: "Сумма",
                      color: ColorName.gray2,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ],
          ).paddingAll(12),
          Column(
            children: List.generate(
              5,
              (index) => Column(
                children: [
                  const Divider(
                    height: 1,
                    color: ColorName.gray,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppWidgets.text(
                              text: "Coca cola 1",
                              color: ColorName.gray2,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            AppWidgets.text(
                              text: "12",
                              color: ColorName.gray2,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppWidgets.text(
                              text: "12",
                              color: ColorName.gray2,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            AppWidgets.text(
                              text: "${AppHelper.numFormat("1000000")} UZS",
                              color: ColorName.gray2,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ).paddingAll(12),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class OtherItem2 extends StatelessWidget {
  const OtherItem2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppWidgets.text(
            text: "Посещенные клиенты",
            color: ColorName.gray3,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ).paddingAll(12),
          const Divider(
            height: 1,
            color: ColorName.gray,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.text(
                text: "Название",
                color: ColorName.gray2,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
              AppWidgets.text(
                text: "Кол-во",
                color: ColorName.gray2,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
              AppWidgets.text(
                text: "Сумма",
                color: ColorName.gray2,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ],
          ).paddingAll(12),
          Column(
            children: List.generate(
              5,
              (index) => Column(
                children: [
                  const Divider(
                    height: 1,
                    color: ColorName.gray,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppWidgets.text(
                        text: "Osiyo market",
                        color: ColorName.gray2,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      AppWidgets.text(
                        text: "12",
                        color: ColorName.gray2,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      AppWidgets.text(
                        text: "${AppHelper.numFormat("1000000")} UZS",
                        color: ColorName.gray2,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ).paddingAll(12),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
