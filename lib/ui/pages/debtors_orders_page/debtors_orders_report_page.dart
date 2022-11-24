import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';
import 'package:uikit/uikit.dart';

import '../reports_page/widgets/reports_filter_bottomsheet.dart';

class DebtorsOrdersReportPageModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      DebtorsOrdersReportPage.routeName,
      child: (context, args) => const DebtorsOrdersReportPage(),
    ),
  ];

}

class DebtorsOrdersReportPage extends StatelessWidget {
  const DebtorsOrdersReportPage({Key? key}) : super(key: key);
  static const String routeName="/debtorsOrdersReportPage";

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
                AppWidgets.backButton(
                      () {
                    Modular.to.pop();
                  },
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

                  ],
                )
              ],
            ),
          ),
        ],
      ),
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
            localeKey: "Osiyo market",
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
            color: Colors.white,
          ).paddingOnly(top: 50.w, bottom: 18.w),
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