import 'package:agent/core/extensions/app_extensions.dart';
import 'package:agent/core/utils/assets.gen.dart' as myIcon;
import 'package:agent/core/utils/colors.gen.dart';
import 'package:agent/ui/widgets/app_widgets.dart';
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
  }) {
    return Expanded(
      flex: flex,
      child: Container(
        alignment: alignment,
        child: AppWidgets.text(
          text: name,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: colors[findColor(name)],
        ),
      ),
    );
  }

  static Widget customDataTableTabs(List<String> list) {
    return Row(
      children: [
        for (var e in list)
          Expanded(
            flex: e == list.last ? 4 : 2,
            child: Column(
              children: [
                Align(
                  alignment: e == list.last
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: AppWidgets.text(
                    text: e,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: ColorName.gray2,
                  ),
                ).marginSymmetric(vertical: 12, horizontal: 12),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                )
              ],
            ),
          ),
      ],
    );
  }

  static Widget customDataTable(List<List<String>> list) {
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
                      alignment: list[i][j] == list[i].last
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                    )
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
