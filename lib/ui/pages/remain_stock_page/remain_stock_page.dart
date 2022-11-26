import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import 'bloc/remain_stock_cubit.dart';
import 'widget/main_warehouse.dart';

class RemainStockPageModel extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          RemainStockPage.routeName,
          child: (context, args) => RemainStockPage(),
        ),
      ];

  @override
  List<Bind> get binds => [
        Bind<RemainStockCubit>(
          (i) => RemainStockCubit(),
        ),
      ];
}

class RemainStockPage extends StatefulWidget {
  RemainStockPage({Key? key}) : super(key: key);
  static const String routeName = '/remainStockPage';

  @override
  State<RemainStockPage> createState() => _RemainStockPageState();
}

class _RemainStockPageState extends State<RemainStockPage> with TickerProviderStateMixin {
  PageController pageController = PageController();
  late TabController tabController;
  @override
  void initState() {
    tabController=TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: ColorName.background,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
                      AppWidgets.iconButton(
                        onPressed: () {},
                        icon: Assets.images.icons.searchActive,
                      ),
                    ],
                  ),
                  AppWidgets.textLocale(
                    localeKey: LocaleKeys.remain_stock,
                    fontWeight: FontWeight.w600,
                    fontSize: 24.sp,
                    color: Colors.white,
                  ).paddingOnly(top: 20.w),
                  AppTabBar(
                    tabController: tabController,
                    tabTitle: [
                      LocaleKeys.main_warehouse.tr(),
                      LocaleKeys.stock.tr()
                    ],
                    onTap: (i) {
                      pageController.animateToPage(
                        i,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.linear,
                      );
                    },
                  ),
                ],
              ),
            ).paddingOnly(bottom: 18.h),
            Expanded(
              flex: 5,
              child: TabBarView(
                controller: tabController,
                children: [
                  const MainWarehouse(),
                  Container(
                    color: Colors.red,
                    child: Text("Omborxona Zaxirasi"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
