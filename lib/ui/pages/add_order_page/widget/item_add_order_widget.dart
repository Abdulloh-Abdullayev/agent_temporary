import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/models/return_order_model.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/add_order_page/bloc/add_order_cubit.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

class ItemAddOrderWidget extends StatelessWidget {
  const ItemAddOrderWidget({
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
            isRichText: true,
          ),
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
                  child: Cards.cards_7(
                    context: context,
                    name: model.name!,
                    summa: "Summa",
                    summaNumber:
                        (AddOrderCubit.to.summa(model) * 10000).toString(),
                    blok: "Bloc",
                    blokNumber: model.blog.toString(),
                    sht: "Sht",
                    shtNumber: model.count.toString(),
                    image: model.img!,
                    blokRemove: () {
                      AddOrderCubit.to
                          .decrement(returnOrderModel.id!, model.id!);
                    },
                    blokAdd: () {
                      AddOrderCubit.to
                          .increment(returnOrderModel.id!, model.id!);
                    },
                    shtRemove: () {
                      AddOrderCubit.to
                          .decrementSht(returnOrderModel.id!, model.id!);
                    },
                    shtAdd: () {
                      AddOrderCubit.to
                          .incrementSht(returnOrderModel.id!, model.id!);
                    },
                    nalichi: 'В наличие:',
                    nalichiNumber: "22",
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
