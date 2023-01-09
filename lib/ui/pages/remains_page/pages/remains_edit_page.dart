import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/remains_page/widgets/remains_page_widgets.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RemainsEditPageModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          RemainsEditPage.routeName,
          child: (context, args) => const RemainsEditPage(),
        ),
      ];

  // @override
  // List<Bind<Object>> get binds => [
  //       Bind<AppNavigationBloc>(
  //         (i) => AppNavigationBloc(),
  //         onDispose: (value) => value.close(),
  //       ),
  //     ];
}

class RemainsEditPage extends StatefulWidget {
  static const String routeName = "/remains-edit-page";
  const RemainsEditPage({super.key});

  @override
  State<RemainsEditPage> createState() => _RemainsEditPageState();
}

class _RemainsEditPageState extends State<RemainsEditPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: ColorName.background,
      body: Column(
        children: [
          Stack(
            children: [
              RemainsPageWidgets.remainsEditAppBar(
                title: LocaleKeys.remains.tr(),
                ontap: (key) {},
                context: context,
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 18,
                  ),
                  width: 1.sw,
                  height: 101.w,
                  decoration: BoxDecoration(
                    color: ColorName.input,
                    border: Border.all(color: ColorName.button),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppWidgets.textLocale(
                          localeKey: "20",
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        AppWidgets.textLocale(
                          localeKey: LocaleKeys.total_number_of_products,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  alignment: Alignment.centerLeft,
                  child: AppWidgets.textLocale(
                    localeKey: "Напитки",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                remainsItemWidget(),
              ],
            ).paddingOnly(left: 20, right: 20),
          ),
        ],
      ),
    ));
  }

  Widget remainsItemWidget() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      height: 200.h,
      width: 1.sw,
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Container(
            height: 39.w,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: ColorName.input,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppWidgets.textLocale(
                    localeKey: LocaleKeys.product, fontSize: 12, color: ColorName.gray2),
                AppWidgets.textLocale(
                    localeKey: LocaleKeys.qty,
                    fontSize: 12,
                    color: ColorName.gray2),
              ],
            ),
          ),
          Container(
            height: 1.w,
            width: 1.sw,
            color: ColorName.gray,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        height: 39.w,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          color: ColorName.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppWidgets.textLocale(localeKey: "Coca cola"),
                            AppWidgets.textLocale(localeKey: "5"),
                          ],
                        ),
                      ),
                      Container(
                        height: 1.w,
                        width: 1.sw,
                        color: ColorName.gray,
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
