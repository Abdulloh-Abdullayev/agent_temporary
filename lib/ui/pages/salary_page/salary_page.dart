import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/salary_page/widget/plan_salary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/app_widgets.dart';
import 'widget/working_day_widget.dart';

class SalaryPageModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          SalaryPage.routeName,
          child: (context, args) => const SalaryPage(),
        )
      ];
}

class SalaryPage extends StatelessWidget {
  const SalaryPage({Key? key}) : super(key: key);
  static const String routeName = '/salaryPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //appbar
              salaryAppBar(),
              //workDay
              const WorkingDayWidget().paddingOnly(
                top: 25.w,
                left: 20.w,
                right: 20.w,
                bottom: 24.w,
              ),
              //plan
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.textLocale(
                    localeKey: "Plan",
                    fontWeight: FontWeight.w600,
                  ).paddingOnly(bottom: 12.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PlanSalaryWidget(
                        width: 162.w,
                        titleFirst: 'Сумма плана',
                        titleSecond: '100000000',
                      ),
                      PlanSalaryWidget(
                        width: 162.w,
                        titleFirst: 'Фикс. зарплата',
                        titleSecond: '100000000',
                      ),
                    ],
                  ).paddingOnly(bottom: 12.w),
                  PlanSalaryWidget(
                    width: 1.sw,
                    titleFirst: 'Сумма плана',
                    titleSecond: '100000000',
                  ),
                ],
              ).paddingSymmetric(horizontal: 20.w),
            ],
          ),
        ),
      ),
    );
  }

  Widget salaryAppBar() {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.backButton(
                () {
                  Modular.to.pop();
                },
              ),
            ],
          ),
          AppWidgets.textLocale(
            localeKey: "LocaleKeys.salary",
            fontWeight: FontWeight.w500,
            fontSize: 20.sp,
            color: Colors.white,
          ).paddingOnly(top: 20.w),
        ],
      ),
    );
  }
}
