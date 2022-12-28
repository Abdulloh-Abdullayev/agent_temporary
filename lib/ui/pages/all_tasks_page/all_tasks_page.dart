import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/all_tasks_page/widgets/clicked_item.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class AllTasksModule extends Module {
  @override
  List<ModularRoute> get routes =>
      [
        ChildRoute(
          AllTasksPage.routeName,
          child: (context, args) => const AllTasksPage(),
        ),
      ];
}

class AllTasksPage extends StatefulWidget {
  const AllTasksPage({Key? key}) : super(key: key);
  static const routeName = "/tasks";

  @override
  State<AllTasksPage> createState() => _AllTasksPageState();
}

class _AllTasksPageState extends State<AllTasksPage>
    with TickerProviderStateMixin {
  PageController pageController = PageController();
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: ColorName.button,
          child: Assets.images.icons.plusIcon.svg(
            width: 24.w,
            height: 24.w,
          ),
        ).paddingOnly(bottom: 140.w),
        body: Column(
          children: [
            Container(
              width: 1.sw,
              decoration: BoxDecoration(
                color: ColorName.primaryColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(12.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.backButton(() {
                    Modular.to.pop();
                  }).paddingSymmetric(
                    horizontal: 20.w,
                    vertical: 18.w,
                  ),
                  AppWidgets.textLocale(
                    localeKey: "Задачи",
                    color: ColorName.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ).paddingSymmetric(horizontal: 20.w),
                  AppTabBar(
                    tabController: tabController,
                    tabTitle: const [
                      "Активные",
                      "Выполненные",
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
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  active(ColorName.lightBlue),
                  completed(ColorName.lightBlue),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget active(Color colorContainer) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: ((context, index) {
        return InkWell(
          onTap: () {
            Modular.to.pushNamed(ClickedItem.routeName);
          },
          child: Cards.cards_15(
            name: "Osiyo market",
            dobavlen: "Добавлен",
            date: "13 окт",
            primicheniya: "Примечание:",
            product: "Кола 3 блок,Фанта 3 блок, дина...",
            vipolneniya: "Выполнение до",
            status: "Просрочено!",
            statusColor: Colors.red,
            cardColor: const Color(0xFFE5F3FF),
            card_onTap: () {
              Modular.to.pushNamed(ClickedItem.routeName);
            },
          ).paddingOnly(
            top: 15.w,
            right: 15.w,
            left: 15.w,
          ),
        );
      }),
    );
  }

  Widget completed(Color colorContainer) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: ((context, index) {
        return InkWell(
          onTap: () {
            Modular.to.pushNamed(ClickedItem.routeName);
          },
          child: Cards.cards_15(
            name: "Osiyo market",
            dobavlen: "Добавлен",
            date: "13 окт",
            primicheniya: "Примечание:",
            product: "Кола 3 блок,Фанта 3 блок, дина...",
            vipolneniya: "Выполнение до",
            status: "Выполнен",
            statusColor: Colors.green,
            cardColor: const Color(0xFFE5F3FF),
            card_onTap: () {
              Modular.to.pushNamed(ClickedItem.routeName);
            },
          ).paddingOnly(
            top: 15.w,
            right: 15.w,
            left: 15.w,
          ),
        );
      }),
    );
  }
}
