import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/main_page/bloc/main_cubit.dart';
import 'package:agent/ui/pages/refund_page/refund_page.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:agent/ui/widgets/appbar_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import '../../../core/utils/assets.gen.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: Modular.get<MainCubit>(),
        builder: (context, state) {
          return Container(
            color: ColorName.background,
            child: Column(
              children: [
                AppBarMain(
                  text: 'Главная',
                  menuTab: () {
                    Modular.to.pushNamed(RefundPage.routeName);
                  },
                ),
                Container(
                  padding: EdgeInsets.all(18.w),
                  margin: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: ColorName.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Widgets.percentIndicator(
                          percent: 70,
                          inText: "Успеваемость",
                          outText: "Дневной отчёт на сегодня",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Widgets.iconButton(
                              count: 125,
                              title: "Посещено",
                            ),
                            Widgets.iconButton(
                              count: 125,
                              title: "Посещено",
                              icon: Icons.check_box_outlined,
                              color: ColorName.red,
                            ),
                          ],
                        ).paddingOnly(top: 20.w),
                        Row(
                          children: [
                            AppWidgets.textLocale(
                              localeKey: "Не синхрованно:",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorName.gray2,
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            Row(
                              children: [
                                Assets.images.icons.imageIcon.svg(),
                                AppWidgets.textLocale(
                                  localeKey: " : 2",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ColorName.black,
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                Assets.images.icons.shopping.svg(),
                                AppWidgets.textLocale(
                                  localeKey: " : 2",
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: ColorName.black,
                                ),
                              ],
                            )
                          ],
                        ).paddingSymmetric(vertical: 14.w),
                        Row(
                          children: [
                            AppWidgets.textLocale(
                              localeKey: "Последняя синхронизация:",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: ColorName.gray2,
                            ),
                            SizedBox(
                              width: 12.w,
                            ),
                            AppWidgets.text(
                              text: "31 - Авг 16:40",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorName.mainColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Widgets.showCount(
                      height: 98.w,
                      width: 162.w,
                      count: 10000000,
                      title: "Сумма заказов за сегодня",
                      color: ColorName.white,
                    ),
                    Widgets.showData(
                      count: "135",
                      title: "По объему продукции за сегодя",
                      color: ColorName.white,
                    ),
                  ],
                ).paddingSymmetric(horizontal: 20.w)
              ],
            ),
          );
        });
  }
}
