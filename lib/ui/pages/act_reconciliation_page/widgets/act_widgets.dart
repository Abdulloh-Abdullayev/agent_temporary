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
  static Widget appBar({
    required String title,
    required String firstText,
    required String buttonText,
    required String dropDownText,
    required VoidCallback backOnTap,
    required VoidCallback firstDataOnTap,
    required VoidCallback secondDataOnTap,
    required VoidCallback buttonOnTap,
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
                backColor: ColorName.white.withOpacity(0.1),
                child: myIcon.Assets.images.icons.backArrow.svg(),
                onTap: buttonOnTap,
              ),
              Row(
                children: actionList,
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

  static dataColumn(String name, {Alignment align = Alignment.centerLeft}) {
    return DataColumn(
      label: Expanded(
        child: Align(
          alignment: align,
          child: Text(name, style: _dataColumnStyle),
        ),
      ),
    );
  }

  static dataRow(List<String> names, {TextStyle? style}) {
    return DataRow(
      cells: [
        for (var name in names)
          DataCell(
            Align(
              alignment: name == names.last
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Text(
                name,
                style: TextStyle(color: colors[findColor(name)]),
              ),
            ),
          ),
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
