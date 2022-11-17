import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/localization/locale_keys.g.dart';
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'category_remain.dart';

class RemainStockItem extends StatefulWidget {
  RemainStockItem({required this.index, Key? key}) : super(key: key);
  int index;

  @override
  State<RemainStockItem> createState() => _RemainStockItemState();
}

class _RemainStockItemState extends State<RemainStockItem> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isOpen = !isOpen;
              });
            },
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      isOpen = !isOpen;
                    });
                  },
                  child: AnimatedRotation(
                    turns: isOpen ? 0.5 : 1,
                    duration: const Duration(milliseconds: 300),
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                    ),
                  ).paddingOnly(
                    left: 10.w,
                    right: 10.w,
                  ),
                ),
                AppWidgets.text(
                  text: "Napitka",
                  color: ColorName.gray3,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ).paddingSymmetric(
              vertical: 15,
              horizontal: 10,
            ),
          ),
          AnimatedContainer(
            height: isOpen ? null : 0,
            color: ColorName.white,
            duration: const Duration(milliseconds: 300),
            child: Container(
              width: 1.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: ColorName.gray,
                ),
                color: ColorName.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(8),
                      ),
                      color: ColorName.lightBlue,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppWidgets.textLocale(
                          localeKey: LocaleKeys.category,
                          color: ColorName.gray2,
                          fontSize: 12.sp,
                        ),
                        AppWidgets.textLocale(
                          localeKey: LocaleKeys.price,
                          color: ColorName.gray2,
                          fontSize: 12.sp,
                        ),
                        AppWidgets.textLocale(
                          localeKey: LocaleKeys.remainder,
                          color: ColorName.gray2,
                          fontSize: 12.sp,
                        ),
                      ],
                    ).paddingAll(12.w),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: 6,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return const CategoryRemain();
                      }),
                ],
              ),
            ).paddingAll(20.w),
          ),
        ],
      ),
    );
  }
}
