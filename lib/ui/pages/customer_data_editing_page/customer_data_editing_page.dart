import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/customer_data_editing_page/widgets/bottom_buttons_widget.dart';
import 'package:agent/ui/pages/order_page/order_page_widget/order_appbar_icon_widget.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import 'bloc/customer_data_editing_cubit.dart';

class CustomerDataEditingPageModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<CustomerDataEditingCubit>(
          (i) => CustomerDataEditingCubit(),
          onDispose: (v) => v.close(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          CustomerDataEditingPage.routeName,
          child: (context, args) => const CustomerDataEditingPage(),
        ),
      ];
}

class CustomerDataEditingPage extends StatefulWidget {
  const CustomerDataEditingPage({Key? key}) : super(key: key);
  static const String routeName = "/CustomerDataEditingPage";

  @override
  State<CustomerDataEditingPage> createState() =>
      _CustomerDataEditingPageState();
}

class _CustomerDataEditingPageState extends State<CustomerDataEditingPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerDataEditingCubit, CustomerDataEditingState>(
      bloc: Modular.get<CustomerDataEditingCubit>(),
      builder: (context, state) {
        return buildStack(context);
      },
    );
  }

  Widget buildStack(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                      ),
                      color: ColorName.primaryColor),
                  height: 139.w,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppBarIcon.backButton(() {
                            Modular.to.pop();
                          }),
                          Row(
                            children: [
                              AppBarIcon.searchButton(() {}),
                              const SizedBox(
                                width: 12,
                              ),
                              AppBarIcon.filterButton(() {})
                            ],
                          )
                        ],
                      ).paddingOnly(
                        left: 20.w,
                        right: 20.w,
                        top: 19.w,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: AppWidgets.textLocale(
                                localeKey: "Редактрирование заказа",
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600,
                                color: ColorName.white,
                                isRichText: true)
                            .paddingOnly(top: 18.w, left: 20),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                        margin: EdgeInsets.only(top: 24.w),
                        color: ColorName.white,
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ExpansionTile(
                                  collapsedTextColor: ColorName.black,
                                  title: AppWidgets.textLocale(
                                      localeKey: "Напитки",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: ColorName.black,
                                      isRichText: true),
                                  children: [
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: 4,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.only(
                                            top: 12.w,
                                            bottom: 12.w,
                                            left: 13.w,
                                            right: 13.w,
                                          ),
                                          child: Cards.cards_7(
                                            context: context,
                                            name: "name",
                                            nalichi: "nalichi",
                                            nalichiNumber: "20",
                                            summa: "summa",
                                            summaNumber: "100 000",
                                            blok: "blok",
                                            blokNumber: "1",
                                            sht: "sht",
                                            shtNumber: "2",
                                            image:
                                                "https://www.sciencealert.com/images/2022/08/RidiculouslyDetailedMoonPictureInFull-642x642.jpeg",
                                            blokRemove: () {},
                                            blokAdd: () {},
                                            shtRemove: () {},
                                            shtAdd: () {},
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                                Container(
                                  color: ColorName.gray.withOpacity(0.1),
                                  height: 12.w,
                                )
                              ],
                            );
                          },
                        )).paddingOnly(bottom: 150.w),
                  ),
                )
              ],
            ),
          ),
        ),
        const BottomButtonsWidget(),
      ],
    );
  }
}
