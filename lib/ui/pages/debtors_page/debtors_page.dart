import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/debtors_page/widget/debtors_filter.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../debtors_orders_page/widget/debtors_table.dart';

class DebtorsPageModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          DebtorsPage.routeName,
          child: (context, args) => const DebtorsPage(),
        ),
      ];
}

class DebtorsPage extends StatelessWidget {
  const DebtorsPage({Key? key}) : super(key: key);
  static const String routeName = '/debtorsPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.background,
      body: SafeArea(
        child: Column(
          children: [
            balanceAppBar(context),
            buildList(),
          ],
        ),
      ),
    );
  }

  Widget buildList() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.w,
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 5.w,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const DebtorsItem().paddingOnly(bottom: 12.w);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget balanceAppBar(BuildContext context) {
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
              Row(
                children: [
                  AppWidgets.iconButton(
                          icon: Assets.images.icons.search1, onPressed: () {})
                      .paddingOnly(
                    right: 10.w,
                  ),
                  AppWidgets.iconButton(
                    icon: Assets.images.icons.filter,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => const DebtorsFilterBottomSheet(),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          AppWidgets.textLocale(
            localeKey: "Должники",
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
            color: Colors.white,
          ).paddingOnly(bottom: 20.w, top: 20.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.textLocale(
                localeKey: "Общий баланс",
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: Colors.white.withOpacity(0.6),
              ),
              AnimatedDigitWidget(
                value: 1500000,
                separateSymbol: ' ',
                separateLength: 3,
                enableSeparator: true,
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                ),
                suffix: " UZS",
              ),
            ],
          )
        ],
      ),
    );
  }
}
