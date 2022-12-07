import 'package:agent/core/models/remains_model.dart/remains_model.dart';
import 'package:agent/ui/pages/remains_page/cubit/remains_cubit.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';
import 'package:uikit/uikit.dart';

class RemainsItemWidget extends StatefulWidget {
  final int index;
  final RemainsCategoryModel model;

  const RemainsItemWidget({
    required this.index,
    required this.model,
    Key? key,
  }) : super(key: key);

  @override
  State<RemainsItemWidget> createState() => _RemainsItemWidgetState();
}

class _RemainsItemWidgetState extends State<RemainsItemWidget> {
  bool isOpen = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.text(
                text: widget.model.name!,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
                child: AnimatedRotation(
                  turns: isOpen ? 0.5 : 1,
                  duration: const Duration(milliseconds: 300),
                  child: const Icon(Icons.keyboard_arrow_down),
                ).paddingOnly(left: 10.w),
              ),
            ],
          ),
        ),
        AnimatedContainer(
          height: isOpen ? null : 0,
          duration: const Duration(milliseconds: 300),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: widget.model.list!.length,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var model = widget.model.list![index];
              return Row(
                children: [
                  
                  Cards.cards_9(
                    width: 335.w,
                    name: model.name ?? '',
                    sht: "Шт",
                    shtNumber: "${model.count}",
                    image: model.imgUrl!,
                    shtRemove: () {
                      RemainCubit.to.decrement(widget.model.id!, model.id!);
                    },
                    shtAdd: () {
                      RemainCubit.to.increment(widget.index, index);
                    },
                  ).paddingOnly(top: 12.w),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
