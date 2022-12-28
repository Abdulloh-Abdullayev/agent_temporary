import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import 'bloc/add_order_cubit.dart';
import 'bloc/add_order_state.dart';
import 'widget/app_bar_icon_add_order.dart';
import 'widget/bottom_buttons_add_order_widget.dart';
import 'widget/item_add_order_widget.dart';

class AddOrderPageModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<AddOrderCubit>(
          (i) => AddOrderCubit()..load(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          AddOrderPage.routeName,
          child: (context, args) => const AddOrderPage(),
        ),
      ];
}

class AddOrderPage extends StatefulWidget {
  const AddOrderPage({Key? key}) : super(key: key);
  static const String routeName = "/addOrderPage";

  @override
  State<AddOrderPage> createState() => _AddOrderPageState();
}

final itemsName = <String>[
  "Выбрать все",
  "Напитки",
  "Печенье",
  "Шоколад",
  "Шоколад",
  "Печенье",
];

class _AddOrderPageState extends State<AddOrderPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddOrderCubit, AddOrderState>(
      bloc: AddOrderCubit.to,
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            buildBody(context, state),
            const BottomButtonsAddOrderWidget(),
          ],
        );
      },
    );
  }

  Widget buildBody(BuildContext context, AddOrderState state) {
    return SafeArea(
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
                  color: ColorName.primaryColor,
                ),
                height: 139.h,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppBarIconAddOrder.backAddOrderButtonShelf(
                          () {
                            Modular.to.pop();
                          },
                        ),
                        Row(
                          children: [
                            AppBarIconAddOrder.searchAddOrderButtonShelf(
                              () {},
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            AppBarIconAddOrder.filterAddOrderButtonShelf(
                              () {
                                showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) {
                                    return OrderReconciliationActSheet(
                                      onTap: () {},
                                      text: 'Фильтр',
                                      itemsName: itemsName,
                                    );
                                  },
                                );
                              },
                            ),
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
                        localeKey: "Добавление заказа",
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorName.white,
                        isRichText: true,
                      ).paddingOnly(top: 18.w, left: 20),
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
                    return ItemAddOrderWidget(
                      returnOrderModel: state.list[index],
                      index: index,
                    );
                  },
                ),
              ).paddingOnly(bottom: 150.w)
            ],
          ),
        ),
      ),
    );
  }
}
