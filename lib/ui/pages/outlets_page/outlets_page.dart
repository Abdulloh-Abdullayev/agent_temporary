import 'package:agent/core/utils/app_logger_util.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/add_outlets_page/add_outlets_page.dart';
import 'package:agent/ui/pages/home/home_page.dart';
import 'package:agent/ui/pages/outlets_page/outlets_map_page.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';
import 'package:uikit/uikit.dart';

class OutletsPage extends StatelessWidget {
  const OutletsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorName.background,
      body: Stack(
        children: [
          Column(
            children: [
              outletsAppBar(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppWidgets.textLocale(localeKey: "Фильтр"),
                  DropDown(
                    items: const [
                      'dcsdvsd',
                      'sddf',
                      'dcsdfsdvsd',
                    ],
                    title: "Все категории",
                    onChange: (s) {
                      AppLoggerUtil.w("$s");
                    },
                    width: 184.w,
                  )
                ],
              ).paddingSymmetric(horizontal: 20.w, vertical: 12.w),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  itemCount: 10,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      // Modular.to.pushNamed(OutletsMapPage.routeName);
                    },
                    child: Cards.cards_11(
                      name: "name",
                      supermarket: "supermarket",
                      uzs: "uzs",
                      image:
                          "https://podrobno.uz/upload/iblock/b24/1212121212.jpg",
                      persent: "60-80",
                      summa: "2000",
                      cp: "cp",
                      card_onTap: () {},
                    ).paddingOnly(top: 12.w),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            bottom: 100,
            right: 20.w,
            child: FloatingActionButton(
              onPressed: () {
                Modular.to.pushNamed(AddOutletsPage.routeName);
              },
              backgroundColor: ColorName.buttonColor,
              child: const Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }

  Widget outletsAppBar() {
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
              InkWell(
                onTap: () {
                   HomePage.globalKey.currentState!.openDrawer();
                },
                child: Assets.images.icons.menu.svg(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AppWidgets.iconButton(
                    onPressed: () {},
                    icon: Assets.images.icons.search,
                  ),
                  AppWidgets.iconButton(
                    onPressed: () {},
                    icon: Assets.images.icons.mapLocation,
                  ).paddingOnly(left: 12.w),
                ],
              )
            ],
          ),
          AppWidgets.textLocale(
            localeKey: "Торговые точки",
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
            color: Colors.white,
          ).paddingOnly(top: 20.w, bottom: 18.w),
          AppSelectTabBar(
            tabs: const [
              'Все',
              'ПН',
              'ВТ',
              'СР',
              'ЧТ',
              'ПТ',
              'СБ',
              'ВС',
            ],
            onTap: () {},
          )
        ],
      ),
    );
  }
}
