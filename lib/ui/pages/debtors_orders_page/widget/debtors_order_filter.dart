import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/debtors_orders_page/widget/filter_debtors_item/bloc/debtors_bloc.dart';
import 'package:agent/ui/pages/debtors_page/widget/deptors_history.dart';
import 'package:agent/ui/widgets/app_text_field.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'filter_debtors_item/bloc/debtors_event.dart';
import 'filter_debtors_item/bloc/debtors_state.dart';
import 'filter_debtors_item/filter_debtors_widget.dart';

class DebtorsOrderFilterBottomSheet extends StatelessWidget {
  DebtorsOrderFilterBottomSheet({
    Key? key,
  }) : super(key: key);
  final ScrollController controllerRegion = ScrollController();
  var cubit = DebtorsBloc.to;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DebtorsBloc, DebtorsState>(
      bloc: cubit,
      builder: (context, state) {
        return Container(
          height: 550.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(12.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(context),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppWidgets.textLocale(
                            localeKey: "Фильтр",
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: AppWidgets.textLocale(
                              localeKey: "Сброс фильтра",
                              color: ColorName.red,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppWidgets.textLocale(
                            localeKey: "Выберите дату",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorName.gray3,
                          ),
                          AppWidgets.textLocale(
                            localeKey: "Текущий месяц",
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: ColorName.button,
                          ),
                        ],
                      ).paddingOnly(
                        top: 15.w,
                        bottom: 10.w,
                      ),
                      AppTextField(
                        enabled: false,
                        hintText: "Выбрать",
                        onChanged: (v) {},
                        title: "",
                        hasTitle: false,
                        height: 40.w,
                      ),
                      AppWidgets.textLocale(
                        localeKey: "Выберите территорию",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorName.gray3,
                      ).paddingOnly(top: 24.w, bottom: 12.w),
                      FilterDebtorsWidget(
                        openApp: state.openRegion,
                        controller: controllerRegion,
                        openTap: () {
                          cubit.add(FilterOpenRegion(state.openRegion));
                        },
                        isAllSelected: state.isAllSelectedRegion,
                        listModel: state.regionFilterList,
                      ),
                      AppWidgets.textLocale(
                        localeKey: "Дни посещения",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorName.gray3,
                      ).paddingOnly(top: 5.w, bottom: 12.w),
                      FilterDebtorsWidget(
                        openApp: false,
                        controller: controllerRegion,
                        openTap: () {
                          cubit.add(FilterOpenRegion(state.openRegion));
                        },
                        isAllSelected: state.isAllSelectedRegion,
                        listModel: state.regionFilterList,
                      ),
                      AppWidgets.textLocale(
                        localeKey: "Тип цены",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: ColorName.gray3,
                      ).paddingOnly(top: 5.w, bottom: 12.w),
                      FilterDebtorsWidget(
                        openApp: false,
                        controller: controllerRegion,
                        openTap: () {
                          cubit.add(FilterOpenRegion(state.openRegion));
                        },
                        isAllSelected: state.isAllSelectedRegion,
                        listModel: state.regionFilterList,
                      ),
                    ],
                  ),
                ),
              ),
              AppWidgets.appButton(
                title: "Применить",
                onTap: () {
                  Modular.to.pushNamed(DebtorsHistory.routeName);
                },
              ).paddingSymmetric(horizontal: 20.w, vertical: 23.w)
            ],
          ),
        );
      },
    );
  }

  Widget buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: ColorName.white,
        ),
        const Icon(
          Icons.keyboard_arrow_down_outlined,
          color: ColorName.gray2,
        ),
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Assets.images.icons.remove.svg(),
        ),
      ],
    ).paddingSymmetric(horizontal: 23.w, vertical: 10.w);
  }
}
