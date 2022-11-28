import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/models/return_order_model.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/return_from_shelf/bloc/return_order_cubit.dart';
import 'package:agent/ui/pages/return_from_shelf/bloc/return_order_state.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import 'widget/app_bar_icon_return.dart';
import 'widget/bottom_buttons_shelf_widget.dart';

class ReturnOrderDatePageModule extends Module {
  @override
  List<Bind> get binds =>
      [
        Bind<ReturnOrderCubit>(
              (i) =>
          ReturnOrderCubit()
            ..load(),
        ),
      ];

  @override
  List<ModularRoute> get routes =>
      [
        ChildRoute(
          ReturnOrderDatePage.routeName,
          child: (context, args) => const ReturnOrderDatePage(),
        ),
      ];
}

class ReturnOrderDatePage extends StatefulWidget {
  const ReturnOrderDatePage({Key? key}) : super(key: key);
  static const String routeName = "/returnOrderDatePage";

  @override
  State<ReturnOrderDatePage> createState() => _ReturnOrderDatePageState();
}

class _ReturnOrderDatePageState extends State<ReturnOrderDatePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReturnOrderCubit, ReturnOrderState>(
      bloc: ReturnOrderCubit.to,
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                            color: ColorName.primaryColor),
                        height: 139.h,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppBarIconReturn.backButtonShelf(() {
                                  Modular.to.pop();
                                }),
                                Row(
                                  children: [
                                    AppBarIconReturn.searchButtonShelf(() {}),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    AppBarIconReturn.filterButtonShelf(() {}),
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
                                  localeKey: "Возврат заказа",
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  color: ColorName.white,
                                  isRichText: true)
                                  .paddingOnly(top: 18.w, left: 20),
                            )
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 24.w),
                          color: ColorName.white,
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.list.length,
                            itemBuilder: (context, index) {
                              return ItemOrderWidget(
                                returnOrderModel: state.list[index],
                                index: index,
                              );
                            },
                          )).paddingOnly(bottom: 150.w)
                    ],
                  ),
                ),
              ),
            ),
            const BottomButtonsShelfWidget(),
          ],
        );
      },
    );
  }
}

class ItemOrderWidget extends StatelessWidget {
  const ItemOrderWidget({
    Key? key,
    required this.returnOrderModel,
    required this.index,
  }) : super(key: key);
  final ReturnOrderCategoryModel returnOrderModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ExpansionTile(
          collapsedTextColor: ColorName.black,
          title: AppWidgets.textLocale(
              localeKey: returnOrderModel.name!,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: ColorName.black,
              isRichText: true),
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: returnOrderModel.list!.length,
              itemBuilder: (context, index) {
                var model = returnOrderModel.list![index];
                return Container(
                  margin: EdgeInsets.only(
                    top: 12.w,
                    left: 13.w,
                    right: 13.w,
                  ),
                  child: Cards.cards_8(
                    name: model.name!,
                    summa: "Summa",
                    summaNumber: (ReturnOrderCubit.to.summa(model) * 10000)
                        .toString(),
                    blok: "Bloc",
                    blokNumber: model.blog.toString(),
                    sht: "Sht",
                    shtNumber: model.count.toString(),
                    image: model.img!,
                    blokRemove: () {
                      ReturnOrderCubit.to
                          .decrement(returnOrderModel.id!, model.id!);
                    },
                    blokAdd: () {
                      ReturnOrderCubit.to
                          .increment(returnOrderModel.id!, model.id!);
                    },
                    shtRemove: () {
                      ReturnOrderCubit.to
                          .decrementSht(returnOrderModel.id!, model.id!);
                    },
                    shtAdd: () {
                      ReturnOrderCubit.to
                          .incrementSht(returnOrderModel.id!, model.id!);
                    },
                    icon: Assets.images.icons.clock.svg(),
                    context: context,
                  ),
                );
              },
            ).paddingOnly(
              bottom: 12.w,
            ),
          ],
        ),
        Container(
          color: ColorName.gray.withOpacity(0.1),
          height: 12.w,
        )
      ],
    );
  }
}
