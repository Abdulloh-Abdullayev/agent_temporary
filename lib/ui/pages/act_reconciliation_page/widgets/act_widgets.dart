import 'dart:math';

import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart' as myIcon;
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uikit/uikit.dart';

class ActWidget {
  /// TextStyle
  static TextStyle _fontStyle = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: ColorName.white,
  );

  /// TextStyle
  static TextStyle _dataColumnStyle = GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: ColorName.gray2,
  );

  // color
  static List<Color> colors = [
    ColorName.gray3,
    ColorName.green,
    ColorName.black,
    ColorName.red,
  ];

  /// appbar
  static Widget AppBar({
    required String title,
    required String firstText,
    required String buttonText,
    required String dropDownText,
    required Function() backOnTap,
    required Function() firstDataOnTap,
    required Function() secondDataOnTap,
    required Function() buttonOnTap,
    required String firstDate,
    required String secondDate,
    List<Widget>? actions,
  }) {
    var actionList = actions == null ? const [SizedBox.shrink()] : actions;
    return Container(
      height: 267.h,
      width: 1.sw,
      decoration: BoxDecoration(
        color: ColorName.primaryColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppWidgets.buttonBuilder(
                width: 28,
                height: 28,
                redius: 4,
                child: myIcon.Assets.images.icons.backArrow.svg(),
                onTap: buttonOnTap,
              ),
              Row(
                children: [...actionList],
              )
            ],
          ).marginLTRB(20, 19, 20, 18),
          // title
          AppWidgets.textLocale(
            localeKey: title,
            fontSize: 24.sp,
            fontWeight: FontWeight.w600,
            color: ColorName.white,
          ).centerLeft.marginLTRB(20, 0, 20, 18),
          // data
          AppInputDate(
            firstText: firstText,
            dropDownText: dropDownText,
            dropDownTextStyle: GoogleFonts.inter(
              fontSize: 14.sp,
              color: ColorName.white,
              fontWeight: FontWeight.w400,
            ),
            firstTextStyle: GoogleFonts.inter(
              fontSize: 14.sp,
              color: ColorName.white.withOpacity(.5),
              fontWeight: FontWeight.w400,
            ),
            firstDate: firstDate,
            secondDate: secondDate,
            firstIcon: myIcon.Assets.images.icons.calender.svg(),
            secondIcon: myIcon.Assets.images.icons.calender.svg(),
            dateBackColor: ColorName.lightBlue.withOpacity(0.15),
            firstDateTextStyle: _fontStyle,
            secondDateTextStyle: _fontStyle,
            firstDateOnTap: firstDataOnTap,
            SecondDateOnTap: secondDataOnTap,
          ).marginLTRB(20, 0, 20, 18),
          // button text
          AppButton(
            text: buttonText,
            textSize: 16.sp,
            textColor: ColorName.white,
            width: double.infinity,
            onPressed: () {},
          ).marginSymmetric(horizontal: 20)
        ],
      ),
    );
  }

  static Widget customDataTableChild({
    required String name,
    int flex = 1,
    Alignment alignment = Alignment.center,
    bool isSpace = false,
  }) {
    return Expanded(
      flex: flex,
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: alignment,
              // color: Colors.primaries[Random().nextInt(10)],
              child: AppWidgets.text(
                text: name,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: colors[findColor(name)],
              ),
            ),
          ),
          isSpace
              ? Container(
                  height: 10,
                  width: 12,
                  color: Colors.black,
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }

  static Widget customDataTableTabs(
      {required List<String> list,
      List<Alignment>? alins,
      required Function(String) itemOnTap}) {
    if (alins != null) {
      if (list.length != alins.length)
        throw ("list.length != alins.length should be equal");
    }
    return Column(
      children: [
        Row(
          children: [
            for (var i = 0; i < list.length; i++)
              Expanded(
                flex: list[i] == list.last ? 3 : 2,
                child: GestureDetector(
                  onTap: () => itemOnTap(list[i]),
                  dragStartBehavior: DragStartBehavior.down,
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            // color: Colors.primaries[Random().nextInt(10)],
                            child: Align(
                              alignment: alins != null
                                  ? alins[i]
                                  : list[i] == list.last
                                      ? Alignment.centerRight
                                      : list[i] == list.first
                                          ? Alignment.centerLeft
                                          : Alignment.center,
                              child: AppWidgets.text(
                                text: list[i],
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: ColorName.gray2,
                              ),
                            ),
                          ),
                        ),
                        list[i] == list.last
                            ? SizedBox.shrink()
                            : Container(
                                height: 10,
                                width: 12,
                                color: Colors.black,
                              )
                      ],
                    ).marginSymmetric(vertical: 12),
                  ),
                ),
              ),
          ],
        ).marginSymmetric(horizontal: 12),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.grey,
        )
      ],
    );
  }

  static Widget customDataTable(
      {required List<List<String>> list, List<List<Alignment>>? alins}) {
    if (alins != null) {
      if (list.length != alins.length)
        throw ("list.length != alins.length should be equal");
    }
    return Column(
      children: [
        for (var i = 0; i < list.length; i++)
          Column(
            children: [
              Row(
                children: [
                  for (var j = 0; j < list[i].length; j++)
                    customDataTableChild(
                      name: list[i][j],
                      flex: j == list[j].length - 1
                          ? 3
                          : list[i][j].isEmpty
                              ? 1
                              : 2,
                      alignment: alins != null
                          ? alins[i][j]
                          : list[i][j] == list[i].last
                              ? Alignment.centerRight
                              : list[i][j] == list[i].first
                                  ? Alignment.centerLeft
                                  : Alignment.center,
                      isSpace: list[i][j] != list[i].last,
                    ),
                ],
              ).marginSymmetric(vertical: 12, horizontal: 12),
              !(i > list.length - 4)
                  ? Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey,
                    )
                  : SizedBox.shrink()
            ],
          )
      ],
    );
  }

  static int findColor(String text) {
    if (text == "-") {
      return 2;
    }
    if (text.contains("-")) {
      return 3;
    } else if (text.contains("+")) {
      return 1;
    } else if (int.tryParse(
            text.replaceAll(RegExp(r'([a-z]|[A-Z])|\ *'), "")) !=
        null) {
      return 2;
    } else {
      return 0;
    }
  }
}
