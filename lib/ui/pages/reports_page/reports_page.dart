import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/home/home_page.dart';
import 'package:agent/ui/pages/reports_page/widgets/reports_filter_bottomsheet.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';
import 'package:uikit/uikit.dart';

import 'widgets/sales_table_widget.dart';
import 'widgets/table_fact_widget.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: ColorName.primaryColor,
            shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(12.r),
              ),
            ),
            automaticallyImplyLeading: false,
            leadingWidth: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    HomePage.globalKey.currentState!.openDrawer();
                  },
                  child: Assets.images.icons.menu.svg(),
                ),
                AppWidgets.iconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (context) => const ReportsFilterBottomSheet(),
                    );
                  },
                  icon: Assets.images.icons.filtrIcon,
                )
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: reportsAppBar(context),
              collapseMode: CollapseMode.none,
            ),
            pinned: true,
            expandedHeight: 258,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    dataPanel(),
                    planFactBuild(),
                    const TableFact().paddingOnly(top: 16.w),
                    const SalesTableWidget()
                  ],
                ).paddingSymmetric(horizontal: 20.w,vertical: 20.w)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget planFactBuild() {
    return Column(
      children: [
        AppWidgets.textLocale(
          localeKey: "План факт прогноз",
          fontWeight: FontWeight.w500,
          fontSize: 20.sp,
        ).paddingOnly(top: 24.w, bottom: 16.w),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Widgets.showData(
              width: 104.w,
              count: "143%",
              title: "Факт",
              color: ColorName.white,
            ),
            const SizedBox(width: 8),
            Widgets.showData(
              width: 104.w,
              count: "143%",
              title: "Прогноз",
              color: ColorName.white,
            ),
          ],
        ),
      ],
    );
  }

  Widget dataPanel() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Widgets.showCount(
                count: 120000,
                title: "Общая сумма",
                withOpacity: 0.1,
                color: ColorName.green2,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Widgets.showCount(
                count: 120000,
                title: "АКБ",
                color: ColorName.blue,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Widgets.showCount(
                count: 120000,
                title: "Общее кол-во ",
                withOpacity: 0.1,
                color: ColorName.green2,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Widgets.showCount(
                count: 120000,
                title: "Общий обьем",
                color: ColorName.blue,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget reportsAppBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorName.primaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppWidgets.textLocale(
            localeKey: "Отчёты",
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
            color: Colors.white,
          ).paddingOnly(top: 30.w, bottom: 18.w),
          AppInputDate(
            firstText: "Выберите дату",
            dropDownText: "Текущий месяц >",
            firstDate: "С",
            secondDate: "По",
            dateBackColor: ColorName.gray.withOpacity(0.15),
            firstIcon: Assets.images.icons.calendarIcon.svg(),
            secondIcon: Assets.images.icons.calendarIcon.svg(),
            firstDateTextStyle: const TextStyle(color: Colors.white),
            secondDateTextStyle: const TextStyle(color: Colors.white),
            firstDateOnTap: () {
              showDialog(
                context: context,
                builder: (context) => DateTimeDialog(
                  title: 'Выбрать',
                  closeTitle: 'Закрыть',
                  addTitle: 'Добавить',
                  addTap: (DateTime time) {
                    // print("time");
                  },
                ),
              );
            },
            dropDownOnTap: () {

            },
            SecondDateOnTap: () {
              showDialog(
                context: context,
                builder: (context) => DateTimeDialog(
                  title: 'Выбрать',
                  closeTitle: 'Закрыть',
                  addTitle: 'Добавить',
                  addTap: (DateTime time) {
                    // print("time");
                  },
                ),
              );
            },
            iconColor: Colors.white,
          ),
          AppButton(
            text: "Применить",
            onPressed: () {},
            width: 1.sw,
            textColor: Colors.white,
            color: ColorName.buttonColor,
          ).paddingOnly(top: 18.w)
        ],
      ),
    );
  }
}
