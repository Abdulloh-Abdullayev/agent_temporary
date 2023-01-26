import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/models/return_order_model.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/pages/return_from_shelf/bloc/return_order_cubit.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

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
                  child: Cards.cards_8(
                    context: context,
                    name: model.name!,
                    summa: LocaleKeys.amount.tr(),
                    summaNumber:
                        (ReturnOrderCubit.to.summa(model) * 10000).toString(),
                    blok: LocaleKeys.block.tr(),
                    blokNumber: model.blog.toString(),
                    sht: LocaleKeys.pc.tr(),
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
