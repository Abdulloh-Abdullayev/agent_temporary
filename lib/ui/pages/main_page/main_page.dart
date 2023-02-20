import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/home/home_page.dart';
import 'package:agent/ui/pages/main_page/bloc/main_cubit.dart';
import 'package:agent/ui/pages/main_page/widgets/orders_widget.dart';
import 'package:agent/ui/pages/main_page/widgets/others_widget.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:agent/ui/widgets/appbar_main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import '../../../core/localization/locale_keys.g.dart';
import '../../../core/utils/assets.gen.dart';
import 'widgets/tabbar_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: Modular.get<MainCubit>(),
      builder: (context, state) {
        return Stack(
          children: [
            Container(
              color: ColorName.background,
              child: Column(
                children: [
                  AppBarMain(
                    text: LocaleKeys.main.tr(),
                    menuTab: () {
                      HomePage.globalKey.currentState!.openDrawer();
                    },
                    locationTab: () {
                      //
                    },
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 70.w),
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(18.w),
                            margin: EdgeInsets.all(20.w),
                            decoration: BoxDecoration(
                              color: ColorName.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Widgets.percentIndicator(
                                  percent: 70,
                                  inText: LocaleKeys.performance.tr(),
                                  outText: LocaleKeys.daily_report.tr(),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap:(){
                                        showAlertDialog(context);
                                      },
                                      child: Widgets.iconButton(
                                        height: 67.w,
                                        width: 144.w,
                                        count: 125,
                                        title: LocaleKeys.visited.tr(),
                                      ),
                                    ),
                                    Widgets.iconButton(
                                      height: 67.w,
                                      width: 144.w,
                                      count: 125,
                                      title: LocaleKeys.left.tr(),
                                      icon: Icons.check_box_outlined,
                                      color: ColorName.red,
                                    ),
                                  ],
                                ).paddingOnly(top: 20.w),
                                Row(
                                  children: [
                                    AppWidgets.textLocale(
                                      localeKey: LocaleKeys.out_of_sync,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorName.gray2,
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Row(
                                      children: [
                                        Assets.images.icons.imageIcon.svg(),
                                        AppWidgets.textLocale(
                                          localeKey: " : 2",
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: ColorName.black,
                                        ),
                                        SizedBox(
                                          width: 20.w,
                                        ),
                                        Assets.images.icons.shopping.svg(),
                                        AppWidgets.textLocale(
                                          localeKey: " : 2",
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                          color: ColorName.black,
                                        ),
                                      ],
                                    )
                                  ],
                                ).paddingSymmetric(vertical: 14.w),
                                Row(
                                  children: [
                                    AppWidgets.textLocale(
                                      localeKey: LocaleKeys.last_sync,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: ColorName.gray2,
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    AppWidgets.text(
                                      text: "31 - Авг 16:40",
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: ColorName.mainColor,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Widgets.showCount(
                                height: 98.w,
                                width: 162.w,
                                count: 10000000,
                                title: LocaleKeys.amount_of_orders_today.tr(),
                                color: ColorName.white,
                              ),
                              Widgets.showData(
                                height: 98.w,
                                width: 162.w,
                                count: "135",
                                title: LocaleKeys.today_production_volume.tr(),
                                color: ColorName.white,
                              ),
                            ],
                          ).paddingSymmetric(horizontal: 20.w),
                          TabBarWidget(
                            _tabController,
                            LocaleKeys.orders.tr(),
                            LocaleKeys.other_.tr(),
                            (int i) {},
                          ).paddingSymmetric(horizontal: 20.w, vertical: 15.w),
                          Container(
                            child: [
                              OrdersWidget(),
                              OthersWidget()
                            ][_tabController.index],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 180,
              right: 20,
              child: FloatingActionButton(
                onPressed: () async {
                  // SyncBloc.to.add(SyncLoaded(dbName: 'db2'));
                },
                backgroundColor: ColorName.mainColor,
                child: Text('2'),
                heroTag: "2",
              ),
            )
          ],
        );
      },
    );
  }
}

Future<void> showAlertDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        content: SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Assets.images.icons.pin.svg(),
                        SizedBox(
                          width: 10.w,
                        ),
                        AppWidgets.textLocale(
                          localeKey: "По маршруту ",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorName.gray2,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        AppWidgets.textLocale(
                          localeKey: "100",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorName.button,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 18.w,
                    ),
                    Row(
                      children: [
                        Assets.images.icons.pinLeft.svg(),
                        SizedBox(
                          width: 10.w,
                        ),
                        AppWidgets.textLocale(
                          localeKey: "По маршруту ",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: ColorName.gray2,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        AppWidgets.textLocale(
                          localeKey: "100",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorName.button,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.highlight_remove_outlined,color: ColorName.red,)
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}