import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/debtors_page/widget/debtors_filter.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:animated_digit/animated_digit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

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
                return InkWell(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                  height: 40,
                                  width: 40,
                                  child: CachedNetworkImage(
                                    imageUrl: "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_960_720.jpg",
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) =>
                                    const CupertinoActivityIndicator(),
                                    errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                  ),
                                ),
                              ).paddingOnly(right: 12.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppWidgets.textLocale(
                                      localeKey: "Osiyo market",
                                      fontWeight: FontWeight.w400,
                                      color: ColorName.black,
                                      fontSize: 16
                                  ).paddingOnly(bottom: 4.w),
                                  Row(
                                    children: [
                                      AppWidgets.textLocale(
                                          localeKey: "Balance:",
                                          fontWeight: FontWeight.w400,
                                          color: ColorName.black,
                                          fontSize: 12
                                      ),
                                      false?AppWidgets.textLocale(
                                          localeKey: "+ ${"100 000 000"} USZ",
                                          fontWeight: FontWeight.w400,
                                          color: ColorName.green,
                                          fontSize: 12,
                                      ):AppWidgets.textLocale(
                                          localeKey: " 0",
                                          fontWeight: FontWeight.w400,
                                          color: ColorName.red,
                                          fontSize: 12,
                                      ),
                                    ],
                                  )
                                ],
                              ),

                            ],
                          ),
                          SizedBox(height: 11,),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Assets.images.icons.calendarIcon.svg(color: ColorName.gray, height: 13.w),
                                  AppWidgets.textLocale(
                                      localeKey: "20.10.2022",
                                      fontWeight: FontWeight.w400,
                                      color: ColorName.black,
                                      fontSize: 12.sp
                                  ).paddingOnly(left: 8.w),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ).paddingOnly(bottom: 12.w);
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
