import 'package:agent/core/extensions/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_rich_text/super_rich_text.dart';

import '../../../../core/localization/locale_keys.g.dart';
import '../../../../core/utils/colors.gen.dart';
import '../../../widgets/app_widgets.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: AppWidgets.textLocale(
            localeKey: LocaleKeys.orders,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            color: ColorName.black,
          ),
        ).marginOnly(bottom: 12.w),
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 2,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 10.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorName.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: ColorName.gray),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 12.w,
                  bottom: 9.w,
                  left: 12.w,
                  right: 12.w,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppWidgets.textLocale(
                        localeKey: "Osiyo market",
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: ColorName.black,
                      ),
                    ).marginOnly(bottom: 8.w),
                    Row(
                      children: [
                        Row(
                          children: [
                            AppWidgets.textLocale(
                              localeKey: LocaleKeys.draft_at,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorName.black,
                              othersMarkers: [
                                MarkerText(
                                  marker: "//",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: ColorName.red,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            AppWidgets.textLocale(
                              localeKey: "17:18",
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: ColorName.black,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.w,
                    ),
                    Row(
                      children: [
                        AppWidgets.textLocale(
                          localeKey: LocaleKeys.spot,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: ColorName.gray3,
                        ),
                        SizedBox(
                          width: 17.w,
                        ),
                        AppWidgets.textLocale(
                          localeKey: LocaleKeys.no_bonus,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: ColorName.gray3,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                AppWidgets.textLocale(
                                  localeKey: LocaleKeys.volume,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: ColorName.gray2,
                                ),
                                AppWidgets.textLocale(
                                  localeKey: "15",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: ColorName.gray2,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Row(
                              children: [
                                AppWidgets.textLocale(
                                  localeKey: LocaleKeys.qty,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: ColorName.gray2,
                                ),
                                AppWidgets.textLocale(
                                  localeKey: "15",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: ColorName.black,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AppWidgets.textLocale(
                              localeKey: LocaleKeys.amount,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: ColorName.gray2,
                            ),
                            AppWidgets.textLocale(
                              localeKey: "150 000 000",
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: ColorName.button,
                            ),
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
