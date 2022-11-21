import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uikit/extensions/app_extensions.dart';

class SaleTableItem extends StatefulWidget {
  const SaleTableItem({Key? key}) : super(key: key);

  @override
  State<SaleTableItem> createState() => _SaleTableItemState();
}

class _SaleTableItemState extends State<SaleTableItem> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOpen = !isOpen;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12.w,
          horizontal: 8.w,
        ),
        decoration: BoxDecoration(
          color: isOpen ? ColorName.input : Colors.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      AnimatedRotation(
                        turns: isOpen ? 0.5 : 1,
                        duration: const Duration(milliseconds: 300),
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          size: 12,
                        ),
                      ).paddingOnly(right: 5),
                      AppWidgets.text(
                        text: "Напитки",
                        maxLines: 1,
                        color: ColorName.gray3,
                        fontSize: 12.sp,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AppWidgets.text(
                    text: "30 шт",
                    maxLines: 1,
                    color: ColorName.gray3,
                    fontSize: 12.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AppWidgets.text(
                    text: "-",
                    maxLines: 1,
                    color: ColorName.gray2,
                    fontSize: 12.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: AppWidgets.text(
                    text: "100 000 000",
                    maxLines: 1,
                    color: ColorName.black,
                    fontSize: 12.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            AnimatedContainer(
              height: isOpen?24*4:0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.linearToEaseOut,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) => subItem(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget subItem() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: AppWidgets.text(
            text: "Напитки",
            maxLines: 1,
            color: ColorName.gray2,
            fontSize: 11.sp,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 1,
          child: AppWidgets.text(
            text: "30 шт",
            maxLines: 1,
            color: ColorName.gray2,
            fontSize: 11.sp,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          flex: 2,
          child: AppWidgets.text(
            text: "10 000 000",
            maxLines: 1,
            color: ColorName.gray2,
            fontSize: 11.sp,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    ).paddingSymmetric(vertical: 5, horizontal: 9);
  }
}
