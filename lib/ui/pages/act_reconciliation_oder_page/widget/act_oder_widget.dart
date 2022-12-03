import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/uikit.dart';

import '../../../../core/utils/colors.gen.dart';

class ActOderWidget {
  static Widget filterWidget({
    String? firstItemName,
    String? secondItemName,
    required List<String> item1,
    required Function(String key, int index, List<bool> check) item1onTap,
    List<bool>? checkList2,
    List<String>? item2,
  }) {
    return _actBottomSheetFilter(
      item1: item1,
      item2: item2 ?? [],
      itemsOnTap: item1onTap,
      firstItemName: firstItemName,
      secondItemName: secondItemName,
    );
  }

  static List<Widget> childListBuilder(
    List<String>? item,
    List<bool>? checks,
    Function(int index) onTap,
  ) {
    if (item == null) return [];

    return [
      for (int i = 0; i < item.length; i++)
        itemChild(
          item[i],
          checks![i],
          item.length - 1 != i,
          () {
            onTap(i);
          },
        ).marginOnly(top: i == 0 ? 8 : 0)
    ];
  }

  static Widget itemChild(
      String text, bool checked, bool isBottomBorder, Function() ontap) {
    return Column(
      children: [
        Row(
          children: [
            AppCheckBox(
              onTap: ontap,
              isCheck: checked,
              checkIcon: Assets.images.icons.check.svg(),
            ).marginOnly(right: 10),
            AppWidgets.text(
              text: text,
              fontSize: 14.sp,
              color: ColorName.gray3,
            )
          ],
        ).marginOnly(bottom: 12),
        isBottomBorder
            ? Container(
                height: 1,
                width: double.infinity,
                color: ColorName.gray,
              ).marginOnly(bottom: 12)
            : SizedBox.shrink()
      ],
    ).marginSymmetric(horizontal: 20);
  }
}

class _actBottomSheetFilter extends StatefulWidget {
  final String? firstItemName;
  final String? secondItemName;
  final List<String> item1;
//  final List<bool> checkList1;
  final List<String> item2;
  final Function(String key, int index, List<bool> checks) itemsOnTap;

  const _actBottomSheetFilter({
    super.key,
    this.firstItemName,
    this.secondItemName,
    required this.item1,
    required this.item2,
    required this.itemsOnTap,
  });

  @override
  State<_actBottomSheetFilter> createState() => __actBottomSheetFilterState();
}

class __actBottomSheetFilterState extends State<_actBottomSheetFilter> {
  List<bool> checkList1 = [];
  List<bool> checkList2 = [];
  @override
  void initState() {
    checkList1 = List<bool>.filled(widget.item1.length, false);
    checkList2 = List<bool>.filled(widget.item2.length, false);
    super.initState();
  }

  clearChecks() {
    setState(() {
      checkList1 = List<bool>.filled(widget.item1.length, false);
      checkList2 = List<bool>.filled(widget.item2.length, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      constraints: BoxConstraints(minHeight: 525.h),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 18),
          //// arrow and cencle button
          Row(
            children: [
              Opacity(
                opacity: 0.0,
                child: Assets.images.icons.cencel.svg(color: ColorName.gray2),
              ),
              Expanded(
                child: Assets.images.icons.arrowDown
                    .svg(color: ColorName.gray2)
                    .center,
              ),
              Assets.images.icons.cencel
                  .svg(color: ColorName.gray2)
                  .onTap(() => Navigator.pop(context)),
            ],
          ).marginSymmetric(horizontal: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.textLocale(
                localeKey: widget.firstItemName!,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
              AppWidgets.textLocale(
                localeKey: widget.secondItemName!,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: ColorName.red,
              ).onTap(clearChecks),
            ],
          ).marginSymmetric(horizontal: 20, vertical: 18),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppWidgets.textLocale(
                    localeKey: "fontWeight",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ).centerLeft.marginLTRB(20, 6, 20, 8),
                  for (int i = 0; i < widget.item1.length; i++)
                    ActOderWidget.itemChild(
                      widget.item1[i],
                      checkList1[i],
                      widget.item1.length - 1 != i,
                      () {
                        setState(() {
                          checkList1[i] = !checkList1[i];
                        });
                        widget.itemsOnTap("1", i, checkList1);
                      },
                    ).marginOnly(top: i == 0 ? 8 : 0),
                  //// item 2 list
                  widget.secondItemName != null
                      ? AppWidgets.textLocale(
                          localeKey: "fontWeight3",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ).centerLeft.marginLTRB(20, 6, 20, 8)
                      : SizedBox.shrink(),
                  ...ActOderWidget.childListBuilder(
                    widget.item2,
                    checkList2,
                    (i) {
                      setState(() {
                        checkList2[i] = !checkList2[i];
                      });
                      widget.itemsOnTap("2", i, checkList2);
                    },
                  )
                ],
              ),
            ),
          ),

          /// save button
          AppWidgets.appButton(
            title: "Save",
            onTap: () {
              Navigator.pop(context);
            },
            color: ColorName.button,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ).marginLTRB(20, 0, 20, 15),
        ],
      ),
    );
  }
}
