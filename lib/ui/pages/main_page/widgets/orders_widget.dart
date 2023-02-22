import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/main_page/bloc/main_cubit.dart';
import 'package:agent/ui/pages/return_from_shelf/return_from_shelf.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:super_rich_text/super_rich_text.dart';
import 'package:uikit/uikit.dart';

import '../../../widgets/app_widgets.dart';

class OrdersWidget extends StatefulWidget {
  const OrdersWidget({Key? key}) : super(key: key);

  @override
  State<OrdersWidget> createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends State<OrdersWidget>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(
      length: 5,
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
        return Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: ColorName.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    AppWidgets.text(
                      text: "//*// ${LocaleKeys.out_sync_orders.tr()}",
                      isRichText: true,
                      color: ColorName.gray3,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      othersMarkers: [
                        MarkerText(
                          marker: "//",
                          style: TextStyle(
                            color: ColorName.red,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ).paddingOnly(left: 18.w, top: 15.w),
                  ],
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: ColorName.gray,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                    TabBar(
                      controller: _tabController,
                      enableFeedback: true,
                      labelColor: ColorName.button,
                      unselectedLabelColor: ColorName.gray3,
                      unselectedLabelStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      labelStyle: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      tabs: List.generate(
                        5,
                        (index) => Text(
                          "Osiyo M",
                        ),
                      ),
                      onTap: (index) {},
                      isScrollable: true,
                      indicatorWeight: 3,
                      indicatorColor: ColorName.button,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: EdgeInsets.only(
                        right: 10.w,
                        left: 10.w,
                      ),
                      labelPadding:
                          EdgeInsets.only(right: 10.w, left: 10.w, bottom: 2),
                    )
                  ],
                ).paddingOnly(
                  top: 8,
                  bottom: 17.w,
                ),
                Column(
                  children: List.generate(
                    9,
                    (index) {
                      return Cards.cards_1(
                        height: 90.w,
                        context: context,
                        width: 1.sw,
                        name: "name",
                        time: "17:18",
                        spot: LocaleKeys.spot.tr(),
                        noBonus: LocaleKeys.no_bonus.tr(),
                        volume: LocaleKeys.volume.tr(),
                        volumeNumber: "15",
                        count: LocaleKeys.qty.tr(),
                        countNumber: '15',
                        summa: LocaleKeys.amount.tr(),
                        summaNumber: "150 000 000",
                        card_onTap: () {
                          Modular.to.pushNamed(ReturnFromShelf.routeName);
                        },
                      ).paddingOnly(
                        left: 18.w,
                        right: 18.w,
                        bottom: 10.w,
                      );
                    },
                  ),
                )
              ],
            ),
        );
      },
    );
  }
}
